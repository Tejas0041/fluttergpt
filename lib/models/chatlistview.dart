import 'package:flutter/material.dart';
import 'package:fluttergpt/models/conversation.dart';
import 'package:fluttergpt/views/widgets/messagewidget.dart';

class ChatListView extends StatefulWidget {
  final List<Conversation> conversations;
  const ChatListView({super.key, required this.conversations});

  @override
  State<ChatListView> createState() => _ChatListView();
}

class _ChatListView extends State<ChatListView> {
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: widget.conversations.length,
      itemBuilder: (context, index) {
        Conversation conversation = widget.conversations[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            MessageWidget(text: conversation.question),
            const SizedBox(height: 32),
            MessageWidget(text: conversation.answer, fromAi: true),
          ],
        );
      },
    );
  }
}
