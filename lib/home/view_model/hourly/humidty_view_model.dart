import 'package:emo_task/home/models/forecast_model.dart';

class HumidtyViewModel {
  final List<Hour> hours;

  HumidtyViewModel(this.hours);

  // Gets the chance of rain for each hour formatted as a percentage string
  List<String> get chanceOfRainPercentages =>
      hours.map((hour) => "${hour.chanceOfRain}%").toList();
}
