import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quiz/quiz.dart';
import './quiz/result.dart';
//행동학습
class expressLearn1 extends StatefulWidget {
  expressLearn1({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _expressLearn1 createState() => _expressLearn1();
}

class _expressLearn1 extends State<expressLearn1> {
  final _questions = const [
    {
      'questionText': '사진 속 인물의 표정을 보고 감정을 맞춰봐!',
      'imagePath':'assets/image/1.jpg',
      'answers': [{'text':'기쁨','score':10},

        {'text':'슬픔','score':5}]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        body: _questionIndex < _questions.length
            ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions)
            : Result(_totalScore)
    );
  }
}