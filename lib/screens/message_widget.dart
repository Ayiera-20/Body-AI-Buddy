import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
    });
    final String text;
    final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            constraints: const BoxConstraints( maxWidth: 520),
            decoration: BoxDecoration(
              color: isFromUser
              ? const Color(0xFFead2c6)
              :const Color(0xFF44544b),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                MarkdownBody(data: text),
              ],
            ),
          ))
      ],
    );
  }
}