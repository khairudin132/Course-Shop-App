import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/ui.dart';

class LessonDetailScreen extends StatelessWidget {
  const LessonDetailScreen({super.key});

  static const path = '/LessonDetailScreen';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    final lesson = arg['lesson'] as LessonItem;

    return PageBase(
      appBar: AppBar(
        title: const Text('Lesson Detail'),
      ),
      hasBottomGap: true,
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        shrinkWrap: false,
        children: [
          // _Image(course: course),
          const VideoPlayerScreen(),
          // _CourseName(course: course),
          // _BasicDetails(course: course),
          // _CourseDescription(course: course),
          // _Tabs(course: course),
        ].separatorListWidget(const SizedBox(height: 16)),
      ),
    );
  }
}

class _VideoPlayer extends StatelessWidget {
  const _VideoPlayer({required this.course});

  final LessonItem course;

  @override
  Widget build(BuildContext context) {
    return CachedContainer(
      imageUrl: course.thumbnail ?? '',
      width: double.infinity,
      height: 200,
      borderRadius: BorderRadius.circular(Constant.radius),
    );
  }
}

class _CourseName extends StatelessWidget {
  const _CourseName({required this.course});

  final LessonItem course;

  @override
  Widget build(BuildContext context) {
    return Text(
      course.name ?? '',
      style: context.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

// class _BasicDetails extends StatelessWidget {
//   const _BasicDetails({required this.course});

//   final LessonItem course;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Column(
//           children: [
//             _InstructorName(course: course),
//             _ClassDuration(course: course),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class _InstructorName extends StatelessWidget {
//   const _InstructorName({required this.course});

//   final LessonItem course;

//   @override
//   Widget build(BuildContext context) {
//     return IconLabel(
//       icon: AppIconsAdaptive.profile,
//       label: course.user!.name!,
//     );
//   }
// }

// class _ClassDuration extends StatelessWidget {
//   const _ClassDuration({required this.course});

//   final LessonItem course;

//   @override
//   Widget build(BuildContext context) {
//     return IconLabel(
//       icon: AppIconsAdaptive.clock,
//       label: course.videoLength?.toString() ?? '',
//     );
//   }
// }

class _CourseDescription extends StatelessWidget {
  const _CourseDescription({required this.course});

  final LessonItem course;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: context.textTheme.titleMedium,
        ),
        ExpandableText(
          text: course.description ?? '',
        ),
      ],
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({required this.course});

  final LessonItem course;

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      tabs: [
        TabViewItem(
          label: 'Lessons',
          view: LessonList(courseId: course.id!),
        ),
        TabViewItem(
          label: 'Instructors',
          view: Center(child: Text('Instructors')),
        ),
        TabViewItem(
          label: 'Reviews',
          view: Center(child: Text('Reviews')),
        ),
      ],
    );
  }
}
