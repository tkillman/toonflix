import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int defaultTime = 10;

class _HomePageState extends State<HomePage> {
  Timer? _timer;
  int time = defaultTime;
  bool isStart = false;
  int pomoCnt = 0;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        isStart = true;
        time--;
        if (time == 0) {
          pomoCnt++;
          time = defaultTime;
          isStart = false;
          _timer?.cancel();
        }
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
    setState(() {
      isStart = false;
    });
  }

  String formatTime(int time) {
    int min = time ~/ 60;
    int sec = time % 60;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red[400],
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    formatTime(time),
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: IconButton(
                    icon: isStart
                        ? const Icon(Icons.pause_circle_outline_rounded)
                        : const Icon(Icons.play_arrow),
                    iconSize: 150,
                    onPressed: isStart ? stopTimer : startTimer,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Pomodoro',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$pomoCnt',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
