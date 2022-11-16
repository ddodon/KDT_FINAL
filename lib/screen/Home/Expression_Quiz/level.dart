import 'package:KDT_SENTIMENTO/screen/Home/Expression_Quiz/camera_easy.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Expression_Quiz/camera_hard.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Expression_Quiz/camera_mid.dart';
import 'package:flutter/material.dart';
import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:flutter/cupertino.dart';
import '../../../theme.dart';

class Expression_quiz extends StatelessWidget {
  const Expression_quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.white,
        body:
        Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kBackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),

                    ),
                    minimumSize: const Size(230, 120)
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => camera1())));
                },
                child: Text("초급",
                    style: textTheme().headline1?.copyWith(
                        color: kSecondaryColor,
                        fontSize: 20,fontWeight: FontWeight.bold))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kBackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    minimumSize: const Size(230, 120)
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => camera2())));
                },
                child: Text("중급",
                    style:textTheme().headline1?.copyWith(
                        color: kSecondaryColor,
                        fontSize: 20,fontWeight: FontWeight.bold))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kBackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    minimumSize: const Size(230, 120)
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => camera3() )));
                },
                child: Text("고급",
                    style: textTheme().headline1?.copyWith(
                        color: kSecondaryColor,
                        fontSize: 20,fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}
