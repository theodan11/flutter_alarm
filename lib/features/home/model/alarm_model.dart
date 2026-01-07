import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AlarmModel extends Equatable {
  final TimeOfDay time;
  final DateTime dateTime;
  final String id;
  final bool isActive;

  const AlarmModel({
    required this.id,
    required this.time,
    required this.dateTime,
    this.isActive = false,
  });

  @override
  List<Object?> get props => [id, time, dateTime, isActive];
}
