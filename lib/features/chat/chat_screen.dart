import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_controller.dart';
import 'widgets/message_bubble.dart';
import 'widgets/input_bar.dart';
import 'widgets/typing_indicator.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ChatController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chatbot Planta',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2ECC71), 
        elevation: 4,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.local_florist,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  return MessageBubble(role: msg.role, content: msg.content);
                },
              ),
            ),
            if (controller.loading) const TypingIndicator(),
            InputBar(onSend: controller.send),
          ],
        ),
      ),
    );
  }
}
