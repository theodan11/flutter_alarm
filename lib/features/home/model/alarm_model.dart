import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AlarmModel extends Equatable {
  final TimeOfDay time;
  final DateTime dateTime;
  final DateTime combinedDateTime;
  final int id;
  final bool isActive;


  const AlarmModel({
    required this.id,
    required this.time,
    required this.dateTime,
    required this.combinedDateTime,
    this.isActive = false,
  });

  AlarmModel copyWith({TimeOfDay? time, DateTime? dateTime,DateTime? combinedDateTime,  bool? isActive}) {
    return AlarmModel(
      id: id,
      time: time ?? this.time,
      dateTime: dateTime ?? this.dateTime,
      combinedDateTime: combinedDateTime ?? this.combinedDateTime,
      isActive: isActive ?? this.isActive
    );
  }

  @override
  List<Object?> get props => [id, time, dateTime, isActive, combinedDateTime];
}
