// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LessonVideoItem {
  LessonVideoItem({
    this.name,
    this.thumbnail,
    this.url,
  });

  String? name;
  String? thumbnail;
  String? url;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'thumbnail': thumbnail,
      'url': url,
    };
  }

  factory LessonVideoItem.fromMap(Map<String, dynamic> map) {
    return LessonVideoItem(
      name: map['name'] != null ? map['name'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonVideoItem.fromJson(String source) =>
      LessonVideoItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
