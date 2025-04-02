import 'package:weather/views/home/bloc/home_state.dart';

abstract class HomeEvent {}

class InitHomeEvent extends HomeEvent {}
class ChangeStatusEvent extends HomeEvent {
  ChangeStatusEvent({required this.status});
  final HomeStatus status;
}

