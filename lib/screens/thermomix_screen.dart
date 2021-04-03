import 'package:flutter/material.dart';
import 'package:lidlomiks/screens/main/app_bar.dart';

class ThermomixScreen extends StatefulWidget {
  @override
  _ThermomixScreenState createState() => _ThermomixScreenState();
}

class _ThermomixScreenState extends State<ThermomixScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
          title: 'Przelicznik z Thermomiksa'
      ),
      body: Text('Przelicznik z Thermomiksa'),
    );
  }
}
