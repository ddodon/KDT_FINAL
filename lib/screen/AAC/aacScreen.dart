import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import "package:flutter_tts/flutter_tts.dart";
import "package:intl/intl.dart";
import 'package:dio/dio.dart';
import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:KDT_SENTIMENTO/screen/AAC/aac.dart';

import 'package:flip_card/flip_card.dart';

class AacScreen extends StatefulWidget {
  // const AacScreen({Key? key}) : super(key: key);
  AacScreen({Key? key, required this.title, required this.idx}) : super(key: key);
  final String title;
  final int idx;

  @override
  _AacScreen createState() => _AacScreen(idx: idx);
}


var preIcon_doctor = [ [ //의사 표현
  {"icon": "assets/image/03_expression/bad.png", "img": '', "name": "싫어요"},
  {"icon": "assets/image/03_expression/done.png", "img": '', "name": "다 했어요"},
  {"icon": "assets/image/03_expression/fall.png", "img": '', "name": "넘어졌어요"},
  {"icon": "assets/image/03_expression/gohome.png", "img": '', "name": "집에 갈래요"},
  {"icon": "assets/image/03_expression/good.png", "img": '', "name": "좋아요"},
  {"icon": "assets/image/03_expression/mine.png", "img": '', "name": "내 거예요"},
  {"icon": "assets/image/03_expression/myturn.png", "img": '', "name": "내 차례예요"},
  {"icon": "assets/image/03_expression/yourturn.png", "img": '', "name": "당신 차례예요"},
  {"icon": "assets/image/03_expression/no.png", "img": '', "name": "아니에요"},
  {"icon": "assets/image/03_expression/play.png", "img": '', "name": "놀아요"},
  {"icon": "assets/image/03_expression/stop.png", "img": '', "name": "그만 할래요"},
  {"icon": "assets/image/03_expression/thirsty.png", "img": '', "name": "목 말라요"},
  {"icon": "assets/image/03_expression/together.png", "img": '', "name": "같이 해요"},
  {"icon": "assets/image/03_expression/toilet.png", "img": '', "name": "화장실 가고 싶어요"},
  {"icon": "assets/image/03_expression/yes.png", "img": '', "name": "맞아요"},
],

  // 요구
  [
    {"icon": "assets/image/05_demand/do.png", "img": '', "name": "하고 싶어요"},
    {"icon": "assets/image/05_demand/give.png", "img": '', "name": "주세요"},
    {"icon": "assets/image/05_demand/help.png", "img": '', "name": "도와주세요"},
    {"icon": "assets/image/05_demand/hungry.png", "img": '', "name": "먹고 싶어요"},
    {"icon": "assets/image/05_demand/read.png", "img": '', "name": "읽어주세요"},
    {"icon": "assets/image/05_demand/see.png", "img": '', "name": "이것 보세요"},
    {"icon": "assets/image/05_demand/want.png", "img": '', "name": "갖고 싶어요"},
  ],

// 감정
  [
    {"icon": "assets/image/02_emotion/angry.png", "img": '', "name": "화가 나요"},
    {"icon": "assets/image/02_emotion/boring.png", "img": '', "name": "지루해요"},
    {"icon": "assets/image/02_emotion/fine.png", "img": '', "name": "괜찮아요"},
    {"icon": "assets/image/02_emotion/funny.png", "img": '', "name": "재미있어요"},
    {"icon": "assets/image/02_emotion/happy.png", "img": '', "name": "행복해요"},
    {"icon": "assets/image/02_emotion/laugh.png", "img": '', "name": "웃겨요"},
    {"icon": "assets/image/02_emotion/sad.png", "img": '', "name": "슬퍼요"},
    {"icon": "assets/image/02_emotion/scary.png", "img": '', "name": "무서워요"},
    {"icon": "assets/image/02_emotion/sleepy.png", "img": '', "name": "졸려요"},
  ],

  // 감각
  [
    {"icon": "assets/image/04_sense/cold.png", "img": '', "name": "추워요"},
    {"icon": "assets/image/04_sense/delicious.png", "img": '', "name": "맛있어요"},
    {"icon": "assets/image/04_sense/eww.png", "img": '', "name": "맛없어요"},
    {"icon": "assets/image/04_sense/hot.png", "img": '', "name": "더워요"},
    {"icon": "assets/image/04_sense/salty.png", "img": '', "name": "짜요"},
    {"icon": "assets/image/04_sense/sick.png", "img": '', "name": "아파요"},
    {"icon": "assets/image/04_sense/smell.png", "img": '', "name": "냄새나요"},
    {"icon": "assets/image/04_sense/sour.png", "img": '', "name": "셔요"},
    {"icon": "assets/image/04_sense/spicy.png", "img": '', "name": "매워요"},
    {"icon": "assets/image/04_sense/sweet.png", "img": '', "name": "달콤해요"},
  ],

  // 인사
  [
    {"icon": "assets/image/01_greeting/goodbye_1.png", "img": '', "name": "안녕히 가세요"},
    {"icon": "assets/image/01_greeting/goodbye_2.png", "img": '', "name": "안녕히 계세요"},
    {"icon": "assets/image/01_greeting/hello.png", "img": '', "name": "안녕하세요"},
    {"icon": "assets/image/01_greeting/ntmy.png", "img": '', "name": "만나서 반가워요"},
    {"icon": "assets/image/01_greeting/sorry.png", "img": '', "name": "죄송합니다"},
    {"icon": "assets/image/01_greeting/thank.png", "img": '', "name": "감사합니다"},

  ],

  // 질문
  [
    {"icon": "assets/image/06_question/how.png", "img": '', "name": "어떻게 해요?"},
    {"icon": "assets/image/06_question/idk.png", "img": '', "name": "모르겠어요"},
    {"icon": "assets/image/06_question/know.png", "img": '', "name": "알았어요"},
    {"icon": "assets/image/06_question/what.png", "img": '', "name": "뭐예요?"},
    {"icon": "assets/image/06_question/when.png", "img": '', "name": "언제요?"},
    {"icon": "assets/image/06_question/where.png", "img": '', "name": "어디예요?"},
    {"icon": "assets/image/06_question/who.png", "img": '', "name": "누구예요?"},
    {"icon": "assets/image/06_question/why.png", "img": '', "name": "왜요?"},
  ],

];

Map pickImg_doctor = new Map();



class _AacScreen extends State<AacScreen> {

  int idx;
  File? _image;

  _AacScreen({required this.idx});

  Future getImageFromGallery(int index) async{
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    var now = new DateTime.now();
    String nowtime = DateFormat('yyMMdd_HHmmss').format(now); // 여기서 에러가 있는데 돌아가는 건 잘 돌아감
    String _nowtime = '_' + nowtime;
    preIcon_doctor.elementAt(idx).elementAt(index)['img'] = _nowtime;

    setState(() {
      _image = File(image!.path);
    });

    pickImg_doctor[preIcon_doctor.elementAt(idx).elementAt(index)["img"]] = _image; //해당 key에 저장됨
  }

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
        childAspectRatio: 2 / 3,
        //item 의 가로 1, 세로 2 의 비율
        mainAxisSpacing: 10,
        //수평 Padding
        crossAxisSpacing: 0,
        //수직 Padding
        children: List.generate(preIcon_doctor.elementAt(idx).length, (index) {
          //item 의 반목문 항목 형성
          return Container(////////////////////////////////////////////////////
            margin: index % 2 == 0
                ? const EdgeInsets.fromLTRB(10, 5, 10, 5)
                : const EdgeInsets.fromLTRB(0, 5, 10, 5),
            color: Colors.brown.shade100,
            child: Column(
                children: <Widget>[

                  IconButton(
                    onPressed: () => getImageFromGallery(index),
                    tooltip: '아이콘으로 넣을 이미지를 골라봐!',
                    icon: Icon(Icons.photo_library),
                  ),


                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 3.5,
                    padding: EdgeInsets.all(1.0),
                    child: Center(
                      child: preIcon_doctor.elementAt(idx).elementAt(index)['img'] == ''
                          ? Image.asset(
                        preIcon_doctor.elementAt(idx).elementAt(index)['icon']!,
                      )
                          : Image.file(pickImg_doctor[preIcon_doctor.elementAt(idx).elementAt(index)['img']!]),
                    ),
                  ),

                  Row(
                      mainAxisSize : MainAxisSize.max,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            tts.setVolume(0.7);
                            tts.speak(preIcon_doctor.elementAt(idx).elementAt(index)['name']!);
                          },
                          tooltip: '어떻게 발음하는지 들어봐!',
                          icon: Icon(Icons.volume_up),
                        ),

                        Text(
                          preIcon_doctor.elementAt(idx).elementAt(index)['name']!,
                        )
                      ]
                  )

                ]),

          );
        }),
      ),
    );
  }
}
