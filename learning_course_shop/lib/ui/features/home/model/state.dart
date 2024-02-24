// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learning_course_shop/core/core.dart';

class HomeState  {
  const HomeState({
    required this.courseTypeIndex,
  });

  HomeState copyWith({
    CourseTypeIndex? courseTypeIndex,
  }) {
    return HomeState(
      courseTypeIndex: courseTypeIndex ?? this.courseTypeIndex,
    );
  }

  final CourseTypeIndex courseTypeIndex;


}
