import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lidlomiks/screens/main/app_bar.dart';
import 'package:lidlomiks/screens/main/drawer.dart';

class DashboardScreen extends StatefulWidget {

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  User user;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'Przepisy'),
      drawer: myDrawer,
      body: SafeArea(
        child: Container(
          child: Text('Cześć ${user.email}'),
        ),
      ),
    );
  }
}
