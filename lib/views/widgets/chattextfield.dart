import 'package:flutter/material.dart';
import 'package:fluttergpt/constants/colors.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  const ChatTextField(
      {super.key, required this.controller, required this.onSubmitted});
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.lightgrey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Flexible(
            child: TextField(
              controller: controller,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: IconButton(
              onPressed: () {
                onSubmitted(controller.text);
              },
              icon: const Icon(Icons.send),
              style: IconButton.styleFrom(
                backgroundColor: CustomColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
