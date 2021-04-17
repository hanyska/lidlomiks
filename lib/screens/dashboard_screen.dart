import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lidlomiks/constants.dart';
import 'package:lidlomiks/screens/main/app_bar.dart';
import 'package:lidlomiks/screens/main/drawer.dart';
import 'package:lidlomiks/screens/recipes/new_recipe_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  TabController _tabController;
  User user;
  List<Tab> _tabs = [
    Tab(text: 'Najnowsze'),
    Tab(text: 'Ulubione'),
    Tab(text: 'Moje'),
  ];

  @override
  void initState() {
    _tabController = new TabController(length: _tabs.length, vsync: this);
    getCurrentUser();

    super.initState();
  }

  void getCurrentUser() {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context: context,
        title: 'Przepisy',
        tabBar: TabBar(
          tabs: _tabs,
          controller: _tabController,
          onTap: (index) => setState(() => _tabController.index = index),
        )
      ),
      drawer: myDrawer,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          SafeArea(
            child: Container(
              child: Text('Cześć ${user.email}'),
            ),
          ),
          SafeArea(
            child: Container(
              child: Text('Cześć 2 ${user.email}'),
            ),
          ),
          SafeArea(
            child: Container(
              child: Text('Cześć 3 ${user.email}'),
            ),
          )
        ],
      ),
      floatingActionButton: _tabController.index == 2 ? FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.pushNamed(context, NewRecipeScreen.routeName);
        },

      ) : null,
    );
  }
}
