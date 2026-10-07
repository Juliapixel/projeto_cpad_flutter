import 'package:flutter/material.dart';
import 'package:alva/screens/courses/courses_screen.dart';
import 'package:alva/screens/explore/explore_screen.dart';
import 'package:alva/screens/home/home_screen.dart';
import 'package:alva/screens/profile/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // GoogleFonts.config.allowRuntimeFetching = false;
  runApp(ProviderScope(child: const MyApp()));
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
        textTheme: GoogleFonts.geistTextTheme().copyWith(
          headlineLarge: GoogleFonts.scienceGothic().copyWith(
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.scienceGothic().copyWith(
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.scienceGothic().copyWith(
            fontWeight: FontWeight.bold,
          ),
          displayLarge: GoogleFonts.scienceGothic(),
          displayMedium: GoogleFonts.scienceGothic(),
          displaySmall: GoogleFonts.scienceGothic(),
          titleLarge: GoogleFonts.scienceGothic().copyWith(
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.scienceGothic().copyWith(
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.scienceGothic().copyWith(
            fontWeight: FontWeight.bold,
          ),
          labelLarge: GoogleFonts.scienceGothic(),
          labelMedium: GoogleFonts.scienceGothic(),
          labelSmall: GoogleFonts.scienceGothic(),
        ),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFF9A95E3), Colors.white],
            stops: [0.0, 0.63, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: TabBarView(
            children: [
              HomeScreen(),
              ExploreScreen(),
              CoursesScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x00FFFFFF), Color(0xFFFFFFFF)],
              stops: [0.0, 0.25],
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
