import 'dart:developer';

import '../../../../core/dio/dio_client.dart';

abstract class HomeDatasource {
  Future<Map> fetchProducts(String url);
}

class HomeDatasourceImpl implements HomeDatasource {
  final DioClient _dioClient;

  HomeDatasourceImpl({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<Map<String,dynamic>> fetchProducts(String url) async {
    try {
      final res = await _dioClient.get(url);

      final Map<String, dynamic> data = res.data;

      return data;
    } catch (e) {
      log("ERORR: HomeDatasourceImpl.fetchProducts() => $e");
      throw Exception(e);
    }
  }
}
