import 'dart:convert';

import 'package:devquiz/shared/models/question_model.dart';

enum Level {
  easy,
  medium,
  hard,
  expert,
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int quetionAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.quetionAnswered = 0,
    required this.image,
    required this.level,
  });

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      quetionAnswered: map['quetionAnswered'] ?? 0,
      image: map['image'],
      level: (map['level'] as int).toLevel(),
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'quetionAnswered': quetionAnswered,
      'image': image,
      'level': level.toInt(),
    };
  }
}

extension IntLevelExt on Level {
  int toInt() => this.index;
}

extension LevelIntExt on int {
  Level toLevel() => Level.values[this];
}
