import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scratchpad/modules/stopwatch/stopwatch.dart';

class StopwatchListWidget extends StatefulWidget {
  const StopwatchListWidget({Key? key}) : super(key: key);

  @override
  State<StopwatchListWidget> createState() => _StopwatchListWidgetState();
}

class _StopwatchListWidgetState extends State<StopwatchListWidget> {
  List<StopWatch> stopwatchCollection = [];
  Timer? stopwatchChecker;
  int activeStopwatchSessionTotalMillisecs = 0;
  bool isActiveStopWatchSession = false;

  addStopwatch(String title) {
    setState(() {
      stopwatchCollection.add(StopWatch(title: title));
    });
  }

  startStopwatchChecker() {
    if (stopwatchChecker == null ||
        stopwatchChecker?.isActive == null ||
        stopwatchChecker?.isActive == false) {
      stopwatchChecker =
          Timer.periodic(const Duration(milliseconds: 500), (timer) {
        Iterable activeStopwatches =
            stopwatchCollection.where((e) => e.isRunning == true);
        if (activeStopwatches.isEmpty) {
          isActiveStopWatchSession = false;
          stopwatchChecker?.cancel();
        } else {
          try {
            setState(() {
              activeStopwatchSessionTotalMillisecs += 500;
            });
          } catch (e) {
            if (kDebugMode) {
              print("Error Caught!:");
              print(e);
            }
          }
        }
      });
    }
  }

  startStopwatchAtIndex(int index) {
    setState(() {
      if (!isActiveStopWatchSession) {
        isActiveStopWatchSession = true;
        startStopwatchChecker();
      }
      stopwatchCollection[index].start();
    });
  }

  stopStopwatchAtIndex(int index) {
    setState(() {
      stopwatchCollection[index].stop();
    });
  }

  resetStopwatchAtIndex(int index) {
    setState(() {
      stopwatchCollection[index].reset();
    });
  }

  @override
  dispose() {
    stopwatchChecker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //prepare rows of stopwatch controls
    renderRow(i, e) {
      return MapEntry(
          i,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$i. ${e.title} : ${e.getDeltaDuration().toString()}'),
              IconButton(
                  onPressed: () => !e.isRunning
                      ? startStopwatchAtIndex(i)
                      : stopStopwatchAtIndex(i),
                  icon: e.isRunning
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow)),
              IconButton(
                  onPressed: () => resetStopwatchAtIndex(i),
                  icon: const Icon(Icons.replay_circle_filled_outlined)),
            ],
          ));
    }

    //Prepare list of controls to be rendered
    List<Widget> stopwatches = [];

    /**
     * Iterate through list of stopwatches with map function
     * and use the previously defined arrow function in the callback.
     * */
    stopwatches
        .addAll(stopwatchCollection.asMap().map(renderRow).values.toList());
    // add button to add stopwatch
    stopwatches.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Add Stopwatch:"),
        IconButton(
            onPressed: () =>
                addStopwatch('StopWatch ${WordPair.random().asPascalCase}'),
            icon: const Icon(Icons.add_alarm))
      ],
    ));
    stopwatches.add(Text(
        'actively captured ${Duration(milliseconds: activeStopwatchSessionTotalMillisecs)}'));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatches"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, children: stopwatches),
      ),
    );
  }
}
