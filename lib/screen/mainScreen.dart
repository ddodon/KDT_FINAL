<<<<<<< HEAD
import 'package:KDT_SENTIMENTO/screen/Splash/splashScreen.dart';
=======
import 'package:KDT_SENTIMENTO/screen/AAC/aacCategory_fb.dart';
>>>>>>> 53d081ff7510e858b3999d67a3b82edcd51e8884
import 'package:KDT_SENTIMENTO/screen/home/component/appbar.dart';
import 'package:KDT_SENTIMENTO/screen/home/component/drawer.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'AAC/aacCategory.dart'; //////////////////////////////////////////////////
import 'home/home.dart';
import 'Setting/setting.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/mainScreens";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List pages = [Home(), AacCategory(title: 'aacScreen'), Setting()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: MainAppBar(appBar: AppBar(elevation: 10.0,)),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black26,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blueAccent,
          onTap: (i) {
            setState(() {
              selectedIndex = i;
              print(i);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: "홈",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.question_answer_rounded),
                label: "AAC"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "설정",
            ),
          ],
        ));
  }
}
