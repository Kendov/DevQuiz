import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? indexSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 24,
            ),
            for (var i = 0; i < widget.question.answers.length; i++)
              AnswerWidget(
                answer: widget.question.answers[i],
                isSelected: indexSelected == i,
                disabled: indexSelected != null,
                onTap: (value) {
                  indexSelected = i;
                  setState(() {});
                  Future.delayed(Duration(microseconds: 800)).then(
                    (_) => widget.onSelected(value),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
