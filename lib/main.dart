import 'dart:math';

import 'package:flutter/material.dart';
import 'package:alva/screens/courses/courses_screen.dart';
import 'package:alva/screens/explore/explore_screen.dart';
import 'package:alva/screens/home/home_screen.dart';
import 'package:alva/screens/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alva',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Color(0xFF9A95E3)),
      ),
      home: DefaultTabController(length: 4, child: AppWidget(title: 'Alva')),
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFF9A95E3), Colors.white],
            stops: [0.0, 0.63, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: TabBarView(
          children: [
            HomeScreen(),
            ExploreScreen(),
            CoursesScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Color(0x10000000)],
              begin: AlignmentGeometry.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: TabBar(
            labelColor: Color(0xFF5F5DEC),
            unselectedLabelColor: Color(0xFF94A3B8),
            tabs: [
              Tab(icon: Icon(Icons.home_outlined), text: "Início"),
              Tab(icon: Icon(Icons.explore_outlined), text: "Explorar"),
              Tab(icon: Icon(Icons.menu_book_outlined), text: "Cursos"),
              Tab(icon: Icon(Icons.person_outlined), text: "Perfil"),
            ],
          ),
        ),
      ),
    );
  }
}
