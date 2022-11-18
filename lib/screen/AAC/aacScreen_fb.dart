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
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Home/component/appbar.dart';
import '../Home/component/drawer.dart';
import '../../theme.dart';

class AacScreenfb extends StatefulWidget {
  // const AacScreen({Key? key}) : super(key: key);
  AacScreenfb({Key? key, required this.title, required this.idx}) : super(key: key);
  final String title;
  final int idx;

  @override
  _AacScreenfb createState() => _AacScreenfb(idx: idx);
}

Map pickImg = new Map();

var categories = ['expression', 'demand', 'emotion', 'sense', 'greeting', 'question'];
var docs = [

  //의사 표현
  [
    {"icon": "assets/image/03_expression/bad.png", "img": '', "name": "싫어요", "code": "bad"},
    {"icon": "assets/image/03_expression/done.png", "img": '', "name": "다 했어요", "code": "done"},
    {"icon": "assets/image/03_expression/fall.png", "img": '', "name": "넘어졌어요", "code": "fall"},
    {"icon": "assets/image/03_expression/gohome.png", "img": '', "name": "집에 갈래요", "code": "gohome"},
    {"icon": "assets/image/03_expression/good.png", "img": '', "name": "좋아요", "code": "good"},
    {"icon": "assets/image/03_expression/mine.png", "img": '', "name": "내 거예요", "code": "mine"},
    {"icon": "assets/image/03_expression/myturn.png", "img": '', "name": "내 차례예요", "code": "myturn"},
    {"icon": "assets/image/03_expression/yourturn.png", "img": '', "name": "당신 차례예요", "code": "yourturn"},
    {"icon": "assets/image/03_expression/no.png", "img": '', "name": "아니에요", "code": "no"},
    {"icon": "assets/image/03_expression/play.png", "img": '', "name": "놀아요", "code": "play"},
    {"icon": "assets/image/03_expression/stop.png", "img": '', "name": "그만 할래요", "code": "stop"},
    {"icon": "assets/image/03_expression/thirsty.png", "img": '', "name": "목 말라요", "code": "thirsty"},
    {"icon": "assets/image/03_expression/together.png", "img": '', "name": "같이 해요", "code": "together"},
    {"icon": "assets/image/03_expression/toilet.png", "img": '', "name": "화장실 가고 싶어요", "code": "toilet"},
    {"icon": "assets/image/03_expression/yes.png", "img": '', "name": "맞아요", "code": "yes"},
  ],

  // 요구
  [
    {"icon": "assets/image/05_demand/do.png", "img": '', "name": "하고 싶어요", "code": "do"},
    {"icon": "assets/image/05_demand/give.png", "img": '', "name": "주세요", "code": "give"},
    {"icon": "assets/image/05_demand/help.png", "img": '', "name": "도와주세요", "code": "help"},
    {"icon": "assets/image/05_demand/hungry.png", "img": '', "name": "먹고 싶어요", "code": "hungry"},
    {"icon": "assets/image/05_demand/read.png", "img": '', "name": "읽어주세요", "code": "read"},
    {"icon": "assets/image/05_demand/see.png", "img": '', "name": "이것 보세요", "code": "see"},
    {"icon": "assets/image/05_demand/want.png", "img": '', "name": "갖고 싶어요", "code": "want"},
  ],

// 감정
  [
    {"icon": "assets/image/02_emotion/angry.png", "img": '', "name": "화가 나요", "code": "angry"},
    {"icon": "assets/image/02_emotion/boring.png", "img": '', "name": "지루해요", "code": "boring"},
    {"icon": "assets/image/02_emotion/fine.png", "img": '', "name": "괜찮아요", "code": "fine"},
    {"icon": "assets/image/02_emotion/funny.png", "img": '', "name": "재미있어요", "code": "funny"},
    {"icon": "assets/image/02_emotion/happy.png", "img": '', "name": "행복해요", "code": "happy"},
    {"icon": "assets/image/02_emotion/laugh.png", "img": '', "name": "웃겨요", "code": "laugh"},
    {"icon": "assets/image/02_emotion/sad.png", "img": '', "name": "슬퍼요", "code": "sad"},
    {"icon": "assets/image/02_emotion/scary.png", "img": '', "name": "무서워요", "code": "scary"},
    {"icon": "assets/image/02_emotion/sleepy.png", "img": '', "name": "졸려요", "code": "sleepy"},
  ],

  // 감각
  [
    {"icon": "assets/image/04_sense/cold.png", "img": '', "name": "추워요", "code": "cold"},
    {"icon": "assets/image/04_sense/delicious.png", "img": '', "name": "맛있어요", "code": "delicious"},
    {"icon": "assets/image/04_sense/eww.png", "img": '', "name": "맛없어요", "code": "eww"},
    {"icon": "assets/image/04_sense/hot.png", "img": '', "name": "더워요", "code": "hot"},
    {"icon": "assets/image/04_sense/salty.png", "img": '', "name": "짜요", "code": "salty"},
    {"icon": "assets/image/04_sense/sick.png", "img": '', "name": "아파요", "code": "sick"},
    {"icon": "assets/image/04_sense/smell.png", "img": '', "name": "냄새나요", "code": "smell"},
    {"icon": "assets/image/04_sense/sour.png", "img": '', "name": "셔요", "code": "sour"},
    {"icon": "assets/image/04_sense/spicy.png", "img": '', "name": "매워요", "code": "spicy"},
    {"icon": "assets/image/04_sense/sweet.png", "img": '', "name": "달콤해요", "code": "sweet"},
  ],

  // 인사
  [
    {"icon": "assets/image/01_greeting/goodbye_1.png", "img": '', "name": "안녕히 가세요", "code": "goodbye_1"},
    {"icon": "assets/image/01_greeting/goodbye_2.png", "img": '', "name": "안녕히 계세요", "code": "goodbye_2"},
    {"icon": "assets/image/01_greeting/hello.png", "img": '', "name": "안녕하세요", "code": "hello"},
    {"icon": "assets/image/01_greeting/ntmy.png", "img": '', "name": "만나서 반가워요", "code": "ntmy"},
    {"icon": "assets/image/01_greeting/sorry.png", "img": '', "name": "죄송합니다", "code": "sorry"},
    {"icon": "assets/image/01_greeting/thank.png", "img": '', "name": "감사합니다", "code": "thank"},

  ],

  // 질문
  [
    {"icon": "assets/image/06_question/how.png", "img": '', "name": "어떻게 해요?", "code": "how"},
    {"icon": "assets/image/06_question/idk.png", "img": '', "name": "모르겠어요", "code": "idk"},
    {"icon": "assets/image/06_question/know.png", "img": '', "name": "알았어요", "code": "know"},
    {"icon": "assets/image/06_question/what.png", "img": '', "name": "뭐예요?", "code": "what"},
    {"icon": "assets/image/06_question/when.png", "img": '', "name": "언제요?", "code": "when"},
    {"icon": "assets/image/06_question/where.png", "img": '', "name": "어디예요?", "code": "where"},
    {"icon": "assets/image/06_question/who.png", "img": '', "name": "누구예요?", "code": "who"},
    {"icon": "assets/image/06_question/why.png", "img": '', "name": "왜요?", "code": "why"},
  ]
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

class _AacScreenfb extends State<AacScreenfb> {

  int idx;
  File? _image;
  var selectedIndex = 1;
  final db = FirebaseFirestore.instance;
  final currentCard = {'accName': '', 'accImg':''};

  _AacScreenfb({required this.idx});

  Future getImageFromGallery(int index) async{

    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    var now = new DateTime.now();
    String nowtime = DateFormat('yyMMdd_HHmmss').format(now); // 여기서 에러가 있는데 돌아가는 건 잘 돌아감
    String _nowtime = '_' + nowtime;
    docs.elementAt(idx).elementAt(index)['img'] = _nowtime;

    setState(() {
      _image = File(image!.path);
    });

    pickImg[docs.elementAt(idx).elementAt(index)["img"]] = _image; //해당 key에 저장됨
  }

  Future getDocFromServer (int index) async{
    var collName = categories.elementAt(idx);
    var docName = docs.elementAt(idx).elementAt(index)["code"];
    // final docRef = db.collection(collName).doc(docName);
    //
    // return await docRef.get();
    final ref = db.collection(collName).doc(docName).withConverter(
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

  final FlutterTts tts = FlutterTts();

  speechTTS(){
    tts.setLanguage('kr');
    tts.setSpeechRate(0.9);
    tts.setPitch(1.2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(
        ),
        appBar: MainAppBar(appBar: AppBar()),
        body: GridView.count(
          crossAxisCount: 2,
          //1 개의 행에 보여줄 item 개수
          childAspectRatio: 2 / 2,
          //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 10,
          //수평 Padding
          crossAxisSpacing: 0,
          //수직 Padding
          children: List.generate(docs.elementAt(idx).length, (index) {
                () => {getDocFromServer(index)};
            //item 의 반목문 항목 형성
            return Container(////////////////////////////////////////////////////
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
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => getImageFromGallery(index),
                        tooltip: '아이콘으로 넣을 이미지를 골라봐!',
                        icon: Icon(Icons.photo_library),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 3,
                        padding: EdgeInsets.all(1.0),
                        child: Center(
                          child: docs.elementAt(idx).elementAt(index)['img'] == ''
                              ? Image.network(
                            'https://' + currentCard['accImg']!,
                            errorBuilder:
                                (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Image.asset(docs.elementAt(idx).elementAt(index)['icon']!);
                            },
                          )
                              : Image.file(pickImg[docs.elementAt(idx).elementAt(index)['img']!]),
                        ),
                      ),
                    ),

                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                            mainAxisSize : MainAxisSize.max,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  tts.setVolume(0.7);
                                  tts.speak(docs.elementAt(idx).elementAt(index)['name']!); // currentCard['accName']!
                                },
                                tooltip: '어떻게 발음하는지 들어봐!',
                                icon: Icon(Icons.volume_up),
                              ),
                              Text.rich(
                                  TextSpan(
                                      text: docs.elementAt(idx).elementAt(index)['name']!,
                                      style: textTheme().headline1?.copyWith(
                                          color: kTextColor,
                                          fontSize: 20
                                      ))),

                            ]
                        )
                    ),
                  ]),

            );
          }),
        ),
        bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.pink.shade100,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.pink.shade200,
          onTap: (i) {
            setState((){
              selectedIndex = i;
              print(i);
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              // color: Color.fromRGBO(226, 167, 194, 1.0),)),
              label: "홈",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.question_answer_rounded),
                //color: Color.fromRGBO(226, 167, 194, 1.0),)),
                label: "AAC"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              //color: Color.fromRGBO(226, 167, 194, 1.0),)),
              label: "설정",),
          ],
        )
    );
  }
}

