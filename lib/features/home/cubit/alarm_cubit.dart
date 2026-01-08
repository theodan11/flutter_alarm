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

  void toggleIsActive(String id, bool value){
    List<AlarmModel> alarmStateList = state.alarmList;

    alarmStateList = alarmStateList.map((alarm){
      if (alarm.id == id){
        return alarm.copyWith(isActive:value);


      }else{
        return alarm;
      }

    }).toList();

    emit(AlarmState(alarmList: alarmStateList));
  }
  
  void deleteAlarm(String id){
    List<AlarmModel> alarmStateList = state.alarmList;
    alarmStateList = alarmStateList.where((alarm)=>alarm.id != id).toList();

    emit(AlarmState(alarmList: alarmStateList));
  }
}