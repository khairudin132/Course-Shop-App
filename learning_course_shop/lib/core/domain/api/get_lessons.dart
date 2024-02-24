import 'dart:convert';

import 'package:learning_course_shop/core/domain/api/common_models/common_models.dart';

class GetLessonsApiResponse {
  GetLessonsApiResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<LessonItem>? data;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory GetLessonsApiResponse.fromMap(Map<String, dynamic> map) {
    return GetLessonsApiResponse(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<LessonItem>.from(
              (map['data'] as List<dynamic>).map<LessonItem?>(
                (x) => LessonItem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetLessonsApiResponse.fromJson(String source) =>
      GetLessonsApiResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
