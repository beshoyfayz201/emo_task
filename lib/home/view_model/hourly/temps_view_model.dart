import 'package:intl/intl.dart';
import 'package:emo_task/home/models/forecast_model.dart';

class HourlyTempRowViewModel {
  final List<Hour> hours;

  HourlyTempRowViewModel(this.hours);

  // Format the hour and temperature data
  List<Map<String, String>> get hourlyTempData => hours.map((hour) {
        DateTime time = DateFormat("yyyy-MM-dd HH:mm").parse(hour.time!);
        String formattedTime = DateFormat("h:mm a").format(time);
        return {
          "hour": formattedTime,
          "temp": hour.tempC.toString(),
        };
      }).toList();
}
