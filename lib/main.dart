import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/repositories/weather_repository_impl.dart';
import 'package:weather/views/home/home_screen.dart';

import 'core/theme/theme.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: 'assets/.env');
  runApp(
    RepositoriesProvider(
      child: MaterialApp(
        title: 'Weather',
        theme: AppThemes.light,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}

class RepositoriesProvider extends StatelessWidget {
  final Widget child;

  const RepositoriesProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>(
          create: (context) => WeatherRepositoryImpl(),
        ),
      ],
      child: child,
    );
  }
}
