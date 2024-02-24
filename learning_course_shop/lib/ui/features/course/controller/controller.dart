import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/core/services/databases/network_service/api_clients/get_course_detail.dart';
import 'package:learning_course_shop/ui/features/course/model/state.dart';

final courseTypeIndexProvider = StateProvider.autoDispose(
    (ref) => ref.read(courseControllerProvider).courseTypeIndex);

final getCoursesNotifiedByTypeProvider =
    FutureProvider.autoDispose((ref) async {
  final id = ref.watch(courseTypeIndexProvider).typeItem.id;
  return await ref.read(apiGetCoursesProvider(
    categoryTypeId: id,
  ).future);
});

final getCourseDetailProvider = FutureProvider.autoDispose((ref) async {
  final id = ref.watch(courseControllerProvider).course.id;
  return await ref.read(apiGetCourseDetailProvider(courseId: id!).future);
});

final courseControllerProvider =
    NotifierProvider<CourseController, CourseState>(CourseController.new);

class CourseController extends Notifier<CourseState> {
  @override
  CourseState build() {
    return CourseState(
      courseTypeIndex: CourseTypeIndex(
        index: 0,
        typeItem: CourseTypeItem(
          title: 'All',
        ),
      ),
      course: CourseItem.empty(),
    );
  }

  void getCourseItem(CourseItem course) {
    state = state.copyWith(course: course);
  }
}
