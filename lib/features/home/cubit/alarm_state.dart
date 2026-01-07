import 'package:alermtask/features/home/model/alarm_model.dart';
import 'package:equatable/equatable.dart';

class AlarmState extends Equatable {
  final List<AlarmModel> alarmList;

  const AlarmState({required this.alarmList});

  // const AlarmState.copyWith()

  @override
  List<Object?> get props => [alarmList];
}