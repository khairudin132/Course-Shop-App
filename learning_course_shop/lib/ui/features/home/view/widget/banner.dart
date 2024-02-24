import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';

class BannerPromotion extends StatefulWidget {
  const BannerPromotion({super.key});

  @override
  State<BannerPromotion> createState() => _BannerPromotionState();
}

class _BannerPromotionState extends State<BannerPromotion> {
  final controller = PageController();

  final height = 200.0;

  final width = double.infinity;

  int index = 0;

  List<Image> get list => [
        Assets.icons.image1.image(
          height: height,
          width: width,
        ),
        Assets.icons.image2.image(
          height: height,
          width: width,
        ),
        Assets.icons.image3.image(
          height: height,
          width: width,
        ),
        Assets.icons.image3.image(
          height: height,
          width: width,
        ),
      ];

  @override
  void initState() {
    super.initState();
    _loopBanner();
  }

  void _loopBanner() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 3));
      index += 1;
      _nextPage();
    }
  }

  void _nextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void _resetPage() {
    index = 0;
    controller.jumpToPage(index);
  }

  @override
  void didChangeDependencies() {
    controller.addListener(() {
      final indexEqualToLastPage = index == list.length - 1;
      if (indexEqualToLastPage) {
        _resetPage();
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView(
        controller: controller,
        children: list,
      ),
    );
  }
}
