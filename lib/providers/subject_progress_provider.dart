import 'package:alva/screens/home/subject_progress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subjectProgressProvider = FutureProvider<List<ProgressCard>>((ref) async {
  return await Future.delayed(const Duration(seconds: 2), () {
    return List.from(() sync* {
      for (var i = 0; i < 5; i++) {
        yield ProgressCard(
          subject: "Lorem ipsum dolor sit amet",
          progress: 0.67,
        );
      }
    }());
  });
});
