import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenght;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.lenght,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy1),
            Column(
              children: [
                Text(
                  "Congratulations!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text.rich(
                    TextSpan(
                      style: AppTextStyles.body,
                      text: "You finish ",
                      children: [
                        TextSpan(
                          text: this.title,
                          style: AppTextStyles.bodyBold,
                        ),
                        TextSpan(
                          text: "\nwith $result/$lenght correct answers",
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 300,
                  child: NextButtonWidget.purple(
                    label: "Share",
                    onTap: () {
                      Share.share("I just finished $title on devquiz app");
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                NextButtonWidget.transparent(
                  label: "Return to home",
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
