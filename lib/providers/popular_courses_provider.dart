import 'package:alva/screens/home/popular_courses.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularCoursesProvider = FutureProvider<List<PopularCourse>>((ref) async {
  return await Future.delayed(const Duration(seconds: 3), () {
    return List.from(() sync* {
      for (var i = 0; i < 5; i++) {
        yield PopularCourse(
          title: "Lorem ipsum dolor sit amet",
          subtitle: "Lorem Ipsum",
        );
      }
    }());
  });
});
