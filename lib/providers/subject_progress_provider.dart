import 'package:alva/providers/courses_provider.dart';
import 'package:alva/providers/user_provider.dart';
import 'package:alva/screens/home/subject_progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseProgress {
  final double progress;
  final DocumentReference course;

  factory CourseProgress.fromJson(Map<String, dynamic> json) {
    return CourseProgress(progress: json["progress"], course: json["course"]);
  }

  const CourseProgress({required this.progress, required this.course});
}

final subjectProgressProvider =
    FutureProvider.family<List<ProgressCard>?, String>((ref, userId) async {
      final user = await ref.watch(userProvider(userId).future);
      if (user == null) {
        return null;
      }
      try {
        final courses = await Future.wait(
          user.courseProgresses.values.map(
            (k) => ref.watch(coursesProvider(k.course.id).future),
          ),
        );
        return List.from(
          user.courseProgresses.values.indexed.map(
            (c) => ProgressCard(
              subject: courses[c.$1].displayName,
              progress: c.$2.progress,
            ),
          ),
        );
      } catch (e) {
        print(e);
        return null;
      }
    });
