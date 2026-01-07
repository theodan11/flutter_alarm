import 'package:alermtask/common_widgets/background_blur_container.dart';
import 'package:alermtask/constants/c_font_style.dart';
import 'package:alermtask/constants/color_const.dart';
import 'package:flutter/material.dart';

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
              if(time!= null){
                var date = await showDatePicker(context: context, firstDate: DateTime(1990), lastDate: DateTime(2100));
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 25,
                      itemBuilder: (context, index) {
                        return _alarmToggleContainter(context);
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

  Widget _alarmToggleContainter(BuildContext context) {
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
            Text("7:10 pm", style: CFontStyle.poppins16w400),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Fri 21 Mar 2025",
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
                    value: false,
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
