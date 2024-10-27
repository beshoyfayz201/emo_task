import 'package:emo_task/home/view_model/day_forecast_view_model/day_forecast_view_model.dart';
import 'package:flutter/material.dart';
import 'package:emo_task/core/assets_manager.dart';
import 'package:emo_task/core/font_manager.dart';
import 'package:emo_task/core/styles_manager.dart';
import 'package:emo_task/core/values_manager.dart';

class DaysForecast extends StatelessWidget {
  final DaysForecastViewModel viewModel;

  const DaysForecast({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DayForecastRow(
            day: viewModel.formattedDays[index],
            max: viewModel.maxTemperatures[index],
            min: viewModel.minTemperatures[index],
            humidity: viewModel.humidityPercentages[index],
            isLight: viewModel.isLight,
          ),
        );
      }),
    );
  }
}

class DayForecastRow extends StatelessWidget {
  final bool isLight;
  final String day, max, min, humidity;

  const DayForecastRow({
    super.key,
    required this.isLight,
    required this.day,
    required this.max,
    required this.min,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          day,
          style: getSemiBoldStyle(color: Colors.white, fontSize: FontSize.s16),
        ),
        const Spacer(),
        Icon(
          Icons.water_drop_sharp,
          color: isLight ? Colors.white : Colors.grey,
          size: AppSize.s12,
        ),
        Text(
          humidity,
          style: getRegularStyle(),
        ),
        const SizedBox(width: 10),
        Image.asset(
          ImageAssets.sunpng,
          height: 20,
        ),
        const SizedBox(width: 10),
        Image.asset(
          ImageAssets.moonpng,
          height: 20,
        ),
        const SizedBox(width: 10),
        Text(
          max,
          style: getRegularStyle(),
        ),
        const SizedBox(width: 5),
        Text(
          min,
          style: getRegularStyle(),
        ),
      ],
    );
  }
}
