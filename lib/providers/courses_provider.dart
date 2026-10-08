import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Course {
  final String displayName;
  final String professor;

  const Course({required this.displayName, required this.professor});
}

final coursesProvider = FutureProvider.family<Course, String>((ref, course) async {
  final doc = await FirebaseFirestore.instance.doc("courses/$course").get();
  return Course(displayName: doc.get("displayName"), professor: doc.get("professor"));
});
