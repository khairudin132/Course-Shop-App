import 'dart:convert';

class GetCheckoutApiResponse {
  GetCheckoutApiResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  String? data;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory GetCheckoutApiResponse.fromMap(Map<String, dynamic> map) {
    return GetCheckoutApiResponse(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null ? map['data'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCheckoutApiResponse.fromJson(String source) =>
      GetCheckoutApiResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
