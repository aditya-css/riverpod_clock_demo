import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_constants.dart';
import '../api/model/time_zone_model.dart';
import '../zone_list_notifier.dart';
import 'utils.dart';

final zoneListProvider =
    StateNotifierProvider<ZoneListNotifier, AsyncValue<List<TimeZoneModel>?>>(
  (ref) => ZoneListNotifier()..getTimeZoneList(),
);

final zoneTimeProvider = FutureProvider(
  (ref) async {
    final timeZoneName = ref.watch(selectedZoneProvider);
    return timeZoneName?.zoneName == null
        ? Future.value(null)
        : ApiConst.client.getTimeByZone(timeZoneName!.zoneName!);
  },
);

final selectedZoneProvider = StateProvider<TimeZoneModel?>((ref) => null);

final timeProvider = StateProvider((ref) {
  final zoneTime = ref.watch(zoneTimeProvider);
  return zoneTime.value?.formatted != null
      ? zoneTime.value!.formatted!.toDateTime
      : null;
});

final timeStreamProvider = StreamProvider(
  (ref) {
    final timeNotifier = ref.watch(timeProvider.notifier);
    return Stream.periodic(
      const Duration(seconds: 1),
      (_) {
        final time = ref.read(timeProvider);
        return time == null
            ? null
            : timeNotifier.state = time.add(const Duration(seconds: 1));
      },
    );
  },
);
