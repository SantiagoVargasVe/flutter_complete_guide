import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback restartHandler;
  const Result(this.resultScore, this.restartHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = "You're ... strange?!";
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
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
              child: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              onPressed: restartHandler,
              style: TextButton.styleFrom(
                primary: Colors.orange,
              )),
        ],
      ),
    );
  }
}
