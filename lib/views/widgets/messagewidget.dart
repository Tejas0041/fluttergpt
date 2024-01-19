import 'package:flutter/material.dart';
import 'package:fluttergpt/constants/colors.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool fromAi;

  const MessageWidget({super.key, required this.text, this.fromAi = false});

  @override
  Widget build(context) {
    return Align(
      alignment: fromAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .8,
            ),
            decoration: BoxDecoration(
              color: fromAi ? CustomColors.darkgrey : CustomColors.primary,
              borderRadius: BorderRadius.circular(8).copyWith(
                bottomLeft: fromAi ? const Radius.circular(0) : null,
                bottomRight: !fromAi ? const Radius.circular(0) : null,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(text),
          ),
          if (fromAi) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: const Row(
                children: [
                  Icon(Icons.thumb_up_alt_outlined),
                  SizedBox(width: 10),
                  Icon(Icons.thumb_down_alt_outlined),
                  Spacer(),
                  Icon(Icons.copy),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}
