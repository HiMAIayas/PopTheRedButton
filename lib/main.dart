import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pop',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Pop the Red Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double x_axis =200;
  double y_axis =150;
  double size=100;
  double max_size=200;

  void Counter() {
    setState(() {
      _counter++;
      if(size<max_size){
        size++;
      } else {
        size=101;
      }
    });
  }
  void apply_axis(){
    x_axis=Random().nextDouble() * (345-_counter) +55;
    y_axis=Random().nextDouble() * (300-_counter);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: (size==max_size)?Colors.black:Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              width: 500,
              height: 600,
              color: (size==max_size)?Colors.black:Colors.white,
            ),
            Positioned(
              top: 25,
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Positioned(
                top: (size==max_size-1)?0:(size==max_size)?0:x_axis,
                left: (size==max_size-1)?-100:(size==max_size)?-150:y_axis,
                child: TextButton(
                  onPressed: (){
                    Counter();
                    apply_axis();
                  },
                  child: Image(
                    image: AssetImage((size==max_size)?'images/ghost.jpg':
                      'images/red.jpg',
                    ),
                    height: (size==max_size-1)?600:(size==max_size)?500:size,
                    width: (size==max_size-1)?600:(size==max_size)?700:size,
                  ),
                )),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter = 0;
            x_axis=200;
            y_axis=150;
            size=100;
          });
        },
        child: const Text('Reset'),
        backgroundColor: (size==max_size)?Colors.black:Colors.red,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}