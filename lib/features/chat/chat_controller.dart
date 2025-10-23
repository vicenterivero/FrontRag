import 'package:flutter/foundation.dart';
import '../../core/models.dart';
import 'chat_repository.dart';

class ChatController extends ChangeNotifier {
  final ChatRepository repository;
  List<Message> messages = [];
  bool loading = false;
  String? error;

  ChatController(this.repository);

  Future<void> send(String text) async {
    if (text.trim().isEmpty) return;

    messages.add(Message(role: 'user', content: text));
    loading = true;
    notifyListeners();

    try {
      final answer = await repository.ask(text, messages);
      messages.add(Message(role: 'assistant', content: answer));
    } catch (e) {
      error = "Error de conexión con el servidor :c, Vuelve a intertarlo en unos minutos :)";
      messages.add(Message(role: 'assistant', content: error??"Ocurrio un error"));
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
