import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget{
  const CountryPage({super.key});

  @override
  State<StatefulWidget> createState() => _CountryState();
}

class _CountryState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0B2545), Color(0xFF13315c), Color(0xFF134074),])
        ),
        child: Column(
          children: [
            Text("Best Universities in Australia"),
          ],
        ),
      ),
    );
  }
  
}