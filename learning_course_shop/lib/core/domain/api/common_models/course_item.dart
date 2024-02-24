import 'dart:convert';

import 'package:learning_course_shop/core/domain/domain.dart';

class CourseItem {
  CourseItem({
    this.id,
    this.userToken,
    this.name,
    this.thumbnail,
    this.video,
    this.description,
    this.typeId,
    this.price,
    this.lessonNum,
    this.videoLength,
    this.follow,
    this.score,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.order,
  });

  int? id;
  String? userToken;
  String? name;
  String? thumbnail;
  String? video;
  String? description;
  int? typeId;
  String? price;
  int? lessonNum;
  int? videoLength;
  int? follow;
  double? score;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserProfile? user;
  Order? order;

  CourseItem.empty() {
    id = null;
    userToken = null;
    name = null;
    thumbnail = null;
    video = null;
    description = null;
    typeId = null;
    price = null;
    lessonNum = null;
    videoLength = null;
    follow = null;
    score = null;
    createdAt = null;
    updatedAt = null;
    user = UserProfile.empty();
    order = Order.empty();
  }

  CourseItem copyWith({
    int? id,
    String? userToken,
    String? name,
    String? thumbnail,
    String? video,
    String? description,
    int? typeId,
    String? price,
    int? lessonNum,
    int? videoLength,
    int? follow,
    double? score,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserProfile? user,
    Order? order,
  }) {
    return CourseItem(
      id: id ?? this.id,
      userToken: userToken ?? this.userToken,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      video: video ?? this.video,
      description: description ?? this.description,
      typeId: typeId ?? this.typeId,
      price: price ?? this.price,
      lessonNum: lessonNum ?? this.lessonNum,
      videoLength: videoLength ?? this.videoLength,
      follow: follow ?? this.follow,
      score: score ?? this.score,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userToken': userToken,
      'name': name,
      'thumbnail': thumbnail,
      'video': video,
      'description': description,
      'typeId': typeId,
      'price': price,
      'lessonNum': lessonNum,
      'videoLength': videoLength,
      'follow': follow,
      'score': score,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'user': user?.toMap(),
      'order': order?.toMap(),
    };
  }

  factory CourseItem.fromMap(Map<String, dynamic> map) {
    return CourseItem(
      id: map['id'] != null ? map['id'] as int : null,
      userToken: map['user_token'] != null ? map['user_token'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      video: map['video'] != null ? map['video'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      typeId: map['type_id'] != null ? map['type_id'] as int : null,
      price: map['price'] != null ? map['price'] as String : null,
      lessonNum: map['lesson_num'] != null ? map['lesson_num'] as int : null,
      videoLength:
          map['video_length'] != null ? map['video_length'] as int : null,
      follow: map['follow'] != null ? map['follow'] as int : null,
      score: map['score'] != null ? map['score'] as double : null,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
      user: map['user'] != null
          ? UserProfile.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      order: map['order'] != null
          ? Order.fromMap(map['order'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseItem.fromJson(String source) =>
      CourseItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
