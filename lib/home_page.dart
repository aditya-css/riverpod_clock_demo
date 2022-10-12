import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clock_demo/clock/clock_painter_widget.dart';
import 'package:riverpod_clock_demo/clock/clock_widget.dart';
import 'package:riverpod_clock_demo/widget/country_selection_box.dart';

import 'core/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightOrange,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: lightOrange,
              padding: const EdgeInsets.symmetric(vertical: 24),
              alignment: Alignment.center,
              child: const ClockWidget(
                // TODO: Get time stream and pass it to the [ClockPainterWidget]
                child: ClockPainterWidget(time: null),
              ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              color: darkBlack,
              // TODO: fetch the available zones' list
              // TODO: set selected country
              child: CountrySelectionBox(
                zonesList: const [],
                selectedCountry: 'Set Selected Country',
                onSelect: (selectedZone) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _errorWidgetBuilder(Object error, StackTrace trace) => Text(
      error.toString(),
      style: const TextStyle(
        color: Colors.red,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );

Widget _loadingWidgetBuilder() => const Center(
      child: CupertinoActivityIndicator(
        color: Colors.white,
        radius: 20,
      ),
    );
