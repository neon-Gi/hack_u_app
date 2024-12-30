import 'dart:ffi';

import 'package:flutter/material.dart';

// ゲームの状況
class Game {
  int riddleCount = 0;
  int thinkingTime = 0;
  bool isPlaying = false;
}

// シーン
class Scene {
  String name = "シーン名";
}

// 解いてる謎
class Riddle {
  String questionURL = "";
  int answerNumber = 0;
}

class EscapeGamePage extends StatefulWidget {
  const EscapeGamePage({super.key});
  @override
  State<EscapeGamePage> createState() => _EscapeGamePageState();
}

class _EscapeGamePageState extends State<EscapeGamePage> {
  Game game = Game();
  Scene scene = Scene();
  Riddle riddle1 = Riddle();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          // 問題画面
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/escape/escape_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                // 出題画面
                Container(
                  width: screenWidth * 0.97,
                  alignment: Alignment.center,
                  child: Image.asset("assets/escape/practice.png"),
                ),
                // 拡大ボタン
                Row(
                  children: [
                    SizedBox(width: screenWidth * 0.75),
                    Container(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: null,
                        icon: Image.asset(
                          "assets/escape/expansion.png",
                          width: screenWidth * 0.15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.11),
                // 選択肢1,2
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 選択肢1
                    Stack(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Image.asset(
                            "assets/escape/one.png",
                            width: screenWidth * 0.35,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenWidth * 0.1),
                            Container(
                              width: screenWidth * 0.38,
                              height: screenWidth * 0.16,
                              alignment: Alignment.center,
                              child: Text(
                                "1",
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: screenWidth * 0.07),
                    // 選択肢2
                    Stack(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Image.asset(
                            "assets/escape/two.png",
                            width: screenWidth * 0.35,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenWidth * 0.1),
                            Container(
                              width: screenWidth * 0.38,
                              height: screenWidth * 0.16,
                              alignment: Alignment.center,
                              child: Text(
                                "2",
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.025),
                // 選択肢3,4
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 選択肢3
                    Stack(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Image.asset(
                            "assets/escape/three.png",
                            width: screenWidth * 0.35,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenWidth * 0.1),
                            Container(
                              width: screenWidth * 0.38,
                              height: screenWidth * 0.16,
                              alignment: Alignment.center,
                              child: Text(
                                "3",
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: screenWidth * 0.07),
                    // 選択肢2
                    Stack(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Image.asset(
                            "assets/escape/four.png",
                            width: screenWidth * 0.35,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenWidth * 0.1),
                            Container(
                              width: screenWidth * 0.38,
                              height: screenWidth * 0.16,
                              alignment: Alignment.center,
                              child: Text(
                                "4",
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
