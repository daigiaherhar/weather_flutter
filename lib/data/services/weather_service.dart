import '../../models/weather_model.dart';

abstract class WeatherService {
  Future<Map<String, dynamic>> fetchCurrentWeather({
    required double lat,
    required double long,
    String? unit,
  });

  Future<Map<String, dynamic>> fetchNameLatLong({
    required double lat,
    required double long,
  });

  Future<Map<String, dynamic>> fetchForecast3Hour({
    required double lat,
    required double long,
    String? units,
    int? cnt,
  });
  // Future<List<WeatherModel>> forecast3Hour(WeatherModel weatherModel);
}
