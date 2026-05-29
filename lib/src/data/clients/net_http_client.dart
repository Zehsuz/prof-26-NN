import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../net_service.dart';

part 'net_http_client.g.dart';

/// Назначение: описания запросов
/// Дата создания: 27.05.2026
/// Создал: Захар
@RestApi(callAdapter: ErrorAdapter)
abstract class NetHttpClient implements AuthHttpClient {
  factory NetHttpClient(Dio dio, {String? baseUrl}) = _NetHttpClient;

  @POST('/users/qwe/{id}')
  Future<void> pathProfile(@Path('id') String request);

  @POST('/user/qwe')
  @MultiPart()
  Future<AuthResponse> postProfile(
    //   через rootBundle как с llm
    @Part(name: 'file') File file,
    @Query('id') int id,
  );

  @GET('/user/qwe')
  Future<Uint8List> getProfile(
    @Query('id') int id,
  );

  @PUT('/user/qwe')
  Future<UserResponse> updateProfile(
    @Path('id') int id, @Body()
      UserRegRequest request
  );

  @PUT('/user/qwe')
  Future<UserResponse> queryProfile(
    @Query('id') int? id,
    @Query('qwe') int? qwe,
    @Query('search') int? search,
      @Body()
      UserRegRequest request
  );
}
