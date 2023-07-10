import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

class CurvyArrow extends StatefulWidget {
  const CurvyArrow(this.height, this.width, {super.key});
  final double width;
  final double height;

  @override
  State<CurvyArrow> createState() => _CurvyArrowState();
}

class _CurvyArrowState extends State<CurvyArrow> {
  @override
  Widget build(BuildContext context) => ClipRect(
        child: CustomPaint(
          size: Size(widget.width, widget.height),
          painter: ArrowPainter(),
        ),
      );
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// The arrows usually looks better with rounded caps.
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 8.0;

    {
      var path = Path()
        ..moveTo(size.width * 0.25, 60)
        ..relativeCubicTo(0, 0, size.width * 0.25, 50, size.width * 0.5, 0);
      path = ArrowPath.addTip(path);

      canvas.drawPath(path, paint..color = Colors.blue);
    }
  }

  @override
  bool shouldRepaint(ArrowPainter oldDelegate) => false;
}
