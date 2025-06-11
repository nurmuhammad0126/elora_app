import 'dart:developer';
import 'package:dio/dio.dart';

import '../../../../core/dio/dio_client.dart';

class HomeDatasourceImpl {
  final DioClient dioClient;

  HomeDatasourceImpl({required this.dioClient});

  Future<Map<String, dynamic>?> fetchProducts(String endpoint) async {
    try {
      log("METHOD TYPE: GET");
      log("METHOD TYPE: $endpoint");
      log("REQUEST BODY: null");

      final response = await dioClient.get(endpoint);

      log("RESPONSE STATUS CODE: ${response.statusCode}");
      log("RESPONSE DATA: ${response.data}");

      if (response.statusCode == 200) {
        if (response.data == null) {
          log("WARNING: Response data is null for $endpoint");
          return null;
        }

        if (response.data is Map<String, dynamic>) {
          return response.data;
        } else {
          log(
            "WARNING: Response data is not Map<String, dynamic> for $endpoint",
          );
          return null;
        }
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'HTTP ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      log("On Error: $e");
      log("ERORR: HomeDatasourceImpl.fetchProducts() => $e");

      if (e.response?.statusCode == 404) {
        throw Exception("Endpoint topilmadi: $endpoint");
      }

      rethrow;
    } catch (e) {
      log("Unexpected error in HomeDatasourceImpl.fetchProducts(): $e");
      throw Exception("Kutilmagan xatolik: $e");
    }
  }
}
