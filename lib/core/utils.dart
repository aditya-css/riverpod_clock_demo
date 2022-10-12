import 'dart:ui';

extension StringToInt on String {
  int get number => int.tryParse(this) ?? 0;

  DateTime get toDateTime {
    final formattedTime = split(' ');
    final date = formattedTime[0].split('-');
    final time = formattedTime[1].split(':');
    return DateTime(date[0].number, date[1].number, date[2].number,
        time[0].number, time[1].number, time[2].number);
  }
}

const Color darkBlack = Color(0xFF101820);
// const Color darkOrange = Color(0xFFF2AA4C);
const Color lightOrange = Color(0xFFe0c09e);
const Color lightBlack = Color(0xFF363940);
