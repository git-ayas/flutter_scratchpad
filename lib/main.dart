import 'package:flutter/material.dart';
import 'package:scratchpad/modules/counter/counter.dart';
import 'package:scratchpad/modules/mainscreen/mainscreen.dart';
import 'package:scratchpad/modules/stopwatch/stopwatch_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Scratchpad',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MainScreen(),
        '/stopwatch': (context) => const StopwatchListWidget(),
        '/counter': (context) => const CounterWidget(title: "Counter"),
      },
    );
  }
}
