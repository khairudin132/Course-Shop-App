// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../domain.dart';

class GetCourseDetailApiResponse {
  GetCourseDetailApiResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  CourseItem? data;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory GetCourseDetailApiResponse.fromMap(Map<String, dynamic> map) {
    return GetCourseDetailApiResponse(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? CourseItem.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCourseDetailApiResponse.fromJson(String source) =>
      GetCourseDetailApiResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
