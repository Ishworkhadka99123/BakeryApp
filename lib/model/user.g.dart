// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uId: json['uId'] as int? ?? 0,
      userId: json['_id'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uId': instance.uId,
      '_id': instance.userId,
      'fname': instance.fname,
      'lname': instance.lname,
      'email': instance.email,
      'password': instance.password,
    };
