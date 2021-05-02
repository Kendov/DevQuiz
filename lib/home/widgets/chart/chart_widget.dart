import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final int progress;

  const ChartWidget({Key? key, required this.progress})
      : assert(progress >= 0 && progress <= 100),
        super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double get _progressPercentage => (widget.progress / 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => Stack(
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: _animation.value,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
                child: Text(
              "${(_animation.value * 100).toStringAsFixed(0)}%",
              style: AppTextStyles.heading,
            ))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: .0, end: _progressPercentage)
        .animate(_animationController);
    _animationController.forward();
  }
}
