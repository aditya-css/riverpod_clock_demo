import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clock_demo/clock/clock_painter_widget.dart';
import 'package:riverpod_clock_demo/clock/clock_widget.dart';
import 'package:riverpod_clock_demo/widget/country_selection_box.dart';

import 'core/providers.dart';
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
              child: ClockWidget(
                child: Consumer(
                  builder: (_, ref, __) => ref.watch(timeStreamProvider).when(
                        data: (time) => ClockPainterWidget(time: time),
                        error: (_, __) => const ClockPainterWidget(time: null),
                        loading: ref.watch(selectedZoneProvider) == null
                            ? () => const ClockPainterWidget(time: null)
                            : _loadingWidgetBuilder,
                      ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              color: darkBlack,
              child: Consumer(
                builder: (_, ref, __) => ref.watch(zoneListProvider).when(
                      data: (zones) => CountrySelectionBox(
                        zonesList: zones,
                        selectedCountry:
                            ref.watch(selectedZoneProvider)?.countryZoneName ??
                                'Tap to Select Country',
                        onSelect: (selectedZone) => ref
                            .read(selectedZoneProvider.notifier)
                            .state = selectedZone,
                      ),
                      error: _errorWidgetBuilder,
                      loading: _loadingWidgetBuilder,
                    ),
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
