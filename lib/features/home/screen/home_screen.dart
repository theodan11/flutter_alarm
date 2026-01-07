import 'package:alermtask/common_widgets/background_blur_container.dart';
import 'package:alermtask/constants/c_font_style.dart';
import 'package:alermtask/constants/color_const.dart';
import 'package:alermtask/features/home/cubit/alarm_cubit.dart';
import 'package:alermtask/features/home/cubit/alarm_state.dart';
import 'package:alermtask/features/home/model/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: AlignmentGeometry.directional(1, 0.8),
        child: Container(
          width: 66,
          height: 66,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConst.primaryColor,
          ),
          child: IconButton(
            onPressed: () async {
              var time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                var date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  context.read<AlarmCubit>().addNewAlarm(
                    time,
                    date
                  );
                }
              }
            },
            icon: Icon(Icons.add, color: ColorConst.whiteColor, size: 24),
          ),
        ),
      ),
      body: BackgroundBlurContainer(
        childWidget: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Selected Location", style: CFontStyle.poppins20w500),
                  SizedBox(height: 12),
                  _searchInput(context),
                  SizedBox(height: 24),
                  Text("Alarm", style: CFontStyle.poppins18w500),
                  SizedBox(height: 16),
                  // _alarmToggleContainter(context)
                  Expanded(
                    child: BlocBuilder<AlarmCubit, AlarmState>(
                      builder: (context, state) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.alarmList.length,
                          itemBuilder: (context, index) {
                            // print(state.alarmList);
                            // print(state.alarmList.length);
                            AlarmModel alarm = state.alarmList[index];
                            return _alarmToggleContainter(context, alarm);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _alarmToggleContainter(BuildContext context, AlarmModel alarm) {
    print(alarm);
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 56,
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: ColorConst.gray08Color,
        borderRadius: BorderRadius.circular(69),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(alarm.time.toString(), style: CFontStyle.poppins16w400),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                   alarm.dateTime.toString(),
                    style: CFontStyle.poppins16w400.copyWith(
                      fontSize: 14,
                      color: ColorConst.gray27Color,
                    ),
                  ),
                  SizedBox(width: 8),
                  Switch(
                    inactiveThumbColor: ColorConst.primaryDarkColor,
                    inactiveTrackColor: ColorConst.whiteColor,

                    activeThumbColor: ColorConst.whiteColor,
                    activeTrackColor: ColorConst.primaryColor,
                    value: alarm.isActive,
                    onChanged: (value) {
                      // print(value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchInput(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: ColorConst.gray08Color,
        borderRadius: BorderRadius.circular(69),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 24,
              color: ColorConst.whiteColor,
            ),

            Expanded(
              child: TextField(
                onChanged: (value) {
                  // print(value);
                },
                style: TextStyle(color: ColorConst.whiteColor),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add your location",
                  hintStyle: TextStyle(color: ColorConst.gray27Color),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
