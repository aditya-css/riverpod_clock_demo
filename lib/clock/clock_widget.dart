import 'package:flutter/material.dart';
import 'package:riverpod_clock_demo/clock/clock_numbers_positioned.dart';

import '../core/utils.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/watch.png'),
          LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth * 0.58,
              height: constraints.maxHeight * 0.53,
              decoration: BoxDecoration(
                color: lightOrange,
                borderRadius: BorderRadius.circular(42),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const ClockNumbersPositioned(),
                  SizedBox(
                    width: constraints.maxWidth * 0.58,
                    height: constraints.maxHeight * 0.53,
                    child: child,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
