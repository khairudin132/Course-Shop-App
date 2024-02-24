import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/ui.dart';

class LessonList extends ConsumerWidget {
  const LessonList({
    super.key,
    required this.courseId,
  });

  final int courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(apiGetLessonsProvider(courseId: courseId));

    return lessons.when(
      data: (response) {
        final message = response.message;
        final lessons = response.data;

        return ListViewSeparatedItem<LessonItem>(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          list: lessons,
          message: message,
          itemBuilder: (context, index) {
            return _LessonCard(lesson: lessons![index]);
          },
        );
      },
      error: asyncError,
      loading: () => const AppProgressIndicator(),
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({required this.lesson});

  final LessonItem lesson;

  @override
  Widget build(BuildContext context) {
    return PressabledCardTile(
      onTap: () => context.navigator.pushNamed(
        VideoPlayerScreen.path,
        // arguments: {
        //   'lesson': lesson,
        // },
      ),
      imageUrl: lesson.thumbnail ?? '',
      detail: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            lesson.name ?? '',
            style: context.textTheme.titleMedium,
          ),
          // TODO: rating
          // Row(
          //   children: List.generate(5, (index) {
          //     return Icon(
          //       index < rating ? Icons.star : Icons.star_border,
          //       color: Colors.amber,
          //     );
          //   }),
          // ),
          // Text(lesson.user?.name ?? ''),
        ],
      ),
    );
  }
}
