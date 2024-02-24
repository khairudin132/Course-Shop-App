import 'dart:convert';

import 'package:learning_course_shop/core/domain/api/common_models/common_models.dart';

class GetCoursesApiResponse {
  GetCoursesApiResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<CourseItem>? data;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory GetCoursesApiResponse.fromMap(Map<String, dynamic> map) {
    return GetCoursesApiResponse(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<CourseItem>.from(
              (map['data'] as List<dynamic>).map<CourseItem?>(
                (x) => CourseItem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCoursesApiResponse.fromJson(String source) =>
      GetCoursesApiResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
