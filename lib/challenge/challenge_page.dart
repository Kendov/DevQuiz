import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final _controller = ChallengeController();
  final _pageController = PageController();
  var _selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<double>(
                valueListenable: _controller.progressNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  length: widget.questions.length,
                  progress: value,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: widget.questions
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: QuizWidget(
                  question: e,
                  onSelected: _onSelected,
                ),
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ValueListenableBuilder<double>(
            valueListenable: _controller.progressNotifier,
            builder: (context, value, _) => Row(
              children: [
                if (value + 1 != widget.questions.length && !_selected)
                  Expanded(
                    flex: 5,
                    child: NextButtonWidget.white(
                      label: "Next",
                      onTap: () {
                        _nextPage();
                      },
                    ),
                  ),
                if (value + 1 == widget.questions.length)
                  Expanded(
                    flex: 5,
                    child: NextButtonWidget.green(
                      label: "Confirm",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              title: widget.title,
                              lenght: widget.questions.length,
                              result: _controller.rightAnswerCount,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _controller.progress = _pageController.page!;
      _controller.currentPage = _pageController.page!.toInt();
    });
  }

  void _nextPage() {
    if (_controller.currentPage + 1 < widget.questions.length) {
      final Duration duration = Duration(milliseconds: 500);

      _pageController
          .nextPage(
            duration: duration,
            curve: Curves.ease,
          )
          .then((value) => _selected = false);
    }
  }

  void _onSelected(bool value) {
    if (value) {
      _controller.rightAnswerCount++;
    }
    _nextPage();
  }
}
