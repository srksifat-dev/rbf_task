// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  
  String? status;
  
  String? message;
  
  dynamic error;
  
  Data? data;
  LoginModel({
    this.status,
    this.message,
    required this.error,
    this.data,
  });

  LoginModel copyWith({
    String? status,
    String? message,
    dynamic error,
    Data? data,
  }) {
    return LoginModel(
      status: status ?? this.status,
      message: message ?? this.message,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'error': error,
      'data': data?.toMap(),
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      error: map['error'] as dynamic,
      data: map['data'] != null
          ? Data.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Data {
  
  UserDetails? user_details;
  
  String? token;
  Data({
    this.user_details,
    this.token,
  });

  Data copyWith({
    UserDetails? user_details,
    String? token,
  }) {
    return Data(
      user_details: user_details ?? this.user_details,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_details': user_details?.toMap(),
      'token': token,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      user_details: map['user_details'] != null
          ? UserDetails.fromMap(map['user_details'] as Map<String, dynamic>)
          : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);
}

class UserDetails {
  
  int? id;
  
  String? name;
  
  String? email;
  
  String? phone;
  
  String? nid;
  
  String? gender;
  
  String? image;
  
  String? present_address;
  
  String? permanent_address;
  
  String? medium;
  
  String? sync;
  
  String? email_verified;
  
  String? phone_verified;
  
  String? created_at;
  
  String? updated_at;
  
  String? deleted_at;
  UserDetails({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.nid,
    this.gender,
    this.image,
    this.present_address,
    this.permanent_address,
    this.medium,
    this.sync,
    this.email_verified,
    this.phone_verified,
    this.created_at,
    this.updated_at,
    this.deleted_at,
  });

  UserDetails copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? nid,
    String? gender,
    String? image,
    String? present_address,
    String? permanent_address,
    String? medium,
    String? sync,
    String? email_verified,
    String? phone_verified,
    String? created_at,
    String? updated_at,
    String? deleted_at,
  }) {
    return UserDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      nid: nid ?? this.nid,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      present_address: present_address ?? this.present_address,
      permanent_address: permanent_address ?? this.permanent_address,
      medium: medium ?? this.medium,
      sync: sync ?? this.sync,
      email_verified: email_verified ?? this.email_verified,
      phone_verified: phone_verified ?? this.phone_verified,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'nid': nid,
      'gender': gender,
      'image': image,
      'present_address': present_address,
      'permanent_address': permanent_address,
      'medium': medium,
      'sync': sync,
      'email_verified': email_verified,
      'phone_verified': phone_verified,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      nid: map['nid'] != null ? map['nid'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      present_address: map['present_address'] != null
          ? map['present_address'] as String
          : null,
      permanent_address: map['permanent_address'] != null
          ? map['permanent_address'] as String
          : null,
      medium: map['medium'] != null ? map['medium'] as String : null,
      sync: map['sync'] != null ? map['sync'] as String : null,
      email_verified: map['email_verified'] != null
          ? map['email_verified'] as String
          : null,
      phone_verified: map['phone_verified'] != null
          ? map['phone_verified'] as String
          : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
      deleted_at:
          map['deleted_at'] != null ? map['deleted_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}
