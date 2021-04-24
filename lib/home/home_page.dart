import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/appbar/appbar_widget.dart';
import 'package:devquiz/home/widgets/level_button/badge_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.succes) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BadgeButton(
                      label: "Easy",
                      badgeType: BadgeType.Primary,
                    ),
                    BadgeButton(
                      label: "Medium",
                      badgeType: BadgeType.Success,
                    ),
                    BadgeButton(
                      label: "Hard",
                      badgeType: BadgeType.Warning,
                    ),
                    BadgeButton(
                      label: "Expert",
                      badgeType: BadgeType.Danger,
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: controller.quizzes!
                        .map(
                          (e) => QuizCard(
                            title: "State Management",
                            completedAmount: e.quetionAnswered,
                            total: e.questions.length,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.darkGreen,
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller.getQuizzes();
    controller.getUser();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }
}
