import 'package:alva/providers/courses_provider.dart';
import 'package:alva/screens/home/popular_courses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularCoursesProvider = FutureProvider<List<PopularCourse>>((ref) async {
  final popular = await FirebaseFirestore.instance
      .collection("courses")
      .where("popular", isEqualTo: true)
      .get();
  return popular.docs
      .map(
        (d) => Course(
          displayName: d.get("displayName"),
          professor: d.get("professor"),
        ),
      )
      .map((c) => PopularCourse(title: c.displayName, subtitle: c.professor,))
      .toList();
});
