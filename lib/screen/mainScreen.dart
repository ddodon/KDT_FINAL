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
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: MainAppBar(appBar: AppBar(elevation: 10.0,)),
        body: PageView(
          children: [
            [
              Home(),
              AacCategory(
                title: 'aacScreen',
              ),
              Setting(),
            ][selectedIndex],
          ],
        ),
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
