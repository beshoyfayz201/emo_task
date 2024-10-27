import 'package:flutter/material.dart';
import 'package:emo_task/core/font_manager.dart';
import 'package:emo_task/core/styles_manager.dart';

class HourlyTemp extends StatelessWidget {
  final String temp, hour;
  const HourlyTemp({super.key, required this.hour, required this.temp});

  @override
  Widget build(BuildContext context) {
/*************  ✨ Codeium Command ⭐  *************/
  /// Builds a widget that displays the time and temperature.
  ///
  /// This widget is a container with a fixed width of 55 that contains
  /// a column of children including a text widget for the hour, an icon,
  /// and a text widget for the temperature in degrees.
  ///
  /// The hour is styled using the regular text style, and the temperature
  /// is styled with a specific font size. The icon is displayed with
  /// an amber color.
/******  d6e51a97-2caa-4212-b515-f1c3fa7a609e  *******/    return SizedBox(
      width: 55,
      child: Column(
        children: [
          Text(
            hour,
            style: getRegularStyle(),
          ),
          const Padding(
            padding: EdgeInsets.all(3.0),
            child: Icon(
              Icons.circle,
              color: Colors.amber,
            ),
          ),
          Text(
            "$temp°",
            style: getRegularStyle(fontSize: FontSize.s14),
          ),
        ],
      ),
    );
  }
}
