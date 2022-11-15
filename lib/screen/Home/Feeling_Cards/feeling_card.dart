import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../../../theme.dart';

//행동학습
class EmotionCardScreen extends StatefulWidget {
  const EmotionCardScreen({Key? key}) : super(key: key);

  @override
  _GridviewPageState createState() => _GridviewPageState();
}

final emotionItem = [
  {"image": "assets/image/angry.PNG", "name": "화나요"},
  {"image": "assets/image/confidence.PNG", "name": "잘했어요"},
  {"image": "assets/image/disappointed.PNG", "name": "실망했어요"},
  {"image": "assets/image/happy.PNG", "name": "기뻐요"},
  {"image": "assets/image/hurt.PNG", "name": "아파요"},
  {"image": "assets/image/sad.PNG", "name": "슬퍼요"},
  {"image": "assets/image/shocked.PNG", "name": "놀라워요"},
  {"image": "assets/image/sleepy.PNG", "name": "졸려요"},
];

class _GridviewPageState extends State<EmotionCardScreen> {
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
        crossAxisSpacing: 10,
        //수직 Padding
        children: List.generate(8, (index) {
          //item 의 반목문 항목 형성
          return Container(
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: Material(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadiusDirectional.circular(30.0),
                  child: Image.asset(
                    emotionItem.elementAt(index)['image']!,
                  ),
                ),
                back: Material(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadiusDirectional.circular(30.0),
                  child: Center(
                    child: Text(
                        style: textTheme().bodyText2?.copyWith(
                            color: kTextColor,
                            fontSize: 20, fontWeight: FontWeight.bold),
                      emotionItem.elementAt(index)['name']!,
                    ),
                  ),
                ),
              ));
        }),
      ),
    );
  }
}


