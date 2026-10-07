import 'package:flutter/material.dart';
import 'package:alva/components/card_container.dart';

class UpcomingClass extends StatelessWidget {
  final String subject;
  final String time;
  final String location;

  const UpcomingClass(this.subject, this.time, this.location, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          subject.toUpperCase(),
          maxLines: 2,
          style: TextTheme.of(context).titleSmall,
        ),
        Text(
          time.toUpperCase(),
          style: TextTheme.of(context).labelMedium,
        ),
        Text(location, style: TextTheme.of(context).labelSmall),
      ],
    );
  }
}

class SubjectCard extends StatelessWidget {
  final UpcomingClass firstClass;
  final UpcomingClass secondClass;

  const SubjectCard({
    super.key,
    required this.firstClass,
    required this.secondClass,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      height: 104,
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: firstClass),
          VerticalDivider(thickness: 1, color: Color(0xFFB1B1B1)),
          Expanded(child: secondClass),
        ],
      ),
    );
  }
}
