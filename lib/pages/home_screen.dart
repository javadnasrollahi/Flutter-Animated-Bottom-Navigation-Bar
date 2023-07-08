import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: Text("Home Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
    );
  }
}
