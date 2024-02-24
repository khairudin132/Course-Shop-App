// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Order {
  Order({
    this.id,
    this.userToken,
    this.totalAmount,
    this.courseId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userToken;
  String? totalAmount;
  int? courseId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Order.empty() {
    id = null;
    userToken = null;
    totalAmount = null;
    courseId = null;
    status = null;
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_token': userToken,
      'total_amount': totalAmount,
      'course_id': courseId,
      'status': status,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] != null ? map['id'] as int : null,
      userToken: map['user_token'] != null ? map['user_token'] as String : null,
      totalAmount:
          map['total_amount'] != null ? map['total_amount'] as String : null,
      courseId: map['course_id'] != null ? map['course_id'] as int : null,
      status: map['status'] != null ? map['status'] as int : null,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
