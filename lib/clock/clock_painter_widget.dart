import 'dart:math';

import 'package:flutter/material.dart';

import '../core/utils.dart';
import 'clock_painter.dart';

class ClockPainterWidget extends StatelessWidget {
  const ClockPainterWidget({Key? key, required this.time}) : super(key: key);

  final DateTime? time;

  @override
  Widget build(BuildContext context) {
    return time == null
        ? const Icon(
            Icons.access_time,
            color: lightBlack,
          )
        : Transform.rotate(
            angle: -pi / 2,
            child: CustomPaint(
              painter: ClockPainter(time!),
            ),
          );
  }
}
