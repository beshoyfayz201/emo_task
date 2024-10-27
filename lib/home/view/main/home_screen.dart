import 'package:emo_task/home/view_model/astro/astro_view_model.dart';
import 'package:emo_task/home/view_model/day_forecast_view_model/day_forecast_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:emo_task/home/models/forecast_model.dart';
import 'package:emo_task/home/models/weather_data_model.dart';
import 'package:emo_task/network/weather_cubit/cubit/weather_cubit.dart';
import 'package:emo_task/home/view/main/appbar_widgets/sliver_app_bar.dart';
import 'package:emo_task/home/view/main/widgets/astro_view/astro_view.dart';
import 'package:emo_task/home/view/main/widgets/background_layout.dart';
import 'package:emo_task/home/view/main/widgets/days_forecast_widget/days_forecast_widget.dart';
import 'package:emo_task/home/view/main/widgets/hourly_weather/hourly_main_widget.dart';
import 'package:emo_task/home/view/main/widgets/item_card.dart';
import 'package:emo_task/home/view/main/widgets/textforecast/text_forecast.dart';
import 'package:emo_task/home/view/main/widgets/weather_extra_widget/weather_extra_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;

  bool _appBarCollapsed = false;
  bool isLight = true;
  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        if (_isCollapsed() && !_appBarCollapsed) {
          setState(() {
            _appBarCollapsed = true;
            isLight = false;
          });
        } else if (!_isCollapsed() && _appBarCollapsed) {
          setState(() {
            _appBarCollapsed = false;
            isLight = true;
          });
        }
      });
    super.initState();
  }

  bool _isCollapsed() =>
      scrollController.hasClients && scrollController.offset > 230;
  WeatherDataModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherGetDataSuccess) {
              weatherData = WeatherCubit.get(context).weatherData;
            } else if (state is WeatherGetDataError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
          },
          builder: (context, state) {
            return (state is WeatherDataLoading || state is WeatherGetDataError)
                ? GestureDetector(
                    onTap: () {
                      BlocProvider.of<WeatherCubit>(context).getData();
                    },
                    child: CustomItem(
                        isLight: true,
                        child: Center(
                            child: Image.asset("assets/images/sun.gif",
                                height: 150))))
                : BackGroundLayout(
                    isLight: isLight,
                    child: CustomScrollView(
                      controller: scrollController,
                      shrinkWrap: false,
                      slivers: <Widget>[
                        CustomSliverAppBar(
                            isCollapsed: _appBarCollapsed,
                            isLight: isLight,
                            day: DateFormat('E').format(DateTime.now()),
                            feelsLike:
                                weatherData!.current!.feelslike_c.toString(),
                            maxTemp: weatherData!.forecastedDays![0].max,
                            minTemp: weatherData!.forecastedDays![0].min,
                            place: weatherData!.location!.region,
                            temp:
                                weatherData!.current!.temp_c.ceil().toString(),
                            time: DateFormat("h:mm a").format(DateTime.now())),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CustomItem(
                                  isLight: isLight,
                                  child: HourlyMainWidget(
                                      hours: weatherData!
                                          .forecastedDays![0].hours),
                                ),
                                CustomItem(
                                  isLight: isLight,
                                  child: TextForecast(
                                      forecastText: weatherData!
                                          .current!.condition.conditionText),
                                ),
                                CustomItem(
                                    isLight: isLight,
                                    child: DaysForecast(
                                      viewModel: DaysForecastViewModel(
                                          days: weatherData!.forecastedDays!,
                                          isLight: isLight),
                                    )),
                                CustomItem(
                                    isLight: isLight,
                                    child: AstroView(
                                        viewModel: AstroViewModel(
                                      AstroModel(
                                          moonPhase: weatherData!
                                              .forecastedDays![0]
                                              .astro
                                              .moonPhase,
                                          sunrise: weatherData!
                                              .forecastedDays![0].astro.sunrise,
                                          sunset: weatherData!
                                              .forecastedDays![0].astro.sunset),
                                    ))),
                                CustomItem(
                                    isLight: isLight,
                                    child: WeatherExtraWidget(
                                      humidty: weatherData!.current!.humidty,
                                      uvIndex: weatherData!.current!.uvIndex,
                                      wind: weatherData!.current!.wind,
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ));
          },
        ));
  }
}
