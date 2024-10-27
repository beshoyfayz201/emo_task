import 'package:emo_task/home/models/forecast_model.dart';

class WeatherChartViewModel {
  final List<Hour> hours;

  WeatherChartViewModel(this.hours);

  // Gets the temperature data for the SparkLine chart
  List<double> get temperatureData =>
      hours.map((hour) => hour.tempC ?? 0.0).toList();
}
