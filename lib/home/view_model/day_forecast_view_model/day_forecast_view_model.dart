import 'package:intl/intl.dart';
import 'package:emo_task/home/models/forecast_model.dart';

class DaysForecastViewModel {
  final List<ForecastModel> days;
  final bool isLight;

  DaysForecastViewModel({required this.days, required this.isLight});

  // Parses and formats each day's date as the full weekday name
  List<String> get formattedDays => days.map((day) {
        DateTime parsedDate = DateFormat("yyyy-MM-dd").parse(day.date);
        return DateFormat("EEEE").format(parsedDate);
      }).toList();

  // Returns maximum temperature as a string list
  List<String> get maxTemperatures =>
      days.map((day) => "${day.max}°").toList();

  // Returns minimum temperature as a string list
  List<String> get minTemperatures =>
      days.map((day) => "${day.min}°").toList();

  // Returns chance of rain as a string list with percentage
  List<String> get humidityPercentages =>
      days.map((day) => "${day.chanceOfRain}%").toList();
}
