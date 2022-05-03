import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scratchpad Menu"),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 100.6),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Select your scribble",
              style: Theme.of(context).textTheme.headline6,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/stopwatch"),
              child: const Text("Stopwatches"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/counter"),
              child: const Text("Counter"),
            ),
          ],
        )),
      ),
    );
  }
}
