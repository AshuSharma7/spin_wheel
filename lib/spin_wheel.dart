import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:spin_wheel/fortune_wheel/core/core.dart';
import 'package:spin_wheel/fortune_wheel/wheel/wheel.dart';

class SpinTheWheel extends StatefulWidget {
  const SpinTheWheel({Key? key}) : super(key: key);

  @override
  _SpinTheWheelState createState() => _SpinTheWheelState();
}

class _SpinTheWheelState extends State<SpinTheWheel> {
  StreamController<int> controller = StreamController<int>();

  List<String> win = [];
  List<String> prize = [
    "Rs. 100",
    "Better luck\nnext time",
    "Rs. 200",
    "Rs.300",
    "Rs. 400",
    "Rs. 500"
  ];
  List<Color?> colors = [
    Colors.yellow[700],
    Colors.green[300],
    Colors.blue.shade600,
    Colors.red.shade400,
    Colors.indigo[400],
    Colors.green
  ];

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg1.jpg"),
                    fit: BoxFit.fitHeight)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white12,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        FortuneWheel(
                            onAnimationEnd: () {
                              setState(() {});
                            },
                            // curve: Curves.bounceInOut,
                            selected: controller.stream,
                            items: prize
                                .map((e) => FortuneItem(
                                      style: const FortuneItemStyle(
                                          color: Colors.white30,
                                          borderColor: Colors.white24,
                                          borderWidth: 1),
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: win.last == e
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            color: win.last == e
                                                ? Colors.white
                                                : Colors.white70),
                                      ),
                                    ))
                                .toList()),
                        GestureDetector(
                          onTap: () {
                            int a = Random().nextInt(6);

                            win.add(prize[a]);

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
                                  color: Colors.white54,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 4.0),
                                child: Text(
                                  "Spin",
                                  style: TextStyle(
                                      fontSize: 20,
                                      // color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Win History",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      // height: MediaQuery.of(context).size.height / 2,
                      // width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white30),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: win.length,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "${index + 1}",
                                      style: const TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.white70),
                                    ),
                                    const Spacer(),
                                    Text(
                                      win[index],
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white70),
                                    ),
                                  ],
                                ));
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
