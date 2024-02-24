import 'package:flutter/material.dart';
import 'package:learning_course_shop/ui/ui.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewScreen extends StatefulWidget {
  const PaymentWebViewScreen({super.key});

  static const path = '/PaymentWebViewScreen';

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    final paymentWebViewUrl = arg['url'] as String;

    controller = WebViewController()
      ..loadRequest(
        Uri.parse(paymentWebViewUrl),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'Pay',
        onMessageReceived: (message) {
          debugPrint(message.message);
          Navigator.of(context).pop(message.message);
        },
      );
  }

  @override
  void dispose() {
    controller.clearCache();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: WebViewStack(controller: controller),
    );
  }
}
