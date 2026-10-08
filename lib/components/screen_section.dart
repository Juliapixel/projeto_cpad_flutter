import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtraInfo extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const ExtraInfo({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: GoogleFonts.geist(color: Color(0xFF5F5DEC), fontWeight: .w600),
        recognizer: TapGestureRecognizer()..onTap = onTap,
      ),
    );
  }
}

class ScreenSection extends StatelessWidget {
  final String title;
  final String? info;
  final ExtraInfo? extraInfo;
  final Widget child;

  const ScreenSection({
    super.key,
    required this.title,
    this.info,
    this.extraInfo,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.geist(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          info ?? "",
                          style: TextTheme.of(context).titleSmall?.copyWith(
                            fontSize: 14,
                            color: Color(0xFF5F5DEC),
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ] +
                  ((extraInfo != null) ? [extraInfo!] : []),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
