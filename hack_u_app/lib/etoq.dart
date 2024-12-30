import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hack_u_app/player.dart';
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
  bool isMistake = false;
  int answer_index = 7; // 答えの写真インデックス
  int front_index = 6; // 答えの前の写真インデックス
  int back_index = 8; // 答えの後の写真インデックス
  int random_answer = 3; // 答えが格納される場所を決定
  List<int> answer_button = [8, 10, 5, 7]; // 正解判定用のボタンリスト
  int score = 0;
  Timer? _timer; // タイムカウント
  int timerSec = 30;
  late AudioPlayer _bgmPlayer; // BGM用のAudioPlayer
  late AudioPlayer _sePlayer;

  @override
  void initState() {
    super.initState();
    _bgmPlayer = AudioPlayer();
    _sePlayer = AudioPlayer();
    _bgmPlayer.setReleaseMode(ReleaseMode.loop);
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
    if (isMistake) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          isMistake = false;
        });
      });
    }
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
  }

  void answer_check(int index) {
    if (!isPlaying) return;
    if (index == random_answer) {
      setState(() {
        score++;
      });
      _stopSE();
      _correctSE();
      print("正解");
    } else {
      _stopSE();
      _uncorrectSE();
      print("不正解");
    }
    prepare_question();
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
                      score = 0;
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
                    "得点: ${score.toString()}点",
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        submitScore();
                      },
                      child: const Text("ランキング登録"),
                    ),
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

  Future<void> submitScore() async {
    try {
      final response = await PlayerManager().submitSocre(2, score);
      if (response) {
        _successDialog();
      } else {
        _errorDialog();
      }
    } catch (e) {
      _errorDialog();
    }
  }

  Future<void> _successDialog() async {
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
                    '登録成功',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _errorDialog() async {
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
                    '通信エラー',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '通信または処理に失敗しました。',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          );
        });
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

  // スタート
  Future<void> _startSE() async {
    await _sePlayer.play(AssetSource("se/start.mp3"));
  }

  // 正解
  Future<void> _correctSE() async {
    await _sePlayer.play(AssetSource("se/etoq/correct.mp3"));
  }

  // 不正解
  Future<void> _uncorrectSE() async {
    await _sePlayer.play(AssetSource("se/etoq/uncorrect.mp3"));
  }

  // SEストップ
  Future<void> _stopSE() async {
    await _sePlayer.stop();
  }

  void startGame() {
    _startSE();
    _playBGM();
    prepare_question();
    print("ゲーム開始");
    isPlaying = true;
    _startTimer();
  }

  void endGame() {
    _stopBGM();
    _timer?.cancel();
    _timer = null;
    isPlaying = false;
    _endDailog();
  }

  void _startTimer() {
    timerSec = 30;
    _timeCount = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSec <= 0) {
          endGame();
        } else {
          timerSec--;
          if (timerSec <= 5) {
            _timeIndex = timerUrl + "12_" + timerSec.toString() + ".png";
          } else if (timerSec % 3 == 0) {
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
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath[back_index],
                    fit: BoxFit.cover,
                    width: screenWidth * 0.26,
                  ),
                ),
                SizedBox(width: screenWidth * 0.37),
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    imagePath[front_index],
                    fit: BoxFit.cover,
                    width: screenWidth * 0.26,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.2),
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
                        width: screenWidth * 0.25,
                      ),
                      onPressed: () {
                        answer_check(0);
                      },
                    )),
                SizedBox(width: screenWidth * 0.1),
                Container(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Image.asset(
                        imagePath[answer_button[1]],
                        fit: BoxFit.cover,
                        width: screenWidth * 0.25,
                      ),
                      onPressed: () {
                        answer_check(1);
                      },
                    )),
              ],
            ),
            SizedBox(height: screenHeight * 0.06),
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
                      width: screenWidth * 0.25,
                    ),
                    onPressed: () {
                      answer_check(2);
                    },
                  ),
                ),
                SizedBox(width: screenWidth * 0.1),
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      imagePath[answer_button[3]],
                      fit: BoxFit.cover,
                      width: screenWidth * 0.25,
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
