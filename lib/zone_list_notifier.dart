import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api/api_constants.dart';
import 'api/model/time_zone_model.dart';

class ZoneListNotifier extends StateNotifier<AsyncValue<List<TimeZoneModel>?>> {
  ZoneListNotifier() : super(const AsyncLoading());

  void getTimeZoneList() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ApiConst.client.getTimeZonesList();
      return response.zones;
    });
  }
}
