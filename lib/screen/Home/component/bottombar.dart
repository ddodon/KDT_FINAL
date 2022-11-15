import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:KDT_SENTIMENTO/screen/AAC/aacCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:KDT_SENTIMENTO/screen/home/home.dart';

import 'package:KDT_SENTIMENTO/screen/AAC/aacScreen.dart';
import '../../Setting/setting.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavigationBar')),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.white.withOpacity(.60),
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
        items: [
          BottomNavigationBarItem(
            label: "홈?",
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "AAC",
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "설정",
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),

      );
  }

  List _widgetOptions = [
    Home(),
    Text('aac'),
    Text('설정')
  ];
}
