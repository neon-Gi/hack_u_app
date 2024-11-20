import 'dart:async';
import 'package:flutter/material.dart';

// プレイヤークラス
class Player {
  String name = "";
  bool current = false; // 操作プレイヤー?
  Player(this.name);
}

// ゲームクラス
class Game {
  Player player1 = Player("Player1");
  int timerSec = 60;
  int point = 0;
  bool start = false;
  bool mistake = false;
}

String timerUrl = "assets/timer/time64_";

// ゲーム画面
class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Game game = Game();
  Timer? _timer;
  Timer? _motiTimer;
  int _press = 0;
  int _count = 0;
  int _currentIndex = 0;
  int _mode = 0;
  bool _isPlaying = false;
  List<String> imagePath1 = [
    "assets/moti/all128_1.png",
    "assets/moti/all128_2.png",
    "assets/moti/all128_3.png",
    "assets/moti/all128_4.png",
    "assets/moti/all128_5.png",
    "assets/moti/all128_1.png",
  ];
  List<String> imagePath2 = [
    "assets/moti/all128_1.png",
    "assets/moti/all128_7.png",
    "assets/moti/all128_8.png",
    "assets/moti/all128_9.png",
    "assets/moti/all128_10.png",
    "assets/moti/all128_11.png",
    "assets/moti/all128_12.png",
    "assets/moti/all128_13.png",
    "assets/moti/all128_1.png"
  ];

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
                    '準備OK?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '準備できたらOKを押してください。',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      gameStart();
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

  // 終了ダイアログ
  Future<void> _endDialog() async {
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
                    "得点:" + game.point.toString() + "点",
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
                          Navigator.of(context).pop();
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

  @override
  // viewDidload
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readyDialog();
    });
  }

  // ゲーム開始
  void gameStart() {
    game.start = true;
    _press = 0;
    _count = 0;
    _currentIndex = 0;
    _mode = 0;
    _isPlaying = false;
    game.timerSec = 60;
    restartTimer();
  }

  // ゲーム終了
  void gameEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _endDialog();
    });
    game.start = false;
    _timer?.cancel();
    _motiTimer?.cancel();
  }

  //　杵撃ち再生
  void move_view1() {
    if (_isPlaying) {
      game.mistake = true;
      return;
    }
    setState(() {
      _isPlaying = true;
      _mode = 1;
    });
    stopTimer();
    _motiTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _currentIndex++;
        if (_currentIndex >= imagePath1.length) {
          _currentIndex = 0;
          _mode = 0;
          _isPlaying = false;
          move_stop();
          restartTimer();
        }
      });
    });
  }

  // 混ぜ再生
  void move_view2() {
    if (_isPlaying) {
      game.mistake = true;
      return;
    }
    stopTimer();
    setState(() {
      _isPlaying = true;
      _mode = 2;
    });
    _motiTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _currentIndex++;
        if (_currentIndex >= imagePath2.length) {
          _currentIndex = 0;
          _isPlaying = false;
          _mode = 0;
          game.point++;
          move_stop();
          restartTimer();
        }
      });
    });
  }

  // 杵撃ち・混ぜ再生停止
  void move_stop() {
    _motiTimer?.cancel();
    _motiTimer = null;
    setState(() {
      _isPlaying = false;
      _currentIndex = 0;
    });
    if (game.mistake) {
      _motiTimer = Timer(const Duration(seconds: 2), () {
        setState(() {
          game.mistake = false;
        });
      });
    }
  }

  // ボタン押下時
  void onPress() {
    setState(() {
      _press++;
    });
    if (_press % 2 == 0) {
      move_view2();
    } else {
      move_view1();
    }
  }

  // もちの表示
  Image? moti() {
    if (_mode == 1) {
      return Image.asset(imagePath1[_currentIndex],
          width: 500, height: 500, fit: BoxFit.cover);
    } else if (_mode == 2) {
      return Image.asset(imagePath2[_currentIndex],
          width: 500, height: 500, fit: BoxFit.cover);
    } else {
      return Image.asset(imagePath1[0],
          width: 500, height: 500, fit: BoxFit.cover);
    }
  }

  // タイマーと終了監視
  void restartTimer() {
    game.timerSec--;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (game.start) {
          game.timerSec--;
          if (game.timerSec <= 0) {
            gameEnd();
          }
        }
      });
    });
  }

  // タイマー一時停止
  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  // タイマー表示
  Image? timer() {
    if (!_isPlaying || game.timerSec <= 0) {
      if (game.timerSec <= 0) {
        return Image.asset(timerUrl.toString() + "12_0.png");
      } else if (game.timerSec <= 5) {
        return Image.asset(
            timerUrl.toString() + "12_" + game.timerSec.toString() + ".png");
      } else if (game.timerSec % 5 == 0) {
        _count++;
      }
    }
    return Image.asset(timerUrl.toString() + _count.toString() + ".png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/moti/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 300),
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: timer(),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  child: moti(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 200),
                    Container(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.center,
                      child: (!game.start || game.mistake)
                          // アイドル状態
                          ? IconButton(
                              onPressed: null,
                              icon: Image.asset(
                                "assets/moti/ose07_idle.png",
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            )
                          // 押せる状態
                          : IconButton(
                              onPressed: onPress,
                              icon: Image.asset(
                                "assets/moti/ose07.png",
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ],
                )
              ],
            ),
            Text("残り時間:" +
                game.timerSec.toString() +
                "," +
                "ボタン押下数:" +
                _press.toString() +
                "," +
                "得点数:" +
                game.point.toString()),
          ],
        ),
      ),
    );
  }
}
