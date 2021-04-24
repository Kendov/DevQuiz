import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final int completedAmount;
  final int total;

  const QuizCard({
    Key? key,
    required this.title,
    required this.completedAmount,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 200,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/data.png"),
          Text(
            title,
            style: AppTextStyles.heading15,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  '$completedAmount/$total',
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(
                    value: completedAmount / total,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
