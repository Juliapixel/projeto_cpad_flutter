import 'package:flutter/material.dart';

class ScreenSection extends StatelessWidget {
  final String title;
  final String? info;
  final Widget child;

  const ScreenSection({
    super.key,
    required this.title,
    this.info,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                Text(info ?? ""),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
