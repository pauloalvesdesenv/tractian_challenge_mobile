import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: 'https://fake-api.tractian.com'));
}
