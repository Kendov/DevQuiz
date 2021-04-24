import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();
  HomeState get state => stateNotifier.value;

  set state(HomeState state) => stateNotifier.value = state;

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.succes;
  }

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.succes;
  }
}
