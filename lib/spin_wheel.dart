import 'dart:async';
import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:spin_wheel/fortune_wheel/core/core.dart';
import 'package:spin_wheel/fortune_wheel/wheel/wheel.dart';

class SpinTheWheel extends StatefulWidget {
  const SpinTheWheel({Key? key}) : super(key: key);

  @override
  _SpinTheWheelState createState() => _SpinTheWheelState();
}

class _SpinTheWheelState extends State<SpinTheWheel> {
  StreamController<int> controller = StreamController<int>();

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 400,
            padding: const EdgeInsets.only(top: 50.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                FortuneWheel(

                    // curve: Curves.bounceInOut,
                    selected: controller.stream,
                    items: [
                      FortuneItem(
                        style: FortuneItemStyle(
                            color: Colors.yellow[700]!, borderWidth: 0),
                        child: const Text(
                          "RS. 100",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      FortuneItem(
                          style: FortuneItemStyle(
                              color: Colors.green[300]!, borderWidth: 0),
                          child: const Text(
                            "Better Luck\nnext time",
                            style: TextStyle(fontSize: 20.0),
                          )),
                      FortuneItem(
                        child: const Text(
                          "Rs. 200",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        style: FortuneItemStyle(
                            color: Colors.blue.shade600, borderWidth: 0),
                      ),
                      FortuneItem(
                        child: const Text(
                          "Rs. 300",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        style: FortuneItemStyle(
                            color: Colors.red.shade400, borderWidth: 0),
                      ),
                      FortuneItem(
                        child: const Text(
                          "Rs. 400",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        style: FortuneItemStyle(
                            color: Colors.indigo[400]!, borderWidth: 0),
                      ),
                      const FortuneItem(
                        child: Text(
                          "Rs. 500",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        style: FortuneItemStyle(
                            color: Colors.green, borderWidth: 0),
                      ),
                    ]),
                GestureDetector(
                  onTap: () {
                    int a = Random().nextInt(6);
                    controller.add(a);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: pi * 0.5,
                        child: const Icon(
                          EvaIcons.droplet,
                          size: 100.0,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: Text(
                          "Spin",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
