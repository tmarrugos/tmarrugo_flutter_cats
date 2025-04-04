import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.thecatapi.com/v1',
    headers: {
      'x-api-key': 'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr'
    },
  ));

  Future<List<dynamic>> fetchBreeds() async {
    final response = await _dio.get('/breeds');
    return response.data;
  }
}
