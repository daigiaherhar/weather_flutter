import '../../models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getCurrentWeather(WeatherModel weatherModel);
  Future<String> getLocalName(WeatherModel weatherModel);
  Future<Map<String, List<WeatherModel>>> getForecast3Hour(WeatherModel weatherModel);
}