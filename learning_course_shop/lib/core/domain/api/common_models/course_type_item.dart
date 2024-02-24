// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CourseTypeItem {
  CourseTypeItem({
    this.id,
    this.title,
  });

  int? id;
  String? title;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }

  factory CourseTypeItem.fromMap(Map<String, dynamic> map) {
    return CourseTypeItem(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseTypeItem.fromJson(String source) =>
      CourseTypeItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
