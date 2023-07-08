import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Center(
        child: Text("Order Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
    );
  }
}
