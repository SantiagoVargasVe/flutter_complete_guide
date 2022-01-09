import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          child: Text(answerText),
          onPressed: selectHandler,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue[300]),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ));
  }
}
