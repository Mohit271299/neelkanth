import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  String toStringWithCustomDate(String outputFormat) {
    if (this == null) {
      return '';
    }
    return DateFormat(outputFormat).format(this);
  }
}

///Get DateTime From String Date With Input Format
DateTime getDateFromStringDate(String date, String inputFormat) {
  return DateFormat(inputFormat).parse(date);
}

extension TimeExtension on TimeOfDay {
  bool isEqual(TimeOfDay time) {
    return this == time;
  }

  bool isBefore(TimeOfDay time) {
    int startSeconds = (hour * 3600) + (minute * 60);
    int endSeconds = (time.hour * 3600) + (time.minute * 60);
    return startSeconds < endSeconds;
  }

  bool isAfter(TimeOfDay time) {
    int startSeconds = (hour * 3600) + (minute * 60);
    int endSeconds = (time.hour * 3600) + (time.minute * 60);
    return startSeconds > endSeconds;
  }
}
