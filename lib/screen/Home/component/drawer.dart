import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:KDT_SENTIMENTO/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/image/happy.PNG'),
              backgroundColor: Colors.white,
            ),
            otherAccountsPictures: const <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/image/face.png'),
              ),
            ],
            accountName: Text.rich(
                TextSpan(
                  text: '멘토스',
                  style: textTheme().headline1?.copyWith(
                    color: kTextColor,
                    fontSize: 15,
                  ),
                )
            ),
            accountEmail: Text.rich(
                TextSpan(
                  text: 'mentos@delicious.com',
                  style: textTheme().headline1?.copyWith(
                    color: kTextColor,
                    fontSize: 15,
                  ),
                )
            ),
            onDetailsPressed: () {
            },
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
          ),
          ListTile(
            leading: Icon(
              Icons.manage_accounts,
              color: Colors.grey[850],
            ),
            title: Text.rich(
                TextSpan(
                  text: '마이페이지',
                  style: textTheme().headline1?.copyWith(
                      color: kTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
            ),
            onTap: () {
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              color: Colors.grey[850],
            ),
            title: Text.rich(
                TextSpan(
                  text: '문의사항',
                  style: textTheme().headline1?.copyWith(
                      color: kTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
            ),
            onTap: () {
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.block_outlined,
              color: Colors.grey[850],
            ),
            title: Text.rich(
                TextSpan(
                  text: '로그아웃',
                  style: textTheme().headline1?.copyWith(
                      color: kTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
            ),
            onTap: () {
            },
            trailing: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
