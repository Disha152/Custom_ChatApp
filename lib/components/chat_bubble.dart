import 'package:flutter/material.dart';
import 'package:chat_application/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser
            ? (isDarkMode ? Colors.blue[600] : Colors.blue[300])
            : (isDarkMode ? Colors.white : Colors.grey.shade800),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
      padding: const EdgeInsets.all(8),
      child: Text(message,
          style: const TextStyle(color: Color.fromARGB(255, 58, 58, 58))),
    );
  }
}
