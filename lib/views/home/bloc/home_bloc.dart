import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import '../../../models/weather_model.dart';
import '../../../repositories/weather_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.weatherRepository}) : super(HomeState().init()) {
    on<InitHomeEvent>(_init);
    on<ChangeStatusEvent>(_changeStatus);
  }

  final WeatherRepository weatherRepository;

  void _init(InitHomeEvent event, Emitter<HomeState> emit) async {
    try {
      await _checkPermission();
      await Future.delayed(Duration(seconds: 2));
      CoordinatesModel coordinatesModel = await getLatLong();
      final dataCurrent = await weatherRepository.getCurrentWeather(
        WeatherModel(coordinates: coordinatesModel),
      );

      emit(
        state.copyWith(status: HomeStatus.loaded, currentWeather: dataCurrent),
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
