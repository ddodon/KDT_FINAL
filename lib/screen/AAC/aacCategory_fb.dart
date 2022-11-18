import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import "package:flutter_tts/flutter_tts.dart";
import 'package:dio/dio.dart';
import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:KDT_SENTIMENTO/screen/AAC/aac.dart';
import 'package:KDT_SENTIMENTO/screen/AAC/aacScreen_fb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../theme.dart';


class AacCategoryfb extends StatefulWidget {
  AacCategoryfb({Key? key, required this.title,}) : super(key: key);
  final String title;

  @override
  _AacCategoryfb createState() => _AacCategoryfb();
}
var cateList = [
  {"icon": "assets/image/3_expression.png", "img": '', "name": "의사표현", "code": "expression"},
  {"icon": "assets/image/5_demand.png", "img": '', "name": "요구", "code": "demand"},
  {"icon": "assets/image/2_emotion.png", "img": '', "name": "감정", "code": "emotion"},
  {"icon": "assets/image/4_sense.png", "img": '', "name": "감각", "code": "sense"},
  {"icon": "assets/image/1_greeting.png", "img": '', "name": "인삿말", "code": "greeting"},
  {"icon": "assets/image/6_question.png", "img": '', "name": "질문", "code": "question"},
];

class aacCard{
  final String? cardName;
  final String? ImgURL;

  aacCard({
    this.cardName,
    this.ImgURL
  });

  factory aacCard.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return aacCard(
      cardName: data?['accName'],
      ImgURL: data?['accImg'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (cardName != null) "accName": cardName,
      if (ImgURL != null) "accImg": ImgURL,
    };
  }
}

class _AacCategoryfb extends State<AacCategoryfb> {

  final FlutterTts tts = FlutterTts();
  final db = FirebaseFirestore.instance;
  final currentCard = {'accName': '', 'accImg':''};

  Future getDocFromServer (int index) async{
    var docName = cateList.elementAt(index)["code"];

    final ref = db.collection('category').doc(docName).withConverter(
      fromFirestore: aacCard.fromFirestore,
      toFirestore: (aacCard card, _) => card.toFirestore(),
    );
    final docSnap = await ref.get();
    final card = docSnap.data();
    if (card != null) {
      currentCard['accName'] = card.cardName!;
      currentCard['accImg'] = card.ImgURL!;
    } else {
      print("No such document.");
    }
  }
  speechTTS(){
    tts.setLanguage('kr');
    tts.setSpeechRate(0.9);
    tts.setPitch(1.2);
  }

  @override
  Widget build(BuildContext context) {
    var screenratio = MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;
    return Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 1,
          //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 0,
          //수평 Padding
          crossAxisSpacing: 0,
          //수직 Padding
          children: List.generate(6, (index) {
                () => {getDocFromServer(index)};
            //item 의 반목문 항목 형성
            return InkWell(
                onTap: () {
                  tts.setVolume(0.7);
                  tts.speak(cateList.elementAt(index)['name']!); // currentCard['accName']!
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => AacScreenfb(title: 'aac', idx: index))));
                },
                child: Container(///////////////////////////////////////////////
                    margin: index % 2 == 0
                        ? const EdgeInsets.fromLTRB(20, 20, 10, 1)
                        : const EdgeInsets.fromLTRB(10, 20, 20, 1),
                    // color: kW,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kW,
                      boxShadow : [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2, // 그림자가 어디까지 퍼질지
                          blurRadius: 8, // 바깥으로 갈 수록 옅어지는
                          offset: Offset(1, 1), // changes position of shadow 오른쪽, 아래 방향 x, y
                        ),
                      ],
                    ),

                    child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 4,
                                margin: EdgeInsets.fromLTRB(1, 30, 1, 10),
                                child: Center(
                                  child: Image.network(
                                    'https://' + currentCard['accImg']!,
                                    errorBuilder:
                                        (BuildContext context, Object exception, StackTrace? stackTrace) {
                                      return Image.asset(cateList.elementAt(index)['icon']!);
                                    },
                                  ),
                                )
                            ),),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text.rich(
                                TextSpan(
                                    text: cateList.elementAt(index)['name']!,
                                    style: textTheme().headline1?.copyWith(
                                        color: kTextColor,
                                        fontSize: 20
                                    ))), // currentCard['accName']!
                          )
                        ]
                    )
                )
            );
          }),

        )
    );
  }
}