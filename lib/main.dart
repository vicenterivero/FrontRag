import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/api_client.dart';
import 'features/chat/chat_repository.dart';
import 'features/chat/chat_controller.dart';
import 'features/chat/chat_screen.dart';

void main() {
  final client = ApiClient('http://localhost:8000/'); 
  final repository = ChatRepository(client);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ChatRepository repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatController(repository),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chatbot Planta',
        home: ChatScreen(),
      ),
    );
  }
}
