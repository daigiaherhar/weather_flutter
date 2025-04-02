import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/theme.dart';
import '../../widgets/widgets.dart';

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
    _init();
    super.initState();
  }

  _init() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body:
          isLoading
              ? LoadingWidget()
              :
          // ErrorScreen(message: WeatherString.message_error),
      homeWidget(context),
    );
  }

  Widget homeWidget(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 56),
          Text("20", style: Theme.of(context).textTheme.displayLarge),
          Text("fsdfsdfsd", style: Theme.of(context).textTheme.displayMedium),
          SizedBox(height: 62),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              decoration: BoxDecoration(color: AppColors.white),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder:
                    (context, index) => Container(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "423423423423423423423423",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "fds",
                              style: Theme.of(context).textTheme.displaySmall,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
