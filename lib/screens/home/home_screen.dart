import 'package:flutter/material.dart';
import 'package:alva/components/card_container.dart';
import 'package:alva/components/screen_section.dart';
import 'package:alva/screens/home/classes_card.dart';
import 'package:alva/screens/home/progress_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScreenSection(
          title: "Aulas",
          child: ClassesCard(
            firstClass: UpcomingClass(
              "Lorem ipsum dolor sit amet",
              "10:30",
              "lab. 205",
            ),
            secondClass: UpcomingClass(
              "Lorem ipsum dolor sit amet",
              "11:00",
              "lab. 205",
            ),
          ),
        ),
        ScreenSection(
          title: "Matérias",
          child: SizedBox(
            height: 100,
            child: ListView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                ProgressCard(
                  subject: "Cross Platform Application Development",
                  progress: 0.75,
                ),
                SizedBox(
                  width: 12
                ),
                ProgressCard(
                  subject: "Cross Platform Application Development",
                  progress: 0.75,
                ),
                SizedBox(
                  width: 12
                ),
                ProgressCard(
                  subject: "Cross Platform Application Development",
                  progress: 0.75,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
