import 'package:flutter/material.dart';

const owl_url =
    'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: FadeInDemo(),
          ),
        ),
      ),
    );
  }
}

class FadeInDemo extends StatefulWidget {
  @override
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(owl_url),
        MaterialButton(
          child: Text(
            'Show Details',
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () {
            setState(() {
              opacity = 1;
            });
          },
        ),
        AnimatedOpacity(
          duration: Duration(seconds: 3),
          opacity: opacity,
          child: Column(
            children: <Widget>[
              Text('Type: Owl'),
              Text('Age: 39'),
              Text('Employment: None'),
            ],
          ),
        ),
      ],
    );
  }
}
