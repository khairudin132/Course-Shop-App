// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:learning_course_shop/core/domain/api/common_models/common_models.dart';

class GetCourseTypesApiResponse {
  GetCourseTypesApiResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<CourseTypeItem>? data;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory GetCourseTypesApiResponse.fromMap(Map<String, dynamic> map) {
    return GetCourseTypesApiResponse(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<CourseTypeItem>.from(
              (map['data'] as List<dynamic>).map<CourseTypeItem?>(
                (x) => CourseTypeItem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCourseTypesApiResponse.fromJson(String source) =>
      GetCourseTypesApiResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
