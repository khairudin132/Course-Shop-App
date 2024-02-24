// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserProfile {
  UserProfile({
    this.id,
    this.accessToken,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  });

  int? id;
  String? accessToken;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;

  // named constructor empty()
  UserProfile.empty() {
    id = null;
    accessToken = null;
    token = null;
    name = null;
    description = null;
    avatar = null;
    online = null;
    type = null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'accessToken': accessToken,
      'token': token,
      'name': name,
      'description': description,
      'avatar': avatar,
      'online': online,
      'type': type,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] != null ? map['id'] as int : null,
      accessToken:
          map['access_token'] != null ? map['access_token'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      online: map['online'] != null ? map['online'] as int : null,
      type: map['type'] != null ? map['type'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);
}
