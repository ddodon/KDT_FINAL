import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:KDT_SENTIMENTO/screen/mainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const MainAppBar({Key? key, required this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(245, 249, 255, 0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.contain,
            height: 53,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => MainScreen())));
          },
          icon: Icon(Icons.home_filled),
          iconSize: 30,
          color: Colors.black12,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}


