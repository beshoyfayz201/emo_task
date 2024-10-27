import 'package:emo_task/home/models/current_weather_model.dart';
import 'package:emo_task/home/models/forecast_model.dart';
import 'package:emo_task/home/models/loaction_model.dart';

class WeatherDataModel {
  LocationModel? location;
  List<ForecastModel>? forecastedDays = [];
  CurrentWeatherModel? current;

  WeatherDataModel.fromMap(Map<String, dynamic> map) {
    location = LocationModel.fromMap(map["location"]);
    current = CurrentWeatherModel.fromMap(map["current"]);

    map["forecast"]["forecastday"].forEach((froecastmap) {
      forecastedDays!.add(ForecastModel.fromMap(froecastmap));
    });
  }
}
