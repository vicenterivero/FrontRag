import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String role;
  final String content;

  const MessageBubble({super.key, required this.role, required this.content});

  @override
Widget build(BuildContext context) {
  final isUser = role == 'user';
  final bgColor = isUser ? const Color(0xFF2ECC71) : Colors.grey[300];
  final align = isUser ? Alignment.centerRight : Alignment.centerLeft;

  return Align(
    alignment: align,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isUser)
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.local_restaurant, color: const Color(0xFF2ECC71), size: 24),
            ),
          Flexible(
            child: Text(
              content,
              style:  TextStyle(fontSize: 16, color: (isUser?Colors.white:Colors.black)),
            ),
          ),
          if (isUser)
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.person, color: Colors.white, size: 24),
            ),
        ],
      ),
    ),
  );
}

}
