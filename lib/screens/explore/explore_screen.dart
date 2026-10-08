import 'package:alva/components/header.dart';
import 'package:alva/components/screen_section.dart';
import 'package:alva/screens/explore/categories.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Header("Explorar", "Encontre cursos e aulas"),
        ScreenSection(title: "Categorias", child: Categories(categories: [
          "Programação",
          "IA e Aprendizado de máquina",
          "Ciência de dados",
          "Design de UX",
          "Nuvem",
          "Cibersegurança",
        ]))
      ],
    );
  }
}
