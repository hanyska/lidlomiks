import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lidlomiks/constants.dart';
import 'package:lidlomiks/helpers/navigation_service.dart';
import 'package:lidlomiks/screens/home_screen.dart';
import 'package:lidlomiks/screens/thermomix_screen.dart';
import 'package:lidlomiks/screens/tips_screen.dart';

class DrawerItem {
  final String title;
  final Widget widget;
  final Function onTap;

  DrawerItem({this.title, this.widget, this.onTap});
}

List<DrawerItem> _drawerItems = [
  DrawerItem(title: 'Znaczenia Themomiksu dla Lidlomiksa', widget: ThermomixScreen()),
  DrawerItem(title: 'Porady', widget: TipsScreen()),
  DrawerItem(title: 'Wyloguj się', widget: HomeScreen(), onTap: onLogout),
];

void onLogout() async {
  await FirebaseAuth.instance.signOut();
}

Widget get myDrawer {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Image.asset('assets/images/lidlomiks_white.png'),
          decoration: BoxDecoration(color: kPrimaryColor),
        ),
        for (var drawerItem in _drawerItems)
          ListTile(
            title: Text(drawerItem.title),
            onTap: () {
              drawerItem.onTap == null ? null : drawerItem.onTap();
              Navigator.push(
                NavigationService.navigatorKey.currentContext,
                MaterialPageRoute(builder: (context) => drawerItem.widget),
              );
            },
          ),
      ],
    ),
  );
}