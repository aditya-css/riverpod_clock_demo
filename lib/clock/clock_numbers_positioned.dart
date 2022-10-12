import 'package:flutter/material.dart';

import '../core/utils.dart';

class ClockNumbersPositioned extends StatelessWidget {
  const ClockNumbersPositioned({Key? key}) : super(key: key);

  static const _textStyle = TextStyle(
    color: lightBlack,
    fontSize: 120,
    fontWeight: FontWeight.w900,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        Positioned(
          top: -40,
          left: 50,
          child: Text('૧૨', style: _textStyle),
        ),
        Positioned(
          right: 6,
          child: Text('૩', style: _textStyle),
        ),
        Positioned(
          bottom: -36,
          child: Text('૬', style: _textStyle),
        ),
        Positioned(
          left: 6,
          child: Text('૯', style: _textStyle),
        ),
      ],
    );
  }
}
