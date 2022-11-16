import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import "package:flutter_tts/flutter_tts.dart";
import 'package:dio/dio.dart';
import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:KDT_SENTIMENTO/screen/AAC/aac.dart';
import 'package:KDT_SENTIMENTO/screen/AAC/aacScreen.dart';


class AacCategory extends StatefulWidget {
  // const AacScreen({Key? key}) : super(key: key);
  AacCategory({Key? key, required this.title,}) : super(key: key);
  final String title;

  @override
  _AacCategory createState() => _AacCategory();
}

var cateIcon = [
  {"icon": "assets/image/3_expression.png", "img": '', "name": "의사표현"},
  {"icon": "assets/image/5_demand.png", "img": '', "name": "요구"},
  {"icon": "assets/image/2_emotion.png", "img": '', "name": "감정"},
  {"icon": "assets/image/4_sense.png", "img": '', "name": "감각"},
  {"icon": "assets/image/1_greeting.png", "img": '', "name": "인삿말"},
  {"icon": "assets/image/6_question.png", "img": '', "name": "질문"},
];

// Map pickImg = new Map();

class _AacCategory extends State<AacCategory> {

  final FlutterTts tts = FlutterTts();

  speechTTS(){
    tts.setLanguage('kr');
    tts.setSpeechRate(0.9);
    tts.setPitch(1.2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          //1 개의 행에 보여줄 item 개수
          childAspectRatio: 2 / 2,
          //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 10,
          //수평 Padding
          crossAxisSpacing: 0,
          //수직 Padding
          children: List.generate(6, (index) {
            //item 의 반목문 항목 형성
            return InkWell(
                onTap: () {
                  tts.setVolume(0.7);
                  tts.speak(cateIcon.elementAt(index)['name']!);
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => AacScreen(title: 'aac', idx: index))));
                },
                child: Container(///////////////////////////////////////////////
                    margin: index % 2 == 0
                        ? const EdgeInsets.fromLTRB(10, 1, 10, 1)
                        : const EdgeInsets.fromLTRB(0, 1, 5, 1),
                    color: kPink,
                    child: Column(
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 6,
                              margin: EdgeInsets.fromLTRB(1, 30, 1, 10),
                              child: Center(
                                child: Image.asset(
                                  cateIcon.elementAt(index)['icon']!,
                                ),
                              )
                          ),
                          Text(cateIcon.elementAt(index)['name']!,),
                        ]
                    )
                )

            );
          }),

        )
    );
  }
}