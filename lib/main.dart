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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Color(0xFF9A95E3)),
      ),
      home: DefaultTabController(length: 4, child: AppWidget(title: 'Alva')),
    );
  }
}

class AppWidget extends StatefulWidget {
  const AppWidget({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
