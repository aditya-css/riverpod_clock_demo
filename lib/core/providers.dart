import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_constants.dart';
import '../api/model/time_zone_model.dart';
import '../zone_list_notifier.dart';
import 'utils.dart';

final availableZonesProvider =
    StateNotifierProvider<ZoneListNotifier, AsyncValue<List<TimeZoneModel>?>>(
  (ref) => ZoneListNotifier()..getTimeZoneList(),
);

final zoneTimeFutureProvider = FutureProvider(
  (ref) async {
    final timeZoneName = ref.watch(selectedZoneProvider);
    return timeZoneName?.zoneName == null
        ? Future.value(null)
        : ApiConst.client.getTimeByZone(timeZoneName!.zoneName!);
  },
);

final selectedZoneProvider = StateProvider<TimeZoneModel?>((ref) => null);

final zoneDateTimeProvider = StateProvider((ref) {
  final zoneTime = ref.watch(zoneTimeFutureProvider);
  return zoneTime.value?.formatted != null
      ? zoneTime.value!.formatted!.toDateTime
      : null;
});

final timeStreamProvider = StreamProvider(
  (ref) {
    final timeNotifier = ref.watch(zoneDateTimeProvider.notifier);
    return Stream.periodic(
      const Duration(seconds: 1),
      (_) {
        final time = ref.read(zoneDateTimeProvider);
        return time == null
            ? null
            : timeNotifier.state = time.add(const Duration(seconds: 1));
      },
    );
  },
);
