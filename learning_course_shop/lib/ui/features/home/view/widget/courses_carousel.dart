import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/ui.dart';

import '../../controller/controller.dart';

class CoursesCarouselCategory extends StatelessWidget {
  const CoursesCarouselCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SectionHeader(header: 'Courses'),
        ),
        _CategoryList(),
        _CourseList(),
      ],
    );
  }
}

class _CategoryList extends ConsumerWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(courseCategoryProvider);

    return state.when(
      data: (response) {
        final message = response.message;
        final listOfCourseType = response.data;

        if (listOfCourseType.isNullOrEmpty) {
          return Text(message!);
        }

        int showCourseTypeLength = listOfCourseType!.take(4).length;

        int remainingCourseTypeLength =
            listOfCourseType.length - showCourseTypeLength;

        return SizedBox(
          height: 80,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: showCourseTypeLength <= 3
                ? showCourseTypeLength + 1
                : showCourseTypeLength + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: _Chip(
                    index: index,
                    type: CourseTypeItem(
                      id: 0,
                      title: 'All',
                    ),
                  ),
                );
              }

              if (index == (showCourseTypeLength + 1)) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: _Chip(
                    index: index,
                    type: CourseTypeItem(
                      id: -1,
                      title: '+ $remainingCourseTypeLength',
                    ),
                  ),
                );
              }

              return _Chip(
                index: index,
                type: listOfCourseType[index - 1],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return const SizedBox();
      },
      loading: () {
        return const SizedBox();
      },
    );
  }
}

class _Chip extends ConsumerWidget {
  const _Chip({
    required this.index,
    required this.type,
  });

  final int index;
  final CourseTypeItem type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(courseTypeIndexProvider).index == index;

    return SelectChipButton(
      label: type.title!,
      selected: selected,
      onSelected: (value) {
        if (type.id == -1) {
          // TODO go to full page list of courses
          return;
        }

        ref.read(courseTypeIndexProvider.notifier).state = CourseTypeIndex(
          index: index,
          typeItem: type,
        );
      },
    );
  }
}

class _CourseList extends ConsumerWidget {
  const _CourseList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(getCoursesNotifiedByTypeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: courses.when(
        data: (response) {
          final message = response.message;
          final courses = response.data;

          if (courses.isNullOrEmpty) {
            return Text(message!);
          }

          int showCourseTypeLength = courses!.take(6).length;

          int remainingCourseTypeLength = courses.length - showCourseTypeLength;

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              if (index == 5 && remainingCourseTypeLength > 0) {
                return _CourseCard(
                  course: courses[index],
                  remainingCourses: remainingCourseTypeLength,
                  onTap: () =>
                      context.navigator.pushNamed(CourseListScreen.path),
                );
              }

              return _CourseCard(
                course: courses[index],
                onTap: () => context.navigator.pushNamed(
                  CourseDetailScreen.path,
                  arguments: {
                    'id': courses[index].id,
                  },
                ),
              );
            },
            itemCount: showCourseTypeLength,
          );
        },
        error: (error, s) => const SizedBox(),
        loading: () => Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          child: const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({
    required this.course,
    this.remainingCourses,
    required this.onTap,
  });

  final CourseItem course;
  final int? remainingCourses;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Image
            CachedContainer(
              imageUrl: course.thumbnail ?? '',
              width: double.infinity,
              height: double.infinity,
              borderRadius: BorderRadius.circular(Constant.radius),
            ),

            // Blur effect
            if (remainingCourses != null)
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Constant.radius),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
              ),

            // Texts
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (remainingCourses == null)
                  Text(
                    course.name ?? '',
                    style: context.textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                if (remainingCourses != null)
                  Text(
                    '+ $remainingCourses more',
                    style: context.textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
