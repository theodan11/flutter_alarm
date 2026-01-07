import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String FormatDate(DateTime date) {
  final formattedDate = DateFormat('hh:mm a').format(date);

  return formattedDate;
}