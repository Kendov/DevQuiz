import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(0);
  final progressNotifier = ValueNotifier<double>(0);
  int rightAnswerCount = 0;

  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  double get progress => progressNotifier.value;
  set progress(double value) => progressNotifier.value = value;
}
