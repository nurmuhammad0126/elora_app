import 'package:eloro_app_for_home_work/core/dio/dio_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpService() async {
  _client();
  _datasource();
  _repository();
  _blocs();
}

void _client() {
  getIt.registerFactory(() => DioClient());
}

void _blocs() {}

void _repository() {}

void _datasource() {}
