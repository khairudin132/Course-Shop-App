
import 'package:learning_course_shop/core/core.dart';

class CourseState {
  const CourseState({
    required this.courseTypeIndex,
    required this.course,
  });

  CourseState copyWith({
    CourseTypeIndex? courseTypeIndex,
    CourseItem? course,
  }) {
    return CourseState(
      courseTypeIndex: courseTypeIndex ?? this.courseTypeIndex,
      course: course ?? this.course,
    );
  }

  final CourseTypeIndex courseTypeIndex;
  final CourseItem course;
}
