import 'package:eloro_app_for_home_work/core/dio/dio_client.dart';
import 'package:eloro_app_for_home_work/features/cart/data/datasource/cart_local_datasource.dart';
import 'package:eloro_app_for_home_work/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:eloro_app_for_home_work/features/home/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/cart/data/repository/cart_repository.dart';
import '../../features/home/data/datasource/home_datasource.dart';
import '../../features/home/data/repository/home_repository.dart';

final getIt = GetIt.instance;

Future<void> setUpService() async {
  _client();
  _datasource();
  _repository();
  _blocs();
}

void _client() {
  getIt.registerSingleton(DioClient());
}

void _datasource() {
  getIt
    ..registerLazySingleton(() => HomeDatasourceImpl(dioClient: getIt<DioClient>()),
    )
    ..registerLazySingleton(() => CartLocalDatasource())
    ..registerLazySingleton(() => CartLocalDatasource());
}

void _repository() {
  getIt
    ..registerLazySingleton(
      () => HomeRepositoryImpl(homeDatasourceImpl: getIt<HomeDatasourceImpl>()),
    )
    ..registerLazySingleton(() => CartRepository(getIt<CartLocalDatasource>()))
    ..registerLazySingleton(() => CartRepository(getIt<CartLocalDatasource>()));
}

void _blocs() {
  getIt
    ..registerFactory(() => ProductsBloc(getIt<HomeRepositoryImpl>()))
    ..registerFactory(() => CartBloc(getIt<CartRepository>()));
}
