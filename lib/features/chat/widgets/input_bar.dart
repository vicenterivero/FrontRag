import 'package:flutter/material.dart';

class InputBar extends StatefulWidget {
  final Function(String) onSend;
  const InputBar({super.key, required this.onSend});

  @override
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  final controller = TextEditingController();

  void _send() {
    if (controller.text.trim().isEmpty) return;
    widget.onSend(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Pregunta algo del menu...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: const Icon(Icons.send, color: const Color(0xFF2ECC71)),
            onPressed: _send,
          ),
        ],
      ),
    );
  }
}
