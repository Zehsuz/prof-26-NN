// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  name: json['name'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String?,
  created: DateTime.parse(json['created'] as String),
  updated: DateTime.parse(json['updated'] as String),
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
    };

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
  record: UserResponse.fromJson(json['record'] as Map<String, dynamic>),
  token: json['token'] as String,
);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{'record': instance.record, 'token': instance.token};

AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) => AuthRequest(
  identity: json['identity'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$AuthRequestToJson(AuthRequest instance) =>
    <String, dynamic>{
      'identity': instance.identity,
      'password': instance.password,
    };
