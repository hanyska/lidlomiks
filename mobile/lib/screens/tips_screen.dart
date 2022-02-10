import 'package:flutter/material.dart';
import 'package:lidlomiks/screens/main/app_bar.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        title: 'Porady'
      ),
      body: Text('Porady'),
    );
  }
}
