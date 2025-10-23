import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient(String baseUrl)
      : dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<String> sendMessage(String message, List history) async {
    final response = await dio.post('/chat', data: {
      "message": message,
      "history": history,
    });
    return response.data['answer'];
  }
}
