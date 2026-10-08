import 'package:alva/components/card_container.dart';
import 'package:flutter/material.dart';

enum MultiButtonKind {
  normal(Color(0xFF5F5DEC), Color(0xFFEEF2FF)),
  warning(Color(0xFFB45309), Color(0xFFFFF7ED));

  final Color iconColor;
  final Color iconBackgroundColor;

  const MultiButtonKind(this.iconColor, this.iconBackgroundColor);
}

class MultiButtonItem extends StatelessWidget {
  final String text;
  final String? subText;
  final IconData icon;
  final IconData actionIcon;
  final MultiButtonKind kind;
  final void Function()? onTap;

  const MultiButtonItem({
    super.key,
    required this.text,
    this.subText,
    this.icon = Icons.comment_outlined,
    this.actionIcon = Icons.chevron_right,
    this.kind = MultiButtonKind.normal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: kind.iconBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: kind.iconColor, size: 24),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children:
                [
                  Text(
                    text,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: .w600,
                      fontSize: 13,
                    ),
                  ),
                ] +
                (subText != null
                    ? [Text(subText!, style: textTheme.bodySmall)]
                    : []),
          ),
        ),

        Icon(actionIcon, color: Color(0xFF94A3B8), size: 24),
      ],
    );
  }
}

Iterable<T> _intersperse<T>(Iterable<T> iterable, T sep) sync* {
  Iterator iter = iterable.iterator;

  if (iter.moveNext()) {
    yield iter.current;
  }

  while (iter.moveNext()) {
    yield sep;
    yield iter.current;
  }
}

Iterable<Widget> _makePaddedList<T extends Widget>(
  Iterable<T> children,
  EdgeInsets padding,
  double spacing,
) sync* {
  if (children.length == 1) {
    yield Container(padding: padding, child: children.first);
    return;
  }

  if (children.isNotEmpty) {
    yield Container(
      padding: padding.copyWith(bottom: spacing / 2),
      child: children.first,
    );
  }
  for (var child in (children.take(children.length - 1)).skip(1)) {
    yield Container(
      padding: padding.copyWith(bottom: spacing / 2, top: spacing / 2),
      child: child,
    );
  }
  if (children.isNotEmpty) {
    yield Container(
      padding: padding.copyWith(top: spacing / 2),
      child: children.last,
    );
  }
}

class MultiButtonCard extends StatelessWidget {
  final List<MultiButtonItem> items;

  const MultiButtonCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: null,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: List.from(
          _intersperse(
            _makePaddedList(items, EdgeInsets.all(14), 24).indexed.map(
              (i) => Material(
                color: Colors.transparent,
                child: InkWell(onTap: items[i.$1].onTap, child: i.$2),
              ),
            ),
            Divider(height: 1, thickness: 1, indent: 14, endIndent: 14),
          ),
        ),
      ),
    );
  }
}
