import 'dart:math';

import 'package:flutter/material.dart';

import '../core/utils.dart';

class ClockPainter extends CustomPainter {
  final DateTime dateTime;

  const ClockPainter(this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);

    final minuteHourHandDarkPainter = Paint()
      ..color = darkBlack
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    final minuteHourHandLightPainter = Paint()
      ..color = lightOrange
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    final minuteHourHandThinPainter = Paint()
      ..color = darkBlack
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    // Minute Calculation
    final xMinCal = cos((dateTime.minute * 6) * pi / 180);
    final yMinCal = sin((dateTime.minute * 6) * pi / 180);

    final minThinX = centerX + 20 * xMinCal;
    final minThinY = centerY + 20 * yMinCal;

    final minStartX = centerX + 21 * xMinCal;
    final minStartY = centerY + 21 * yMinCal;

    final minEndX = centerX + size.width * 0.395 * xMinCal;
    final minEndY = centerY + size.width * 0.395 * yMinCal;

    final minDarkStartX = centerX + 20 * xMinCal;
    final minDarkStartY = centerY + 20 * yMinCal;

    final minDarkEndX = centerX + size.width * 0.4 * xMinCal;
    final minDarkEndY = centerY + size.width * 0.4 * yMinCal;

    //Minute Line
    canvas.drawLine(
      center,
      Offset(minThinX, minThinY),
      minuteHourHandThinPainter,
    );
    canvas.drawLine(
      Offset(minDarkStartX, minDarkStartY),
      Offset(minDarkEndX, minDarkEndY),
      minuteHourHandDarkPainter,
    );
    canvas.drawLine(
      Offset(minStartX, minStartY),
      Offset(minEndX, minEndY),
      minuteHourHandLightPainter,
    );

    // Hour Calculation
    // dateTime.hour * 30 because 360/12 = 30
    // dateTime.minute * 0.5 each minute we want to turn our hour line a little
    final xHourCal =
        cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    final yHourCal =
        sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    final hourThinX = centerX + 20 * xHourCal;
    final hourThinY = centerY + 20 * yHourCal;

    final hourStartX = centerX + 21 * xHourCal;
    final hourStartY = centerY + 21 * yHourCal;

    final hourEndX = centerX + size.width * 0.245 * xHourCal;
    final hourEndY = centerY + size.width * 0.245 * yHourCal;

    final hourDarkStartX = centerX + 20 * xHourCal;
    final hourDarkStartY = centerY + 20 * yHourCal;

    final hourDarkEndX = centerX + size.width * 0.25 * xHourCal;
    final hourDarkEndY = centerY + size.width * 0.25 * yHourCal;

    // hour Line
    canvas.drawLine(
      center,
      Offset(hourThinX, hourThinY),
      minuteHourHandThinPainter,
    );
    canvas.drawLine(
      Offset(hourDarkStartX, hourDarkStartY),
      Offset(hourDarkEndX, hourDarkEndY),
      minuteHourHandDarkPainter,
    );
    canvas.drawLine(
      Offset(hourStartX, hourStartY),
      Offset(hourEndX, hourEndY),
      minuteHourHandLightPainter,
    );

    // Second Calculation
    // size.width * 0.4 define our line height
    // dateTime.second * 6 because 360 / 60 = 6
    final xCal = cos((dateTime.second * 6) * pi / 180);
    final yCal = sin((dateTime.second * 6) * pi / 180);
    final secondTailX = centerX - 20 * xCal;
    final secondTailY = centerY - 20 * yCal;
    final secondX = centerX + size.width * 0.45 * xCal;
    final secondY = centerY + size.width * 0.45 * yCal;

    final secondHandPainter = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    // Second Line
    canvas.drawLine(
      center,
      Offset(secondTailX, secondTailY),
      secondHandPainter,
    );
    canvas.drawLine(
      center,
      Offset(secondX, secondY),
      secondHandPainter,
    );

    // center Dots
    canvas.drawCircle(center, 6, Paint()..color = Colors.red);
    canvas.drawCircle(center, 3, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
