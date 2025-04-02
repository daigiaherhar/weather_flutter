import '../../../models/weather_model.dart';

enum HomeStatus { init, loaded, error }

class HomeState {
  HomeStatus status;
  final WeatherModel? currentWeather;

  HomeState({this.status = HomeStatus.init, this.currentWeather});

  HomeState init() {
    return HomeState(status: HomeStatus.init, currentWeather: WeatherModel());
  }

  HomeState clone() {
    return HomeState();
  }

  HomeState copyWith({HomeStatus? status, WeatherModel? currentWeather}) {
    return HomeState(
      status: status ?? this.status,
      currentWeather: currentWeather ?? this.currentWeather,
    );
  }
}
