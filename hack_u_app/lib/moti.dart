import 'dart:async';
import 'player.dart';
import 'package:flutter/material.dart';
import 'package:hack_u_app/select_game.dart';

// シングル用ゲームクラス
class MotiGame {
  int timerSec = 60;
  int point = 0;
  bool start = false;
  bool mistake = false;
}

// マルチ用ゲームクラス
class MultiMotiGame {
  int timerSec = 60;
  int point = 0;
  int next = 0;
  bool start = false;
  bool mistake = false;
}

String timerUrl = "assets/timer/time64_";
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

// シングルゲーム画面
class MotiGamePage extends StatefulWidget {
  MotiGamePage({Key? key}) : super(key: key);
  @override
  _MotiGamePageState createState() => _MotiGamePageState();
}

class _MotiGamePageState extends State<MotiGamePage> {
  MotiGame game = MotiGame();
  Timer? _timer;
  Timer? _motiTimer;
  int _press = 0;
  int _count = 0;
  int _currentIndex = 0;
  int _mode = 0;
  bool _isPlaying = false;

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
                    '準備できたら開始を押してください。',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      gameStart();
                      Navigator.of(context).pop();
                    },
                    child: const Text('！開始！'),
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
                    "得点: ${game.point.toString()}点",
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectPage(),
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
      final response = await PlayerManager().submitSocre(1, game.point);
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

  @override
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
  void moveView1() {
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
          moveStop();
          restartTimer();
        }
      });
    });
  }

  // 混ぜ再生
  void moveView2() {
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
          moveStop();
          restartTimer();
        }
      });
    });
  }

  // 杵撃ち・混ぜ再生停止
  void moveStop() {
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
      moveView2();
    } else {
      moveView1();
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
    return SafeArea(
      child: Scaffold(
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
              const SizedBox(height: 190),
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
                      const SizedBox(height: 170),
                      Container(
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.center,
                        child:
                            (!game.start || game.mistake || game.timerSec <= 0)
                                // アイドル状態
                                ? IconButton(
                                    onPressed: null,
                                    icon: Image.asset(
                                      "assets/moti/mate7.png",
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
            ],
          ),
        ),
      ),
    );
  }
}

// マルチゲーム画面
class MultiMotiGamePage extends StatefulWidget {
  MultiMotiGamePage({super.key});

  @override
  State<MultiMotiGamePage> createState() => _MultiMotiGamePageState();
}

class _MultiMotiGamePageState extends State<MultiMotiGamePage> {
  MultiMotiGame game = MultiMotiGame();
  Timer? _timer;
  Timer? _motiTimer;
  int _currentIndex = 0;
  bool _isPlaying = false;
  int _count = 0;

  // 準備ダイアログ
  Future<void> _readyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("用意はいいか？"),
                const SizedBox(height: 10),
                const Text(
                  "杵を打つ人、餅をこねる人で分かれてプレイしてください。\n準備できたら開始を押してください。",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    gameStart();
                    Navigator.of(context).pop();
                  },
                  child: const Text("！開始！"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _endDialog() async {
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
                    "得点: ${game.point.toString()}点",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readyDialog();
    });
  }

  void gameStart() {
    game.start = true;
    _isPlaying = false;
    _count = 0;
    _currentIndex = 0;
    game.point = 0;
    game.timerSec = 60;
    restartTimer();
  }

  void gameEnd() {
    stopTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _endDialog();
    });
  }

  void restartTimer() {
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

  void moveView1() {
    if (_isPlaying) {
      game.mistake = true;
      return;
    }
    setState(() {
      _isPlaying = true;
      game.next = 2;
      game.point++;
    });
    stopTimer();
    _motiTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _currentIndex++;
        if (_currentIndex >= imagePath2.length) {
          game.timerSec--;
          _currentIndex = 0;
          _isPlaying = false;
          game.next = 1;
          moveStop();
          restartTimer();
        }
      });
    });
  }

  void moveView2() {
    if (_isPlaying) {
      game.mistake = true;
      return;
    }
    stopTimer();
    setState(() {
      _isPlaying = true;
      game.next = 1;
    });
    _motiTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _currentIndex++;
        if (_currentIndex >= imagePath1.length) {
          _currentIndex = 0;
          game.timerSec--;
          _isPlaying = false;
          game.next = 2;
          moveStop();
          restartTimer();
        }
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void moveStop() {
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

  Image? moti() {
    if (game.next == 1) {
      return Image.asset(imagePath1[_currentIndex],
          width: 500, height: 500, fit: BoxFit.cover);
    } else if (game.next == 2) {
      return Image.asset(imagePath2[_currentIndex],
          width: 500, height: 500, fit: BoxFit.cover);
    } else {
      return Image.asset(imagePath1[0],
          width: 500, height: 500, fit: BoxFit.cover);
    }
  }

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

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              const SizedBox(height: 190),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 300),
                  Container(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: timer(),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: moti(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (!game.start ||
                                  game.mistake ||
                                  game.timerSec <= 0 ||
                                  game.next == 2)
                              ? IconButton(
                                  onPressed: null,
                                  icon: Image.asset(
                                    "assets/moti/mate7.png",
                                    fit: BoxFit.cover,
                                    width: 160,
                                  ),
                                )
                              : IconButton(
                                  onPressed: moveView2,
                                  icon: Image.asset(
                                    "assets/moti/ose07.png",
                                    fit: BoxFit.cover,
                                    width: 160,
                                  ),
                                ),
                          const SizedBox(width: 20),
                          (!game.start ||
                                  game.mistake ||
                                  game.timerSec <= 0 ||
                                  game.next == 1)
                              ? IconButton(
                                  onPressed: null,
                                  icon: Image.asset(
                                    "assets/moti/mate7.png",
                                    fit: BoxFit.cover,
                                    width: 160,
                                  ),
                                )
                              : IconButton(
                                  onPressed: moveView1,
                                  icon: Image.asset(
                                    "assets/moti/ose07.png",
                                    fit: BoxFit.cover,
                                    width: 160,
                                  ),
                                ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
