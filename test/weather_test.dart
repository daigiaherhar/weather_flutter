import 'package:flutter_test/flutter_test.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/data/services/weather_service.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/models/weather_model.dart';

class MockWeatherService extends Mock implements WeatherService {}

void main() {
  late WeatherRepository repository;
  late MockWeatherService mockService;
  // setup
  setUp(() {
    mockService = MockWeatherService();
    repository = WeatherRepositoryImpl(service: mockService);
  });
  // do
  test('Testing temp', () async {
    final double lat = 10.8984245;
    final double long = 106.7734245;
    when(mockService.fetchCurrentWeather(lat: lat, long: long)).thenAnswer(
      (item) async => {
        'main': {'temp': 28.89},
      },
    );

    final result = await repository.getCurrentWeather(
      WeatherModel(coordinates: CoordinatesModel(lat: lat, long: long)),
    );
    expect(result.temp, 28.89);
  });
  // test
}
