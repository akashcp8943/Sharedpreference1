import 'package:flutter/material.dart';

class Spnew extends StatefulWidget {
  const Spnew({super.key});

  @override
  State<Spnew> createState() => _SpnewState();
}

class _SpnewState extends State<Spnew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Container(
        child: Center(child: ElevatedButton(onPressed: (){},child: Text("show"))),
      ),
    );
  }
}
