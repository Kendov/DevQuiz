import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int length;
  final double progress;

  const QuestionIndicatorWidget({
    Key? key,
    required this.length,
    required this.progress,
  }) : super(key: key);

  int get _currentPage => progress.toInt();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Question ${_currentPage + 1}",
                style: AppTextStyles.body,
              ),
              Text(
                "$_currentPage/$length",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(value: progress / length),
        ],
      ),
    );
  }
}
