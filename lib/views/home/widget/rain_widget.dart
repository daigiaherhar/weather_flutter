// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
//
// import '../../../core/theme/theme.dart';
//
// class RainWidget extends StatefulWidget {
//   const RainWidget({super.key});
//
//   @override
//   State<RainWidget> createState() => _RainWidgetState();
// }
//
// class _RainWidgetState extends State<RainWidget>
//     with SingleTickerProviderStateMixin {
//   late ValueNotifier<double> counter = ValueNotifier<double>(1);
//   late AnimationController _controller;
//   late Animation<double> _animation1;
//   late Animation<double> _animation2;
//   late Animation<double> _animation3;
//
//   @override
//   void initState() {
//     super.initState();
//     // Tạo một AnimationController để điều khiển hiệu ứng mưa
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Độ dài thời gian của mỗi vòng lặp
//     )..repeat(reverse: true); // Lặp lại animation liên tục
//     Random random = Random();
//     _animation1 = Tween<double>(
//       begin: 1 + random.nextDouble() * .5,
//       end: 1.2,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//     _animation2 = Tween<double>(
//       begin: 1 + random.nextDouble() * .5,
//       end: 1.2,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//     _animation3 = Tween<double>(
//       begin: 1 + random.nextDouble() * .5,
//       end: 1.2,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//     // Chạy animation xuống dưới
//     _controller.addListener(() {
//       setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<double>(
//       builder: (context, value, _) {
//         return CustomPaint(
//           painter: RainPainter(
//             animationValue3: _animation3,
//             animationValue1: _animation1,
//             animationValue2: _animation2,
//           ),
//           child: SizedBox(height: 24, width: 24),
//         );
//       },
//       valueListenable: counter,
//     );
//   }
// }
//
// class RainPainter extends CustomPainter {
//   final Animation<double> animationValue1;
//   final Animation<double> animationValue2;
//   final Animation<double> animationValue3;
//
//   RainPainter({
//     required this.animationValue1,
//     required this.animationValue2,
//     required this.animationValue3,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path_0 = Path();
//     path_0.moveTo(
//       size.width * 0.4375000,
//       size.height * 0.8750000 * animationValue1.value,
//     );
//     path_0.lineTo(size.width * 0.5000000, size.height * 0.7500000);
//     path_0.moveTo(
//       size.width * 0.6041667,
//       size.height * 0.8750000 * animationValue2.value,
//     );
//     path_0.lineTo(size.width * 0.6666667, size.height * 0.7500000);
//     path_0.moveTo(
//       size.width * 0.2708333,
//       size.height * 0.8750000 * animationValue3.value,
//     );
//     path_0.lineTo(size.width * 0.3333333, size.height * 0.7500000);
//
//     path_0.moveTo(size.width * 0.3666667, size.height * 0.6250000);
//     path_0.cubicTo(
//       size.width * 0.2562096,
//       size.height * 0.6250000,
//       size.width * 0.1666667,
//       size.height * 0.5394417,
//       size.width * 0.1666667,
//       size.height * 0.4339042,
//     );
//     path_0.cubicTo(
//       size.width * 0.1666667,
//       size.height * 0.3464312,
//       size.width * 0.2333333,
//       size.height * 0.2656250,
//       size.width * 0.3333333,
//       size.height * 0.2500000,
//     );
//     path_0.cubicTo(
//       size.width * 0.3647012,
//       size.height * 0.1780846,
//       size.width * 0.4389417,
//       size.height * 0.1250000,
//       size.width * 0.5255292,
//       size.height * 0.1250000,
//     );
//     path_0.cubicTo(
//       size.width * 0.6364458,
//       size.height * 0.1250000,
//       size.width * 0.7271000,
//       size.height * 0.2079467,
//       size.width * 0.7333333,
//       size.height * 0.3125000,
//     );
//     path_0.cubicTo(
//       size.width * 0.7921958,
//       size.height * 0.3373171,
//       size.width * 0.8333333,
//       size.height * 0.3982254,
//       size.width * 0.8333333,
//       size.height * 0.4641750,
//     );
//     path_0.cubicTo(
//       size.width * 0.8333333,
//       size.height * 0.5529958,
//       size.width * 0.7587125,
//       size.height * 0.6250000,
//       size.width * 0.6666667,
//       size.height * 0.6250000,
//     );
//     path_0.lineTo(size.width * 0.3666667, size.height * 0.6250000);
//     path_0.close();
//
//     Paint paint_0_stroke =
//         Paint()
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = size.width * 0.08333333;
//     paint_0_stroke.color = AppColors.blueAccent;
//     paint_0_stroke.strokeCap = StrokeCap.round;
//     paint_0_stroke.strokeJoin = StrokeJoin.round;
//     canvas.drawPath(path_0, paint_0_stroke);
//
//     Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
//     paint_0_fill.color = AppColors.blueAccent;
//     canvas.drawPath(path_0, paint_0_fill);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
//
// class Rain3Painter extends CustomPainter {
//   final Animation<double> animationValue1;
//   final Animation<double> animationValue2;
//   final Animation<double> animationValue3;
//
//   Rain3Painter({
//     required this.animationValue1,
//     required this.animationValue2,
//     required this.animationValue3,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path_0 = Path();
//     path_0.moveTo(
//       size.width * 0.4375000,
//       size.height * 0.8750000 * animationValue1.value,
//     );
//     path_0.lineTo(size.width * 0.5000000, size.height * 0.7500000);
//     path_0.moveTo(
//       size.width * 0.6041667,
//       size.height * 0.8750000 * animationValue2.value,
//     );
//     path_0.lineTo(size.width * 0.6666667, size.height * 0.7500000);
//     path_0.moveTo(
//       size.width * 0.2708333,
//       size.height * 0.8750000 * animationValue3.value,
//     );
//     path_0.lineTo(size.width * 0.3333333, size.height * 0.7500000);
//
//     path_0.close();
//
//     Paint paint_0_stroke =
//         Paint()
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = size.width * 0.08333333;
//     paint_0_stroke.color = AppColors.blueAccent;
//     paint_0_stroke.strokeCap = StrokeCap.round;
//     paint_0_stroke.strokeJoin = StrokeJoin.round;
//     canvas.drawPath(path_0, paint_0_stroke);
//
//     Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
//     paint_0_fill.color = AppColors.blueAccent;
//     canvas.drawPath(path_0, paint_0_fill);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
