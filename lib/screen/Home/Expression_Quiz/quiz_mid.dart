import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quiz/quiz.dart';
import './quiz/result.dart';
//행동학습
class expressLearn2 extends StatefulWidget {
  expressLearn2({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _expressLearn2 createState() => _expressLearn2();
}

class _expressLearn2 extends State<expressLearn2> {
  final _questions = const [
    {
      'questionText': '사진 속 인물의 표정을 보고 감정을 맞춰봐!',
      'imagePath':'assets/image/1.jpg',
      'answers': [{'text':'기쁨','score':10},
        {'text':'당황','score':7},{'text':'분노','score':7},
        {'text':'슬픔','score':5}]
    },
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