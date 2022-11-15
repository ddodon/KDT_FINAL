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
          drawer: MainDrawer(
          ),
          appBar: MainAppBar(appBar: AppBar()),
          body: PageView(
            children: [ ////////////////////////////////////AacCategory로 변경
              [Home(), AacCategory(title: 'aacScreen',), Setting()][selectedIndex],
            ],
          ),
          // IndexedStack(
          //   index: _selectedIndex,
          //   children: [
          //     Home(),
          //     actingScreen(),
          //     sentScreen(),
          //   ],//새봄코드
          // ),
          bottomNavigationBar:BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            selectedItemColor: kPrimaryColor,
            onTap: (i) {
              setState((){
                selectedIndex = i;
                print(i);
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SizedBox(
                    width: 45,
                    height: 45,
                    child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(Icons.home_filled),
                      color: Color.fromRGBO(226, 167, 194, 1.0),)),
                label: "홈",
              ),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      width: 45,
                      height: 45,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.question_answer_rounded),
                        color: Color.fromRGBO(226, 167, 194, 1.0),)),
                  label: "AAC"),
              BottomNavigationBarItem(
                icon: SizedBox(
                    width: 45,
                    height: 45,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings),
                      color: Color.fromRGBO(226, 167, 194, 1.0),)),
                label: "설정",),
            ],
          )
      );
  }
}