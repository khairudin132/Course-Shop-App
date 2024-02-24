import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/features/course/controller/controller.dart';
import 'package:learning_course_shop/ui/ui.dart';

class CourseListScreen extends ConsumerWidget {
  const CourseListScreen({super.key});

  static const path = '/CourseListScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageBase(
      appBar: AppBar(
        title: const Text('Course List'),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: Icon(AppIconsAdaptive.filter),
            );
          }),
        ],
      ),
      endDrawer: const CategoryEndDrawer(),
      child: RefreshIndicator.adaptive(
        onRefresh: () => ref.refresh(getCoursesNotifiedByTypeProvider.future),
        child: const _CourseList(),
      ),
    );
  }
}

class _CourseList extends ConsumerWidget {
  const _CourseList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(getCoursesNotifiedByTypeProvider);

    return courses.when(
      data: (response) {
        final message = response.message;
        final courses = response.data;

        return ListViewSeparatedItem<CourseItem>(
          list: courses,
          message: message,
          itemBuilder: (context, index) {
            return _CourseCard(course: courses![index]);
          },
        );
      },
      error: asyncError,
      loading: () => const AppProgressIndicator(),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({required this.course});

  final CourseItem course;

  @override
  Widget build(BuildContext context) {
    return PressabledCardTile(
      onTap: () => context.navigator.pushNamed(
        CourseDetailScreen.path,
        arguments: {
          'id': course.id,
        },
      ),
      imageUrl: course.thumbnail ?? '',
      detail: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            course.name ?? '',
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
          Text(course.user?.name ?? ''),
        ],
      ),
    );
  }
}
