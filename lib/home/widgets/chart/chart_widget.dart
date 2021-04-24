import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final int progress;

  const ChartWidget({Key? key, required this.progress})
      : assert(progress >= 0 && progress <= 100),
        super(key: key);

  double get _progressPercentage => (progress / 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: _progressPercentage,
                backgroundColor: AppColors.chartSecondary,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
              child: Text(
            "$progress%",
            style: AppTextStyles.heading,
          ))
        ],
      ),
    );
  }
}
