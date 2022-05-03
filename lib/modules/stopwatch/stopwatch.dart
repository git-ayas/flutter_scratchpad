class StopWatch {
  String title;
  int _stopwatchCreatedTimestamp = -1;
  int _lastStopTimestamp = -1;
  bool isRunning = false;

  StopWatch({required this.title});

  getDeltaDuration() {
    final nowUtcTime = DateTime.now().millisecondsSinceEpoch;
    return _stopwatchCreatedTimestamp == -1
        ? const Duration(milliseconds: 0)
        : isRunning
            ? Duration(milliseconds: nowUtcTime - _stopwatchCreatedTimestamp)
            : Duration(
                milliseconds: _lastStopTimestamp - _stopwatchCreatedTimestamp);
  }

  start() {
    if (_stopwatchCreatedTimestamp == -1) {
      _stopwatchCreatedTimestamp = DateTime.now().millisecondsSinceEpoch;
    }
    isRunning = true;
  }

  stop() {
    isRunning = false;
    _lastStopTimestamp = DateTime.now().millisecondsSinceEpoch;
  }

  reset() {
    _stopwatchCreatedTimestamp = -1;
    stop();
  }
}
