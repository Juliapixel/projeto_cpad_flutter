import 'package:alva/providers/subject_progress_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final Map<String, CourseProgress> courseProgresses;

  const User({required this.name, required this.courseProgresses});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      courseProgresses: (json["courseProgress"] as Map<String, dynamic>).map(
        (k, v) => MapEntry(k, CourseProgress.fromJson(v)),
      ),
      name: json["name"],
    );
  }
}

final userProvider = FutureProvider.family<User?, String>((ref, userId) async {
  final user = (await FirebaseFirestore.instance.doc("users/$userId").get())
      .data();
  if (user is Map<String, dynamic>) {
    return User.fromJson(user);
  } else {
    return null;
  }
});
