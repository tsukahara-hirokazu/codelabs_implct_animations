import 'dart:math';

import 'package:flutter/material.dart';

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

const _duration = Duration(milliseconds: 400);

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerDemo(),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  Color color;
  double borderRadius;
  double margin;

  @override
  void initState() {
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  duration: _duration,
                  curve: Curves.easeInOutBack,
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(borderRadius)),
                ),
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Change',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => change(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
