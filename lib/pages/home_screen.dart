import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          radius: double.infinity,
          backgroundColor: Colors.blue,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(21.0),
        color: Colors.red,
      ),
    ));
  }
}
