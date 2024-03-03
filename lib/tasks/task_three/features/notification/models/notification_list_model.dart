// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationListModel {
  String? status;
  String? message;
  dynamic error;
  Data? data;
  NotificationListModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  NotificationListModel copyWith({
    String? status,
    String? message,
    dynamic error,
    Data? data,
  }) {
    return NotificationListModel(
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

  factory NotificationListModel.fromMap(Map<String, dynamic> map) {
    return NotificationListModel(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      error: map['error'] as dynamic,
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationListModel.fromJson(String source) => NotificationListModel.fromMap(json.decode(source) as Map<String, dynamic>);

}

class Data {
  int? totalunread;
  List<Result>? results;
  Data({
    this.totalunread,
    this.results,
  });

  Data copyWith({
    int? totalunread,
    List<Result>? results,
  }) {
    return Data(
      totalunread: totalunread ?? this.totalunread,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalunread': totalunread,
      'results': results?.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      totalunread: map['totalunread'] != null ? map['totalunread'] as int : null,
      results: map['results'] != null ? List<Result>.from((map['results']).map<Result?>((x) => Result.fromMap(x),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source) as Map<String, dynamic>);

}

class Result {
  int? id;
  int? user_id;
  String? image;
  String? title;
  String? description;
  String? read_status;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  Result({
    this.id,
    this.user_id,
    this.image,
    this.title,
    this.description,
    this.read_status,
    this.created_at,
    this.updated_at,
    this.deleted_at,
  });

  Result copyWith({
    int? id,
    int? user_id,
    String? image,
    String? title,
    String? description,
    String? read_status,
    String? created_at,
    String? updated_at,
    String? deleted_at,
  }) {
    return Result(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      read_status: read_status ?? this.read_status,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'image': image,
      'title': title,
      'description': description,
      'read_status': read_status,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      id: map['id'] != null ? map['id'] as int : null,
      user_id: map['user_id'] != null ? map['user_id'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      read_status: map['read_status'] != null ? map['read_status'] as String : null,
      created_at: map['created_at'] != null ? map['created_at'] as String : null,
      updated_at: map['updated_at'] != null ? map['updated_at'] as String : null,
      deleted_at: map['deleted_at'] != null ? map['deleted_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source) as Map<String, dynamic>);

}
