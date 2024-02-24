import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/features/course/controller/controller.dart';
import 'package:learning_course_shop/ui/ui.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  const CourseDetailScreen({super.key});

  static const path = '/CourseDetailScreen';

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
  late final int id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    id = args['id'];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      ref
          .read(courseControllerProvider.notifier)
          .getCourseItem(CourseItem(id: id));
      // ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final course = ref.watch(getCourseDetailProvider);

    return PageBase(
      appBar: AppBar(
        title: const Text('Course Detail'),
      ),
      floatingActionButton: course.asData?.value.data?.order?.status == 1 ||
              course.isLoading
          ? null
          : ConfirmButton(
              label: 'Buy',
              onPressed: () async {
                ref.read(appLoaderProvider.notifier).setLoaderValue(true);
                final result =
                    await ref.read(apiCheckoutProvider(courseId: id).future);
                ref.read(appLoaderProvider.notifier).setLoaderValue(false);

                if (context.mounted) {
                  final paymentResult = await context.navigator
                      .pushNamed(PaymentWebViewScreen.path, arguments: {
                    'url': result.data,
                  }) as String;

                  if (paymentResult == 'success') {
                    ref
                        .read(courseControllerProvider.notifier)
                        .getCourseItem(course.asData!.value.data!);
                  }
                }
              },
            ),
      hasBottomGap: true,
      child: course.when(
        data: (response) {
          final course = response.data;
          final message = response.message;

          if (course == null) {
            return Text(message!);
          }

          return ListView(
            shrinkWrap: false,
            children: [
              _Image(course: course),
              _CourseName(course: course),
              _BasicDetails(course: course),
              _CourseDescription(course: course),
              _Tabs(course: course),
            ].separatorListWidget(const SizedBox(height: 16)),
          );
        },
        error: asyncError,
        loading: () => const AppProgressIndicator(),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({required this.course});

  final CourseItem course;

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

  final CourseItem course;

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

class _BasicDetails extends StatelessWidget {
  const _BasicDetails({required this.course});

  final CourseItem course;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            _InstructorName(course: course),
            _ClassDuration(course: course),
          ],
        ),
      ],
    );
  }
}

class _InstructorName extends StatelessWidget {
  const _InstructorName({required this.course});

  final CourseItem course;

  @override
  Widget build(BuildContext context) {
    return IconLabel(
      icon: AppIconsAdaptive.profile,
      label: course.user!.name!,
    );
  }
}

class _ClassDuration extends StatelessWidget {
  const _ClassDuration({required this.course});

  final CourseItem course;

  @override
  Widget build(BuildContext context) {
    return IconLabel(
      icon: AppIconsAdaptive.clock,
      label: course.videoLength?.toString() ?? '',
    );
  }
}

class _CourseDescription extends StatelessWidget {
  const _CourseDescription({required this.course});

  final CourseItem course;

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

  final CourseItem course;

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
