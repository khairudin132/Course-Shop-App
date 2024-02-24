import 'dart:convert';

import 'common_models/user_profile.dart';

class SignInApiRequest {
  SignInApiRequest({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.uid,
    this.online,
  });

  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? uid;
  int? online;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'name': name,
      'description': description,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'uid': uid,
      'online': online,
    };
  }

  factory SignInApiRequest.fromMap(Map<String, dynamic> map) {
    return SignInApiRequest(
      type: map['type'] != null ? map['type'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      online: map['online'] != null ? map['online'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInApiRequest.fromJson(String source) =>
      SignInApiRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SignInApiResponse {
  SignInApiResponse({
    this.status,
    this.message,
    this.data,
    this.errors,
  });

  bool? status;
  String? message;
  UserProfile? data;
  Map<String, dynamic>? errors;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.toMap(),
      'errors': errors,
    };
  }

  factory SignInApiResponse.fromMap(Map<String, dynamic> map) {
    return SignInApiResponse(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? UserProfile.fromMap(map['data'] as Map<String, dynamic>)
          : null,
      errors: map['errors'] != null
          ? Map<String, dynamic>.from((map['errors'] as Map<String, dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInApiResponse.fromJson(String source) =>
      SignInApiResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
