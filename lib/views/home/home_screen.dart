import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/models/weather_model.dart';

import 'package:weather/views/home/bloc/home_bloc.dart';
import 'package:weather/views/home/bloc/home_state.dart';

import '../../core/theme/theme.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../widgets/widgets.dart';
import 'bloc/home_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    // _init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ErrorScreen(message: WeatherString.message_error),
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (context) => HomeBloc()..add(InitHomeEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            final bloc = BlocProvider.of<HomeBloc>(context);
            switch (state.status) {
              case HomeStatus.init:
                bloc.add(InitHomeEvent());

                break;
              case HomeStatus.loaded:
                // TODO: Handle this case.
                break;
              case HomeStatus.error:
                _showError().whenComplete(
                  () => bloc.add(ChangeStatusEvent(status: HomeStatus.init)),
                );
                break;
            }
          },
          builder:
              (context, state) =>
                  state.status == HomeStatus.init ||
                          state.status == HomeStatus.error
                      ? LoadingWidget()
                      : homeWidget(context),
        ),
      ),
    );
  }

  Widget homeWidget(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final bloc = BlocProvider.of<HomeBloc>(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 56),
          Text(
            bloc.state.currentWeather?.nameTemp() ?? "",
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          Text(
            bloc.state.currentWeather?.nameCity ?? "",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 62),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              decoration: BoxDecoration(color: AppColors.white),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  // final item = bloc.state.listForecast![index];
                  String key = bloc.state.listForecast!.keys.elementAt(index);
                  WeatherModel item = bloc.state.listForecast![key]![0];

                  return Container(
                    height: 80,
                    decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(width: 0.1))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            item.nameWeekDay ?? "",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.nameTempC(),
                            style: Theme.of(context).textTheme.displaySmall,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _showError() {
    return showGeneralDialog(
      context: context,
      pageBuilder:
          (context, animation, secondaryAnimation) => ErrorScreen(
            message: WeatherString.message_error,
            onTap: () => Navigator.pop(context),
          ),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack, // Hiệu ứng đàn hồi nhẹ
          ),
          child: child,
        );
      },
    );
  }
}
