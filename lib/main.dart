import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

late StreamController controller;
void main() {
  controller = StreamController();
  controller.stream.listen((value) {
    print(value);
  });
  runApp(const MyApp());
}

Future<String> getApp() async {
  return "Hello";
}

// ! Stream

Stream<int> getNumber() async* {
  yield* getPrimaryNumber();
  for (var i = 0; i < 3; i++) {
    await Future.delayed(Duration(seconds: 1));

    yield i;
  }
}

Stream<int> getPrimaryNumber() async* {
  List<int> primaryNumber = [2, 3, 5, 7, 11, 13, 17];
  for (var i = 0; i < primaryNumber.length; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield primaryNumber[i];
  }
}

Stream<DateTime> getTime() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 1));

    yield DateTime.now();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: getTime(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final now = snapshot.data!;
              final second = now.second;
              final minute = now.minute + second / 60;
              final hour = now.hour % 12 + minute / 60;

              controller.sink.add(second);

              final secondAngle = (pi / 30) * second;
              final minuteAngle = (pi / 30) * minute;
              final hourAngle = (pi / 6) * hour;

              return CircleAvatar(
                maxRadius: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/images/clock.jpeg",
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    StreamBuilder(
                      stream: getNumber(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          controller.sink.add(snapshot.data);
                          return Divider();
                        } else {
                          return Divider();
                        }
                      },
                    ),
                    Transform.rotate(
                      angle: hourAngle,
                      child: Container(
                        width: 8,
                        height: 60,
                        color: Colors.blue,
                      ),
                    ),
                    Transform.rotate(
                      angle: minuteAngle,
                      child: Container(
                        width: 6,
                        height: 90,
                        color: Colors.black,
                      ),
                    ),
                    Transform.rotate(
                      angle: secondAngle,
                      child: Container(
                        width: 4,
                        height: 110,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
