import 'package:alva/components/card_container.dart';
import 'package:alva/providers/popular_courses_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularCourse extends StatelessWidget {
  final String title;
  final String? subtitle;

  const PopularCourse({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Text(
        title,
        maxLines: 2,
        style: TextTheme.of(
          context,
        ).titleSmall?.copyWith(overflow: TextOverflow.ellipsis),
      ),
    ];
    if (subtitle != null) {
      children.add(
        Text(
          subtitle!,
          maxLines: 1,
          style: TextTheme.of(
            context,
          ).labelSmall?.copyWith(overflow: TextOverflow.ellipsis),
        ),
      );
    }
    return CardContainer(
      width: 200,
      height: 88,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}

class PopularCourses extends ConsumerWidget {
  const PopularCourses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(popularCoursesProvider);

    if (!courses.hasValue) {
      return PopularCourse(title: "Carregando...", subtitle: "Carregando...");
    }
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 88),
      child: ListView.separated(
        clipBehavior: Clip.none,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => courses.value![i],
        separatorBuilder: (context, i) => SizedBox(width: 12),
        itemCount: courses.value!.length,
      ),
    );
  }
}
