import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SpinKitThreeBounce(color: const Color(0xFF2ECC71), size: 20),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
