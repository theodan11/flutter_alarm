import 'package:alermtask/features/home/cubit/alarm_state.dart';
import 'package:alermtask/features/home/model/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmCubit extends Cubit<AlarmState>{
   AlarmCubit():super(AlarmState(alarmList: []));


  void addNewAlarm(TimeOfDay time, DateTime dateTime ){
    AlarmState alarmList = state;
    String id =  DateTime.now().millisecondsSinceEpoch.toString();
    final updatedList = List<AlarmModel>.from(state.alarmList);
    updatedList.add(AlarmModel(id: id, time: time, dateTime: dateTime));

    emit(AlarmState(alarmList: updatedList));

  }
}