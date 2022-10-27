import 'package:flutter/material.dart';

class EndButton extends StatelessWidget {
  final VoidCallback resetHandler;
  final int resultScore;

  EndButton(this.resetHandler, this.resultScore);
  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'you are ... STRANGE!?';
    } else {
      resultText = 'you are so bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 40),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white),
            child: Text('restart'),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
