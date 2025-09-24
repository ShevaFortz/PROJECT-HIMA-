import 'package:flutter/material.dart';

class TextUtil extends StatelessWidget {
  final String text;
  final bool weight;
  final double? size;
  final Color? color;

  const TextUtil({
    super.key,
    required this.text,
    this.weight = false,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: weight ? FontWeight.bold : FontWeight.normal,
        fontSize: size ?? 16,
        color: color ?? Colors.white,
      ),
    );
  }
}
