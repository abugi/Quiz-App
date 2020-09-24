import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question text': 'What is your favorite color?',
      'Answers': [
        {'text': 'Green', 'score': 5},
        {'text': 'Purple', 'score': 7},
        {'text': 'Pink', 'score': 5},
        {'text': 'Black', 'score': 10}
      ]
    },
    {
      'question text': 'What is your favorite animal?',
      'Answers': [
        {'text': 'Mouse', 'score': 5},
        {'text': 'Kangaroo', 'score': 7},
        {'text': 'Cat', 'score': 5}
      ]
    },
    {
      'question text': 'Who is favorite Instructor?',
      'Answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Brad', 'score': 8},
        {'text': 'Shaun', 'score': 10},
        {'text': 'Grider', 'score': 6}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('App Title')),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
