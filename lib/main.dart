import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  static const _questions = [
    {
      "questionText": "What's your favorite color?",
      'answers': [
        {"text": 'Black', "score": 10},
        {"text": 'Red', "score": 5},
        {"text": 'Green', "score": 3},
        {"text": 'White', "score": 1}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      'answers': [
        {"text": 'Rabbit', "score": 3},
        {"text": 'Snake', "score": 11},
        {"text": 'Elephant', "score": 5},
        {"text": 'Lion', "score": 9}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Uwu'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
