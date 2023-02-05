import 'package:ashbot/home.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(const AshBot());
}

class AshBot extends StatelessWidget {
  const AshBot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true
      ),
      home: const HomePage(),
    );
  }
}