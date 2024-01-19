import 'package:flutter/material.dart';
import 'package:fluttergpt/constants/colors.dart';

class Example extends StatelessWidget {
  const Example({super.key, required this.text});

  final String text;

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: CustomColors.darkgrey,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
      child: Text(
        text,
        style: textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
