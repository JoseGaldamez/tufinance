import 'package:flutter/material.dart';

class TitleTip extends StatelessWidget {
  const TitleTip({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ));
  }
}

class SubTitleTip extends StatelessWidget {
  const SubTitleTip({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }
}

class ParagraphTip extends StatelessWidget {
  const ParagraphTip({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
