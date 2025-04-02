import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/theme/theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 96,
        height: 96,
        child: Image.asset(AppImages.ic_loading)
            .animate(onPlay: (controller) => controller.repeat(), delay: 500.ms)
            .rotate(end: 1, duration: 1000.ms),
      ),
    );
  }
}
