import 'package:emo_task/home/view_model/hourly/humidty_view_model.dart';
import 'package:emo_task/home/view_model/hourly/temps_view_model.dart';
import 'package:emo_task/home/view_model/hourly/weather_view_model.dart';
import 'package:flutter/material.dart';
import 'package:emo_task/home/models/forecast_model.dart';

import 'hourly_temp.dart';

class HourlyMainWidget extends StatelessWidget {
  final List<Hour> hours;
  const HourlyMainWidget({Key? key, required this.hours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              HourlyTempRow(hourlyTempRowViewModel: HourlyTempRowViewModel(hours)),
              SizedBox(
                height: 100,
              ),
              //   ),
              HumidtyRowWidget(viewModel: HumidtyViewModel(hours)),
            ],
          ),
        ),
        Weatherchart(viewModel: WeatherChartViewModel(hours)),
      ],
    );
  }
}
