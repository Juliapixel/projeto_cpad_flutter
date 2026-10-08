import 'package:alva/components/header.dart';
import 'package:alva/providers/user_provider.dart';
import 'package:alva/screens/home/explore_categories.dart';
import 'package:alva/screens/home/popular_courses.dart';
import 'package:flutter/material.dart';
import 'package:alva/components/screen_section.dart';
import 'package:alva/screens/home/subject_card.dart';
import 'package:alva/screens/home/subject_progress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Consumer(
          builder: (ctx, ref, child) => Header(
            ref
                .watch(userProvider("mtH9DriTqApzcpNfZZro"))
                .maybeWhen(
                  data: (user) => "Olá, ${user?.name ?? ""}",
                  orElse: () => "Olá",
                ),
            "Seja bem-vindo(a)",
          ),
        ),
        ScreenSection(
          title: "Aulas",
          info: "(11/09)",
          extraInfo: ExtraInfo(
            text: "Ver mais",
            onTap: () {
              print("nada");
            },
          ),
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
        ScreenSection(title: "Continue Aprendendo", child: SubjectProgress()),
        ScreenSection(
          title: "Categorias",
          child: ExploreCategories([
            Category("Programação", Icons.code_outlined),
            Category("UX e UI", Icons.format_shapes_outlined),
            Category("HTML", Icons.html_outlined),
            Category("Scrum", Icons.conveyor_belt),
            Category("Ciência de dados", Icons.dataset_outlined),
          ]),
        ),
        ScreenSection(title: "Cursos Populares", child: PopularCourses()),
      ],
    );
  }
}
