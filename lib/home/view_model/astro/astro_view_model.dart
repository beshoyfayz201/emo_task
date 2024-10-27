import 'package:emo_task/home/models/forecast_model.dart';
import 'package:emo_task/core/assets_manager.dart';

class AstroViewModel {
  final AstroModel astroModel;

  AstroViewModel(this.astroModel);

  // Returns sunrise time
  String get sunrise => astroModel.sunrise ?? "N/A";

  // Returns sunset time
  String get sunset => astroModel.sunset ?? "N/A";

  // Returns the appropriate image for sunrise or sunset
  String getSunImage(bool isSunrise) =>
      isSunrise ? ImageAssets.sunrise : ImageAssets.sunsunset;

  // Returns the title for sunrise or sunset
  String getTitle(bool isSunrise) => isSunrise ? "Sunrise" : "Sunset";
}
