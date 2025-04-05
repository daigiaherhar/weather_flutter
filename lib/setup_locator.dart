import 'package:get_it/get_it.dart';

import 'data/repositories/weather_repository.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'data/services/weather_service.dart';
import 'data/services/weather_service_impl.dart';

final getIt = GetIt.instance;

setupLocator() {
  //weather
  getIt.registerLazySingleton<WeatherService>(() => WeatherServiceImpl());
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(service: getIt<WeatherService>()),
  );
}
