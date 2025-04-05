import '../../../models/weather_model.dart';

enum HomeStatus { init, loaded, error }

class HomeState {
  HomeStatus status;
  final WeatherModel? currentWeather;
  final Map<String, List<WeatherModel>>? listForecast;

  HomeState({
    this.status = HomeStatus.init,
    this.currentWeather,
    this.listForecast,
  });

  HomeState init() {
    return HomeState(
      status: HomeStatus.init,
      currentWeather: WeatherModel(),
      listForecast: {},
    );
  }

  HomeState clone() {
    return HomeState();
  }

  HomeState copyWith({
    HomeStatus? status,
    WeatherModel? currentWeather,
    Map<String, List<WeatherModel>>? listForecast,
  }) {
    return HomeState(
      status: status ?? this.status,
      currentWeather: currentWeather ?? this.currentWeather,
      listForecast: listForecast ?? this.listForecast,
    );
  }
}
