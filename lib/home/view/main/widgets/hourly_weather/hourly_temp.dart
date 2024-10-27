import 'package:emo_task/home/view_model/hourly/humidty_view_model.dart';
import 'package:emo_task/home/view_model/hourly/temps_view_model.dart';
import 'package:emo_task/home/view_model/hourly/weather_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:emo_task/home/view/main/widgets/hourly_weather/hourly_temp_top.dart';
import 'package:emo_task/core/styles_manager.dart';

class HumidtyRowWidget extends StatelessWidget {
  final HumidtyViewModel viewModel;

  const HumidtyRowWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      padding: const EdgeInsets.all(2),
      margin: EdgeInsets.zero,
      child: Row(
        children: List.generate(
          viewModel.hours.length,
          (index) => SizedBox(
            width: 55,
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.water_drop_rounded,
                  color: Colors.grey.shade100.withOpacity(0.6),
                ),
                Text(
                  viewModel.chanceOfRainPercentages[index],
                  style: getRegularStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Weatherchart extends StatelessWidget {
  final WeatherChartViewModel viewModel;

  const Weatherchart({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 99,
      child: SfSparkLineChart(
        color: Colors.white,
        trackball: SparkChartTrackball(
          width: 2,
          backgroundColor: Colors.black12.withOpacity(0.5),
          borderWidth: 1,
          tooltipFormatter: (details) => " ${details.label}°C",
          hideDelay: 1,
          borderColor: Colors.white,
          labelStyle: getRegularStyle(),
          activationMode: SparkChartActivationMode.longPress,
        ),
        marker: const SparkChartMarker(
          size: 3,
          displayMode: SparkChartMarkerDisplayMode.all,
        ),
        axisLineColor: Colors.transparent,
        data: viewModel.temperatureData,
      ),
    );
  }
}

class HourlyTempRow extends StatelessWidget {
  final HourlyTempRowViewModel hourlyTempRowViewModel;

  const HourlyTempRow({super.key, required this.hourlyTempRowViewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: Row(
            children: List.generate(24, (index) {
          DateTime prevFormat = DateFormat("yyyy-mm-dd hh:mm")
              .parse(hourlyTempRowViewModel.hours[index].time!);

          return HourlyTemp(
              hour: DateFormat("h:mm a").format(prevFormat),
              temp: hourlyTempRowViewModel.hours[index].tempC.toString());
        })));
  }
}
