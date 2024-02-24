import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/features/course/controller/controller.dart';
import 'package:learning_course_shop/ui/ui.dart';

class CategoryEndDrawer extends ConsumerStatefulWidget {
  const CategoryEndDrawer({super.key});

  @override
  ConsumerState<CategoryEndDrawer> createState() => _CategoryEndDrawerState();
}

class _CategoryEndDrawerState extends ConsumerState<CategoryEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: _CategoryList(),
    );
  }
}

class _CategoryList extends ConsumerWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(apiGetCourseTypesProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: category.when(
        data: (response) {
          final message = response.message;
          final listOfCourseType = response.data;

          if (listOfCourseType.isNullOrEmpty) {
            return Text(message!);
          }

          return Wrap(
            runSpacing: 8.0,
            spacing: 10.0,
            children: [
              for (var i = 0; i < listOfCourseType!.length + 1; i++)
                if (i == 0)
                  _Chip(
                    index: i,
                    type: CourseTypeItem(
                      id: 0,
                      title: 'All',
                    ),
                  )
                else
                  _Chip(
                    index: i,
                    type: listOfCourseType[i - 1],
                  ),
            ],
          );
        },
        error: (error, stackTrace) {
          return const SizedBox();
        },
        loading: () {
          return const SizedBox();
        },
      ),
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
        ref.read(courseTypeIndexProvider.notifier).state = CourseTypeIndex(
          index: index,
          typeItem: type,
        );
        Scaffold.of(context).closeEndDrawer();
      },
    );
  }
}
