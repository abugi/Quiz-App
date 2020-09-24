import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (totalScore <= 8) {
      resultText = 'You are awesome and Innocent!!';
    } else if (totalScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (totalScore <= 16) {
      resultText = "You are strange";
    } else {
      resultText = 'You are so bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        FlatButton(
          child: Text('Restart Quiz'),
          onPressed: resetHandler,
          textColor: Colors.blue,
        ),
      ],
    ));
  }
}
