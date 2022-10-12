import 'package:flutter/material.dart';

import '../api/model/time_zone_model.dart';
import '../core/utils.dart';
import 'zone_dialog.dart';

class CountrySelectionBox extends StatelessWidget {
  const CountrySelectionBox({
    Key? key,
    required this.zonesList,
    required this.selectedCountry,
    required this.onSelect,
  }) : super(key: key);

  final String selectedCountry;
  final List<TimeZoneModel>? zonesList;
  final void Function(TimeZoneModel?) onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: zonesList == null
          ? () {}
          : () async {
              final selectedZone = await ZoneDialog(zonesList!).show(context);
              onSelect(selectedZone);
            },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: lightOrange, width: 2),
        ),
        child: Text(
          selectedCountry,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
