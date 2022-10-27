import 'package:flutter/material.dart';
import './endbutton.dart';
import './questioncontainer.dart';
import 'package:test_app/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s you favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Green', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s you favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score,': 5},
        {'text': 'Rat', 'score': 8},
        {'text': 'Javi', 'score': 10},
      ],
    },
    {
      'questionText': 'Who\'s Pogi?',
      'answers': [
        {
          'text': 'Ditto',
          'score': 2,
        },
        {
          'text': 'Javi',
          'score': 10,
        },
        {
          'text': 'Jaymard',
          'score': 5,
        },
        {
          'text': 'Kirby',
          'score': 8,
        }
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void resetAnswer() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    print('HHHHHHHHHH');
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('You have reached the end');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : EndButton(resetAnswer, _totalScore),
      ),
    );
  }
}
