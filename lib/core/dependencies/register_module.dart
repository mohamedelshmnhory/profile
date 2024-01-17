import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../network/remote/evn_variables.dart';

@module
abstract class RegisterModule {
  //You can register named preemptive types like follows
  @Named("BaseUrl")
  String get baseUrl => EnvVariables.instance().apiBaseUrl!;

  // url here will be injected
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) {
    Dio dio = Dio(BaseOptions(baseUrl: url));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }
}
