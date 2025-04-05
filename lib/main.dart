import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:weather/setup_locator.dart';

import 'package:weather/views/home/home_screen.dart';

import 'core/theme/theme.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await dotenv.load(fileName: 'assets/.env');
  runApp(
    MaterialApp(
      title: 'Weather',
      theme: AppThemes.light,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

// class RepositoriesProvider extends StatelessWidget {
//   final Widget child;
//
//   const RepositoriesProvider({Key? key, required this.child}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider<WeatherRepository>(
//           create:
//               (context) => WeatherRepositoryImpl(service: WeatherServiceImpl()),
//         ),
//       ],
//       child: child,
//     );
//   }
// }
