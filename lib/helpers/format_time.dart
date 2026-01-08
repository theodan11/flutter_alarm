import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String FormatDate(DateTime date) {
  final formattedDate = DateFormat('MMM dd yyyy').format(date);

  return formattedDate;
}

String FormateTime(TimeOfDay time) {
  final now = DateTime.now();
  final dateTime = DateTime(
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );
  final formattedTime = DateFormat.jm().format(dateTime);
  return formattedTime;
}
