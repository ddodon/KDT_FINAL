import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Speaking/speaking_TTS4.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Speaking/speaking_TTS1.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Speaking/speaking_TTS2.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Speaking/speaking_TTS3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../theme.dart';

class speakingMenu extends StatelessWidget {
  const speakingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon:Icon(Icons.arrow_back,size: 35,)),
                Text('',style: TextStyle(color: kTextColor,fontSize: 30),)],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),

                  ),
                    minimumSize: const Size(200, 70)
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => speakingTTS1())));
                },
                child: Text("안녕하세요",
                  style:  textTheme().bodyText2?.copyWith(
                      color: Colors.white,
                      fontSize: 20,fontWeight: FontWeight.bold),)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                    minimumSize: const Size(200, 70)
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => speakingTTS2() )));
                },
                child: Text("감사합니다",
                  style: textTheme().bodyText2?.copyWith(
                      color: Colors.white,
                      fontSize: 20,fontWeight: FontWeight.bold),)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                    minimumSize: const Size(200, 70)
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => speakingTTS3() )));
                },
                child: Text("미안합니다",
                    style: textTheme().bodyText2?.copyWith(
                        color: Colors.white,
                        fontSize: 20,fontWeight: FontWeight.bold),)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                    minimumSize: const Size(200, 70)
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => speakingTTS4())));
                },
                child: Text("반갑습니다",
                    style: textTheme().bodyText2?.copyWith(
                        color: Colors.white,
                        fontSize: 20, fontWeight: FontWeight.bold),)),
          ],
        ),
      ),
    );
  }
}


