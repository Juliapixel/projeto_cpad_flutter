import 'package:alva/components/card_container.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String name;
  final IconData icon;

  const Category(this.name, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      width: 150,
      height: 40,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        spacing: 8,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xFFEEF2FF),
            ),
            child: Icon(icon, color: Color(0xFF5F5DEC), size: 14),
          ),
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              style: TextTheme.of(
                context,
              ).labelMedium?.copyWith(overflow: TextOverflow.ellipsis),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreCategories extends StatelessWidget {
  final List<Category> categories;

  const ExploreCategories(this.categories, {super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(
        height: 40 * 2 + 12,
        width: double.infinity,
      ),
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => Column(
          spacing: 12,
          children: [
            categories[i * 2],
            categories.elementAtOrNull(i * 2 + 1) ?? Spacer(),
          ],
        ),
        separatorBuilder: (_, _) => SizedBox(width: 12),
        itemCount: (categories.length / 2).ceil(),
      ),
    );
  }
}
