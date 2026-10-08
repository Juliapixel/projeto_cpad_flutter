import 'package:alva/providers/subject_progress_provider.dart';
import 'package:flutter/material.dart';
import 'package:alva/components/card_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _ProgressBar extends CustomPainter {
  final double progress;
  final double width;

  const _ProgressBar({required this.progress, required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width;
    canvas.drawLine(
      Offset.zero,
      Offset(size.width, 0.0),
      Paint.from(paint)..color = Colors.black12,
    );
    canvas.drawLine(
      Offset.zero,
      Offset((size.width * progress), 0.0),
      Paint.from(paint)..color = Color(0xFF0D9488),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ProgressCard extends StatelessWidget {
  final String subject;
  final double progress;
  final void Function()? onTap;

  const ProgressCard({
    super.key,
    required this.subject,
    required this.progress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);

    Widget progressBar = Column(
      spacing: 4,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Progresso", style: textTheme.labelSmall),
            Text(
              "${(progress * 100).toStringAsFixed(0)}%",
              style: textTheme.labelSmall?.copyWith(color: Color(0xFF0D9488)),
            ),
          ],
        ),
        CustomPaint(
          painter: _ProgressBar(progress: progress, width: 4),
          child: SizedBox(height: 4, width: double.infinity),
        ),
      ],
    );
    final Widget contents = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subject,
          maxLines: 2,
          textAlign: TextAlign.start,
          style: textTheme.titleSmall?.copyWith(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        progressBar,
      ],
    );
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: CardContainer(width: 256, height: 100, child: contents),
    );
  }
}

class SubjectProgress extends ConsumerWidget {
  const SubjectProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ProgressCard> progresses = ref.watch(subjectProgressProvider("mtH9DriTqApzcpNfZZro")).value ?? [ProgressCard(subject: "Carregando...", progress: 0.0)];
    return SizedBox(
      height: 100,
      child: ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, i) => progresses[i],
        separatorBuilder: (context, i) => SizedBox(width: 12),
        itemCount: progresses.length,
      ),
    );
  }
}
