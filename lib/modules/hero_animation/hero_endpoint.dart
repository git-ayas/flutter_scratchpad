import 'package:flutter/material.dart';

class HeroEndpoint extends StatelessWidget {
  const HeroEndpoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Viewer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Hero has arrived",
              style: Theme.of(context).textTheme.headline5,
            ),
            Hero(
                tag: "superhero",
                child: Image.asset("assets/images/super.jpg"))
          ],
        ),
      ),
    );
  }
}
