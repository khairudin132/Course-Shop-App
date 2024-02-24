import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';

import 'package:learning_course_shop/ui/features/home/controller/controller.dart';
import 'package:learning_course_shop/ui/ui.dart';

import '../widget/widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(initialiseApiProvider);
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen(initialiseApiProvider, (previous, next) {
    //   if (previous == next) return;

    //   next.when(
    //     data: (data) {},
    //     error: (e, s) async {
    //       if (context.mounted) {
    //         await showAppAlertDialog(
    //           context,
    //           title: 'Warning',
    //           message: e.toString(),
    //           // errors: e.toString(),
    //         );
    //       }
    //     },
    //     loading: () {},
    //   );
    // });

    return PageBase(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GreetName(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
        centerTitle: false,
      ),
      hasBodyPadding: false,
      child: RefreshIndicator.adaptive(
        onRefresh: () => Future.wait([
          ref.refresh(apiGetCourseTypesProvider.future),
          ref.refresh(getCoursesNotifiedByTypeProvider.future),
        ]),
        child: ListView(
          children: [
            // _GreetName(),
            // const BannerPromotion(),
            CoursesCarouselCategory(),
          ],
        ),
      ),
    );
  }
}
