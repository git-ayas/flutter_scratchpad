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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Double hit the image to bring the hero.",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    InkWell(
                      onDoubleTap: () =>
                          Navigator.of(context).pushNamed("/superhero"),
                      child: Hero(
                          tag: "superhero",
                          child: Image.asset(
                            "assets/images/super.jpg",
                            width: 100,
                            scale:20,
                          )),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
