import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import '../../../data/repositories/weather_repository.dart';
import '../../../models/weather_model.dart';
import '../../../setup_locator.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState().init()) {
    on<InitHomeEvent>(_init);
    on<ChangeStatusEvent>(_changeStatus);
  }

  final WeatherRepository weatherRepository = getIt<WeatherRepository>();

  void _init(InitHomeEvent event, Emitter<HomeState> emit) async {
    try {
      await _checkPermission();
      // await Future.delayed(Duration(seconds: 2));
      CoordinatesModel coordinatesModel = await getLatLong();
      WeatherModel dataCurrent = await weatherRepository.getCurrentWeather(
        WeatherModel(coordinates: coordinatesModel),
      );
      final String nameLocation = await weatherRepository.getLocalName(
        WeatherModel(coordinates: coordinatesModel),
      );
      print("listForelistForelistFore");
      print(state.listForecast!.length);
      Map<String, List<WeatherModel>> listFore = await weatherRepository
          .getForecast3Hour(WeatherModel(coordinates: coordinatesModel));

      print(listFore);
      if (nameLocation.isNotEmpty) {
        dataCurrent.nameCity = nameLocation;
      }

      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          currentWeather: dataCurrent,
          listForecast: listFore,
        ),
      );
    } catch (exception) {
      print("exception");
      print(exception);
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  void _changeStatus(ChangeStatusEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: event.status));
  }

  Future<bool> _checkPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openAppSettings();
        return Future.error('denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      return Future.error('deniedForever.');
    }

    return true;
  }

  Future<CoordinatesModel> getLatLong() async {
    final position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      ),
    );
    return CoordinatesModel(lat: position.latitude, long: position.longitude);
  }
}
