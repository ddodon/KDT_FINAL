import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Speaking/speaking_TTS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class speakingMenu extends StatelessWidget {
  const speakingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: (){},
                child: Text("안녕하세요")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => speakingTTS())));
                },
                child: Text("감사합니다")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: (){},
                child: Text("안녕하세요")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => speakingTTS())));
                },
                child: Text("감사합니다")),
          ],
        ),
      ),
    );
  }
}


