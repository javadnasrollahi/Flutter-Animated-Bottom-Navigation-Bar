import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(
        child: Text("Help Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
    );
  }
}
