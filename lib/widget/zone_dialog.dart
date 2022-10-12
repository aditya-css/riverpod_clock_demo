import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/model/time_zone_model.dart';
import '../core/utils.dart';

class ZoneDialog extends StatelessWidget {
  ZoneDialog(this.zones, {Key? key}) : super(key: key);

  final List<TimeZoneModel> zones;
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 0);

  Future<TimeZoneModel?> show(BuildContext context) async =>
      showCupertinoModalPopup<TimeZoneModel>(
        context: context,
        barrierDismissible: false,
        builder: build,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBlack,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CupertinoButton(
              child: const Text('Done', style: TextStyle(color: lightOrange)),
              onPressed: () => Navigator.of(context)
                  .pop(zones[_scrollController.selectedItem]),
            ),
          ),
          Expanded(
            child: CupertinoPicker(
              itemExtent: 30,
              scrollController: _scrollController,
              children: [
                for (final zone in zones)
                  if (zone.countryZoneName != null)
                    Text(
                      zone.countryZoneName!,
                      style: const TextStyle(color: Colors.white),
                    ),
              ],
              onSelectedItemChanged: (_) {},
            ),
          ),
        ],
      ),
    );
  }
}
