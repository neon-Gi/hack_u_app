import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import "select_game.dart";

String timerUrl = "assets/timer/time64_";

class etoqpage extends StatefulWidget {
  const etoqpage({super.key});
  @override
  State<etoqpage> createState() => _etoqPageState();
}

class _etoqPageState extends State<etoqpage> {
  int count = 0;
  int _timeCount = 0;
  String _timeIndex = "assets/timer/time64_0.png";
  bool isPlaying = false;
  int answer_index = 7; // 答えの写真インデックス
  int front_index = 6; // 答えの前の写真インデックス
  int back_index = 8; // 答えの後の写真インデックス
  int random_answer = 3; // 答えが格納される場所を決定
  List<int> answer_button = [8, 10, 5, 7]; // 正解判定用のボタンリスト
  int score = 0;
  Timer? _timer; // タイムカウント
  int timerSec = 60;

  @override
  void initState() {
    super.initState();
    prepare_question();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readyDialog();
    });
  }

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

  void prepare_question() {
    count = 0;
    random_answer = Random().nextInt(4); // 0~3の中で正解の絵柄が入るボタンの決定
    answer_index = Random().nextInt(12); //0~11の間
    front_index = answer_index - 1;
    if (front_index == -1) {
      front_index = 11;
    }
    back_index = answer_index + 1;
    if (back_index == 12) {
      back_index = 0;
    }
    for (var _ in answer_button) {
      if (random_answer == count) {
        answer_button[count] = answer_index;
      } else {
        answer_button[count] = Random().nextInt(12);
        while (answer_button[count] == answer_index) {
          answer_button[count] = Random().nextInt(12);
        }
      }
      count++;
    }
    print("正解:${random_answer}");
  }

  void answer_check(int index) {
    if (!isPlaying) return;
    if (index == random_answer) {
      setState(() {
        score++;
      });
      print("正解");
    } else {
      print("不正解");
    }
    prepare_question();
  }

  // 準備ダイアログ
  Future<void> _readyDialog() async {
    return showDialog<void>(
        context: context,
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
                    '準備できたら開始を押してください。',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
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

  Future<void> _endDailog() async {
    return showDialog<void>(
        context: context,
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
                    "得点: ${score.toString()}点",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  // スコアボードリスト
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
                                return SelectPage();
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

  void startGame() {
    print("ゲーム開始");
    isPlaying = true;
    _startTimer();
  }

  void endGame() {
    _timer?.cancel();
    _timer = null;
    isPlaying = false;
    _endDailog();
  }

  void _startTimer() {
    timerSec = 60;
    _timeCount = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSec <= 0) {
          endGame();
        } else {
          timerSec--;
          if (timerSec <= 5) {
            _timeIndex = timerUrl + "12_" + timerSec.toString() + ".png";
          } else if (timerSec % 5 == 0) {
            _timeCount++;
            _timeIndex = timerUrl + _timeCount.toString() + ".png";
          } else {
            _timeIndex = timerUrl + _timeCount.toString() + ".png";
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 110),
            // 出題
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath[front_index],
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                ),
                const SizedBox(width: 140),
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath[back_index],
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 300),
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: Image.asset(_timeIndex),
                ),
              ],
            ),
            const SizedBox(height: 80),
            // ボタン
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
                        imagePath[answer_button[0]],
                        fit: BoxFit.cover,
                        width: 100,
                      ),
                      onPressed: () {
                        answer_check(0);
                      },
                    )),
                const SizedBox(width: 30),
                Container(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Image.asset(
                        imagePath[answer_button[1]],
                        fit: BoxFit.cover,
                        width: 100,
                      ),
                      onPressed: () {
                        answer_check(1);
                      },
                    )),
              ],
            ),
            const SizedBox(height: 45),
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
                      imagePath[answer_button[2]],
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                    onPressed: () {
                      answer_check(2);
                    },
                  ),
                ),
                const SizedBox(width: 40),
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      imagePath[answer_button[3]],
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                    onPressed: () {
                      answer_check(3);
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
