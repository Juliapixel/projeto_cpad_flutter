import 'package:alva/components/header.dart';
import 'package:alva/screens/home/popular_courses.dart';
import 'package:flutter/material.dart';
import 'package:alva/components/card_container.dart';
import 'package:alva/components/screen_section.dart';
import 'package:alva/screens/home/subject_card.dart';
import 'package:alva/screens/home/subject_progress.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Header("Olá, {user}", "Seja bem-vindo(a)"),
        ScreenSection(
          title: "Aulas",
          info: "(11/09)",
          extraInfo: ExtraInfo(text: "Ver mais", onTap: () { print("nada"); }),
          child: SubjectCard(
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
          child: SubjectProgress(),

        ),
        ScreenSection(
          title: "Cursos Populares",
          child: PopularCourses(),
        ),
      ]
    );
  }
}
