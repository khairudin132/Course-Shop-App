// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:learning_course_shop/core/core.dart';

class LessonItem {
  LessonItem({
    this.id,
    this.courseId,
    this.name,
    this.thumbnail,
    this.description,
    this.video,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? courseId;
  String? name;
  String? thumbnail;
  String? description;
  List<LessonVideoItem>? video;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'course_id': courseId,
      'name': name,
      'thumbnail': thumbnail,
      'description': description,
      'video': video?.map((x) => x.toMap()).toList(),
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory LessonItem.fromMap(Map<String, dynamic> map) {
    return LessonItem(
      id: map['id'] != null ? map['id'] as int : null,
      courseId: map['course_id'] != null ? map['course_id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      video: map['video'] != null
          ? List<LessonVideoItem>.from(
              (map['video'] as List<dynamic>).map<LessonVideoItem?>(
                (x) => LessonVideoItem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonItem.fromJson(String source) =>
      LessonItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
