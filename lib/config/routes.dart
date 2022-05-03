import 'package:scratchpad/modules/counter/counter.dart';
import 'package:scratchpad/modules/mainscreen/mainscreen.dart';
import 'package:scratchpad/modules/stopwatch/stopwatch_list.dart';

final routes = {
  '/': (context) => const MainScreen(),
  '/stopwatch': (context) => const StopwatchListWidget(),
  '/counter': (context) => const CounterWidget(title: "Counter"),
};