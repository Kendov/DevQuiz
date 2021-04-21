import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            title: "Developer kit for user interfaces",
          ),
          AnswerWidget(
            isRight: true,
            isSelected: true,
            title: "Allows the possibility of creating native compiled apps",
          ),
          AnswerWidget(
            title: "I think is a Brazilian coffee branding",
          ),
          AnswerWidget(
            isRight: true,
            title:
                "Allows the creation of desktop apps that are really impressive",
          ),
        ],
      ),
    );
  }
}
