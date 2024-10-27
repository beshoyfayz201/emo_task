import 'package:flutter/material.dart';
import 'package:emo_task/core/assets_manager.dart';
import 'package:emo_task/core/font_manager.dart';
import 'package:emo_task/core/styles_manager.dart';
import 'package:emo_task/core/values_manager.dart';

class WeatherExtraWidget extends StatelessWidget {
  final String uvIndex, wind, humidty;
  const WeatherExtraWidget(
      {super.key,
      required this.humidty,
      required this.uvIndex,
      required this.wind});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WeatherExtraComponent(
            image: ImageAssets.sunpng,
            name: "UV Index",
            value: double.parse(uvIndex) > 3 ? "High" : "Low",
          ),
          const VerticalDivider(
            color: Colors.grey,
          ),
          const VerticalDivider(),
          WeatherExtraComponent(
            image: ImageAssets.wind,
            name: "Wind",
            value: "$wind km/h",
          ),
          const VerticalDivider(
            color: Colors.grey,
          ),
          WeatherExtraComponent(
            image: ImageAssets.humidity,
            name: "Humidity",
            value: "$humidty%",
          ),
        ],
      ),
    );
  }
}

class WeatherExtraComponent extends StatelessWidget {
  final String image, name, value;
  const WeatherExtraComponent(
      {super.key,
      required this.image,
      required this.name,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: AppSize.s40,
          ),
          const SizedBox(
            height: AppSize.s8,
          ),
          Text(
            name,
            style: getBoldStyle(color: Colors.white, fontSize: FontSize.s14),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            value,
            style: getRegularStyle(color: Colors.grey, fontSize: FontSize.s14),
          ),
        ],
      ),
    );
  }
}
