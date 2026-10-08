import 'package:alva/components/card_container.dart';
import 'package:alva/components/multi_button_card.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List<String> categories;

  const Categories({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    final items = categories.map(
      (c) => Expanded(
        child: MultiButtonCard(items: [MultiButtonItem(text: c)]),
      ),
    );
    final rows = items.indexed
        .fold<List<List<Widget>>>([], (f, i) {
          i.$1 % 2 == 0 ? f.add([i.$2]) : f.last.add(i.$2);
          return f;
        })
        .map(
          (r) => Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: r,
          ),
        );
    return SizedBox(child: Column(spacing: 10, children: rows.toList()));
  }
}
