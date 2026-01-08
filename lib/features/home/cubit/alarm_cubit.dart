import 'package:alermtask/features/home/cubit/alarm_state.dart';
import 'package:alermtask/features/home/model/alarm_model.dart';
import 'package:alermtask/helpers/format_time.dart';
import 'package:alermtask/helpers/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(AlarmState(alarmList: []));

  void addNewAlarm(TimeOfDay time, DateTime dateTime) {
    AlarmState alarmList = state;
    int id = DateTime.now().millisecondsSinceEpoch;
    final updatedList = List<AlarmModel>.from(state.alarmList);
    final combinedDateAndTime = combineDateTime(time, dateTime);
    updatedList.add(
      AlarmModel(
        id: id,
        time: time,
        dateTime: dateTime,
        combinedDateTime: combinedDateAndTime,
        isActive: true,
      ),
    );
    NotificationHelper.setAlarmOn(id: id, dateTime: combinedDateAndTime);
    emit(AlarmState(alarmList: updatedList));
  }

  void toggleIsActive(int id, bool value) {
    List<AlarmModel> alarmStateList = state.alarmList;

    alarmStateList = alarmStateList.map((alarm) {
      if (alarm.id == id) {
        if (value) {

          NotificationHelper.setAlarmOn(
            id: alarm.id,
            dateTime: alarm.combinedDateTime,
          );
        } else {
          NotificationHelper.cancelAlarm(id: alarm.id);

        }
        return alarm.copyWith(isActive: value);
      } else {
        return alarm;
      }
    }).toList();

    emit(AlarmState(alarmList: alarmStateList));
  }

  void deleteAlarm(int id) {
    List<AlarmModel> alarmStateList = state.alarmList;
    alarmStateList = alarmStateList.where((alarm) => alarm.id != id).toList();
    NotificationHelper.cancelAlarm(id: id);
    emit(AlarmState(alarmList: alarmStateList));
  }
}
