import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hack_u_app/select_game.dart';

String timerUrl = "assets/timer/time64_";

List<String> imagePath = [
  "assets/etoQ/animals/rat.png",
  "assets/etoQ/animals/cow.png",
  "assets/etoQ/animals/tiger.png",
  "assets/etoQ/animals/rabbit.png",
  "assets/etoQ/animals/dragon.png",
  "assets/etoQ/animals/snake.png",
  "assets/etoQ/animals/horse.png",
  "assets/etoQ/animals/sheep.png",
  "assets/etoQ/animals/monkey.png",
  "assets/etoQ/animals/chicken.png",
  "assets/etoQ/animals/dog.png",
  "assets/etoQ/animals/boar.png",
];

class EtoQuestion extends StatefulWidget {
  const EtoQuestion({super.key});

  @override
  State<EtoQuestion> createState() => _EtoQuestionState();
}

class _EtoQuestionState extends State<EtoQuestion> {
  int timer = 0;
  int _timeCount = 0;
  String _timeIndex = "${timerUrl}0.png";
  int point = 0;
  int answerIndex = 12;
  int frontIndex = 0;
  int backIndex = 0;
  List<int> buttonIndex = [0, 0, 0, 0];
  bool answerPrepared = true;
  bool wait = false;
  Timer? _timer;
  late AudioPlayer _bgmPlayer;
  late AudioPlayer _sePlayer;

  @override
  void initState() {
    super.initState();
    prepare();
    _bgmPlayer = AudioPlayer();
    _sePlayer = AudioPlayer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readyDialog();
    });
  }

  @override
  void dispose() {
    _bgmPlayer.dispose();
    _sePlayer.dispose();
    super.dispose();
  }

  // 準備ダイアログ
  Future<void> _readyDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    '用意はいいか？',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '準備ができたら開始を押せ!!',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      point = 0;
                      Navigator.of(context).pop();
                      startGame();
                    },
                    child: const Text('！開始！'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // ゲーム開始
  void startGame() {
    _startSE();
    _playBGM();
    game();
  }

  // ゲーム中
  void game() {
    prepare();
    timer = 30;
    _timeCount = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (timer <= 0) {
          endGame();
        } else {
          timer--;
          if (timer <= 5) {
            _timeIndex = "${timerUrl}12_${timer.toString()}.png";
          } else if (timer % 3 == 0) {
            _timeCount++;
            _timeIndex = "$timerUrl${_timeCount.toString()}.png";
          } else {
            _timeIndex = "$timerUrl${_timeCount.toString()}.png";
          }
        }
      });
    });
  }

  // ゲーム終了
  void endGame() {
    _stopBGM();
    _timer?.cancel();
    _timer = null;
    _endDailog();
  }

  // 終了ダイアログ
  Future<void> _endDailog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    '結果',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "得点: ${point.toString()}点",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const SelectPage();
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                final Animatable<Offset> tween = Tween(
                                        begin: const Offset(-1.0, 0.0),
                                        end: Offset.zero)
                                    .chain(CurveTween(curve: Curves.easeInOut));
                                final Animation<Offset> offsetAnimation =
                                    animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text('やめる'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _readyDialog();
                        },
                        child: const Text('もう一度'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  // 出題準備
  void prepare() {
    setState(() {
      answerIndex = Random().nextInt(12); // 0 ~ 11までのランダムに正解
      frontIndex = answerIndex - 1;
      if (frontIndex == -1) frontIndex = 11;
      backIndex = answerIndex + 1;
      if (backIndex == 12) backIndex = 0;
      for (int i = 0; i < 4; i++) {
        if ((Random().nextBool() && answerPrepared) ||
            (answerPrepared && i == 3)) {
          buttonIndex[i] = answerIndex;
          answerPrepared = false;
        } else {
          int temp = Random().nextInt(12);
          while (temp == answerIndex || buttonIndex.contains(temp)) {
            temp = Random().nextInt(12);
          }
          buttonIndex[i] = temp;
        }
      }
      answerPrepared = true;
    });
  }

  // 正解チェック
  void answer(int number) {
    if (wait) return;
    if (buttonIndex[number] == answerIndex) {
      point++;
      _correctSE();
      prepare();
    } else {
      _uncorrectSE();
      wait = true;
      Future.delayed(const Duration(seconds: 2), () {
        wait = false;
        prepare();
      });
    }
  }

  // スタートSE
  Future<void> _startSE() async {
    await _sePlayer.play(AssetSource("se/start.mp3"));
  }

  // 正解SE
  Future<void> _correctSE() async {
    await _sePlayer.play(AssetSource("se/etoq/correct.mp3"));
  }

  // 不正解SE
  Future<void> _uncorrectSE() async {
    await _sePlayer.play(AssetSource("se/etoq/uncorrect.mp3"));
  }

  // BGM再生
  Future<void> _playBGM() async {
    await _bgmPlayer.play(AssetSource('bgm/Shougatsu_test_inGame.mp3'),
        volume: 0.5);
  }

  // BGM停止
  Future<void> _stopBGM() async {
    await _bgmPlayer.stop();
  }

  @override
  // UI
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/etoQ/etoQ_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenWidth * 0.28),
            // 出題
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 前の画像
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath[backIndex],
                    fit: BoxFit.cover,
                    width: screenWidth * 0.26,
                  ),
                ),
                SizedBox(width: screenWidth * 0.37),
                // 後の画像
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath[frontIndex],
                    fit: BoxFit.cover,
                    width: screenWidth * 0.26,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.2),
            // タイマー
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: screenWidth * 0.8),
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: Image.asset(_timeIndex),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Image.asset(
                        imagePath[buttonIndex[0]],
                        fit: BoxFit.cover,
                        width: screenWidth * 0.25,
                      ),
                      onPressed: () {
                        answer(0);
                      },
                    )),
                SizedBox(width: screenWidth * 0.1),
                Container(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Image.asset(
                        imagePath[buttonIndex[1]],
                        fit: BoxFit.cover,
                        width: screenWidth * 0.25,
                      ),
                      onPressed: () {
                        answer(1);
                      },
                    )),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      imagePath[buttonIndex[2]],
                      fit: BoxFit.cover,
                      width: screenWidth * 0.25,
                    ),
                    onPressed: () {
                      answer(2);
                    },
                  ),
                ),
                SizedBox(width: screenWidth * 0.1),
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      imagePath[buttonIndex[3]],
                      fit: BoxFit.cover,
                      width: screenWidth * 0.25,
                    ),
                    onPressed: () {
                      answer(3);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
