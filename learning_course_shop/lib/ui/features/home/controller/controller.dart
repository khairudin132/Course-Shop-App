import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/features/home/model/state.dart';

final initialiseApiProvider = FutureProvider((ref) {
  return ref.read(homeControllerProvider.notifier).initialiseApi();
});

final courseTypeIndexProvider = StateProvider((ref) {
  final typeIndex = ref.read(homeControllerProvider).courseTypeIndex;

  return typeIndex;
});

final courseCategoryProvider = FutureProvider(
    (ref) async => await ref.read(apiGetCourseTypesProvider.future));

final getCoursesNotifiedByTypeProvider = FutureProvider((ref) async {
  final id = ref.watch(courseTypeIndexProvider).typeItem.id;
  return await ref.read(apiGetCoursesProvider(
    categoryTypeId: id,
  ).future);
});

final homeControllerProvider = NotifierProvider<HomeController, HomeState>(
  HomeController.new,
);

class HomeController extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(
      courseTypeIndex: CourseTypeIndex(
        index: 0,
        typeItem: CourseTypeItem(
          title: 'All',
        ),
      ),
    );
  }

  Future<void> initialiseApi() async {
    // await Future.wait(
    //   [
    //     ref.read(apiGetCourseTypesProvider.future),
    //     ref.read(apiGetCoursesProvider(
    //       categoryTypeId: state.courseTypeIndex.typeItem.id,
    //     ).future),
    //   ],
    //   eagerError: true,
    // );
  }
}
