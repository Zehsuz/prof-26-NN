import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../net_service.dart';

part 'net_http_client.g.dart';

/// Назначение: описания запросов
/// Дата создания: 27.05.2026
/// Создал: Захар
@RestApi(callAdapter: ErrorAdapter)
abstract class NetHttpClient {
  factory NetHttpClient(Dio dio, {String? baseUrl}) = _NetHttpClient;

  // Запрос 1: Аватар (изображение)
  @PUT('/userAvatar/{id}')
  @MultiPart()
  Future<dynamic> postProfile(
    @Part(name: 'file', contentType: 'image/png') File file,
    @Path('id') int id,
  );

  // Запрос 2: PDF файл вакансии
  @POST('/vacancy-files/{vacancy_id}')
  @MultiPart()
  Future<dynamic> uploadVacancyFile(
    @Part(name: 'file', contentType: 'application/pdf') File file,
    @Path('vacancy_id') int vacancyId,
  );
}
