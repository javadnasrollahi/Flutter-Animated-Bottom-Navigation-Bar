import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text("Shop Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
    );
  }
}
