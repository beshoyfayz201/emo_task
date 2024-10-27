import 'package:flutter/material.dart';
import 'package:emo_task/core/font_manager.dart';
import 'package:emo_task/core/styles_manager.dart';

class TextForecast extends StatelessWidget {
  final String forecastText;

  const TextForecast({super.key, required this.forecastText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Today's Temprature",
          style: getBoldStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Expected to be $forecastText",
          style: getMediumStyle(
              color: Colors.grey.shade200, fontSize: FontSize.s16),
        )
      ],
    );
  }
}
