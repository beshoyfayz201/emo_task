import 'package:emo_task/core/extinsions/size_ex.dart';
import 'package:flutter/material.dart';
import 'today_forecast_widget.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String temp, place, feelsLike, day, time, maxTemp, minTemp;
  final bool isCollapsed;
  final bool isLight;
  const CustomSliverAppBar(
      {super.key,
      required this.day,
      required this.isLight,
      required this.isCollapsed,
      required this.feelsLike,
      required this.maxTemp,
      required this.minTemp,
      required this.place,
      required this.temp,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      collapsedHeight: context.screenHeight * 0.3,
      expandedHeight: context.screenHeight * 0.4,
      pinned: true,
      elevation: 0,
      backgroundColor: isLight ? Colors.transparent : Colors.black,
      flexibleSpace: TodayForecast(
          isCollapsed: isCollapsed,
          temp: temp,
          maxTemp: maxTemp,
          minTemp: minTemp,
          day: day,
          time: time,
          place: place,
          feelsLike: feelsLike),
    );
    //top
  }
}
