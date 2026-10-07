import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;

  const Header(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.headlineSmall?.copyWith(
                  color: Color(0xFF5F5DEC),
                ),
              ),
              Text(subtitle, style: textTheme.bodyMedium),
            ],
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF5F5DEC),
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFF9A95E3), width: 1),
            ),
            child: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
