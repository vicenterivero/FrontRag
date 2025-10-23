import '../../core/api_client.dart';
import '../../core/models.dart';
import 'dart:async';
class ChatRepository {
  final ApiClient client;
  ChatRepository(this.client);

  Future<String> ask(String message, List<Message> history) async {
    final historyJson = history.map((m) => m.toJson()).toList();
   return await client
      .sendMessage(message, historyJson)
      .timeout(const Duration(seconds: 5), onTimeout: () {
    throw TimeoutException('El servidor no respondió en 5 segundos');
  });
  }
}
