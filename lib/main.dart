import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

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
  static const _questions = [
    {
      "questionText": "What's your favorite color?",
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      "questionText": "What's your favorite animal?",
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('My first App'),
      ),
      body: Column(
        children: [
          Question(
            _questions[_questionIndex]['questionText'] as String,
          ),
          ...(_questions[_questionIndex]["answers"] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList(),
        ],
      ),
    ));
  }
}
