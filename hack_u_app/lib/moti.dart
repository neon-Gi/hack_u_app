import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hack_u_app/player.dart';
import 'package:hack_u_app/select_game.dart';
import 'package:audioplayers/audioplayers.dart';

// シングル用ゲームクラス
class MotiGame {
  int timerSec = 30;
  int point = 0;
  bool start = false;
  bool mistake = false;
}

// マルチ用ゲームクラス
class MultiMotiGame {
  int timerSec = 30;
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

class _MotiGamePageState extends State<MotiGamePage>
    with TickerProviderStateMixin {
  MotiGame game = MotiGame();
  int _currentIndex = 0;
  int _mode = 0;
  int _press = 0;
  int _count = 0;
  Timer? motiTimer; // 餅ペナ用
  bool _isPlaying = false;
  late AudioPlayer _bgmPlayer; // BGM用のAudioPlayer
  late AudioPlayer _sePlayer;

  @override
  void initState() {
    _bgmPlayer = AudioPlayer();
    _sePlayer = AudioPlayer();
    _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readyDialog();
    });
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
                    '準備できたら開始を押してください。',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      reset();
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

  // 登録完了
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

  // エラー処理
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
    await _bgmPlayer.play(AssetSource('/bgm/Shougatsu_test_inGame.mp3'),
        volume: 0.5);
  }

  // BGM停止
  Future<void> _stopBGM() async {
    await _bgmPlayer.stop();
  }

  // 杵撃ち
  Future<void> _dagekiSE() async {
    await _sePlayer.play(AssetSource("/se/moti/moti_dageki.mp3"));
  }

  // スタート
  Future<void> _startSE() async {
    await _sePlayer.play(AssetSource("se/start.mp3"));
  }

  // こねるSE
  Future<void> _koneruSE() async {
    await _sePlayer.play(AssetSource("/se/moti/moti_koneru.mp3"));
  }

  // ミスSE
  Future<void> _missSE() async {
    await _sePlayer.play(AssetSource("/se/moti/moti_miss.mp3"));
  }

  // リセット処理
  void reset() {
    _count = 0;
    game.start = false;
    game.mistake = false;
    game.point = 0;
    _currentIndex = 0;
    _mode = 0;
    motiTimer = null;
  }

  // ゲーム開始処理
  void gameStart() {
    _startSE();
    _playBGM();
    game.start = true;
    _currentIndex = 0;
    _mode = 0;
    _press = 0;
    _isPlaying = false;
    game.timerSec = 30;
    startTimer();
  }

  // タイマー開始
  void startTimer() {
    Stream.periodic(const Duration(seconds: 1), (int count) => count)
        .take(game.timerSec)
        .listen((int count) {
      setState(() {
        game.timerSec--;
        if (game.timerSec <= 0) {
          _stopBGM();
          _endDialog();
        }
      });
    });
  }

  // もちの表示
  Image? moti() {
    if (_mode == 1) {
      return Image.asset(imagePath1[_currentIndex],
          width: 500, height: 600, fit: BoxFit.cover);
    } else if (_mode == 2) {
      return Image.asset(imagePath2[_currentIndex],
          width: 500, height: 600, fit: BoxFit.cover);
    } else {
      return Image.asset(imagePath1[0],
          width: 500, height: 600, fit: BoxFit.cover);
    }
  }

  void moveView1() {
    if (_isPlaying) {
      _missSE();
      game.mistake = true;
      return;
    }
    _dagekiSE();
    setState(() {
      _isPlaying = true;
      _mode = 1;
    });
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6 * 75), // 全体のアニメーション時間
    );
    controller.addListener(() {
      setState(() {
        _currentIndex = (controller.value * imagePath1.length).floor();
        if (_currentIndex >= imagePath1.length) {
          controller.stop();
          _currentIndex = 0;
          _mode = 0;
          _isPlaying = false;
          moveStop();
        }
      });
    });
    controller.forward();
  }

  void moveView2() {
    if (_isPlaying) {
      _missSE();
      game.mistake = true;
      return;
    }
    _koneruSE();
    setState(() {
      _isPlaying = true;
      _mode = 2;
    });
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 9 * 75), // 全体のアニメーション時間
    );
    controller.addListener(() {
      setState(() {
        _currentIndex = (controller.value * imagePath2.length).floor();
        if (_currentIndex >= imagePath2.length) {
          _currentIndex = 0;
          _isPlaying = false;
          _mode = 0;
          game.point++;
          moveStop();
        }
      });
    });
    controller.forward();
  }

  void moveStop() {
    motiTimer?.cancel();
    motiTimer = null;
    setState(() {
      _isPlaying = false;
      _currentIndex = 0;
    });
    if (game.mistake) {
      motiTimer = Timer(const Duration(milliseconds: 100), () {
        setState(() {
          game.mistake = false;
        });
      });
    }
  }

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

  Image? timer() {
    setState(() {
      _count = (30 - game.timerSec) ~/ 3;
    });

    if (game.timerSec <= 0) {
      return Image.asset(timerUrl.toString() + "12_0.png");
    } else if (game.timerSec <= 5) {
      return Image.asset(
          timerUrl.toString() + "12_" + game.timerSec.toString() + ".png");
    } else {
      return Image.asset(timerUrl.toString() + _count.toString() + ".png");
    }
  }

  @override
  void dispose() {
    super.dispose();
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
              const SizedBox(height: 140),
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

class _MultiMotiGamePageState extends State<MultiMotiGamePage>
    with TickerProviderStateMixin {
  MultiMotiGame game = MultiMotiGame();
  int _currentIndex = 0;
  Timer? motiTimer;
  int _count = 0;
  bool _isPlaying = false;
  late AudioPlayer _bgmPlayer; // BGM用のAudioPlayer
  late AudioPlayer _sePlayer;
  int _win = 0;

  @override
  void initState() {
    super.initState();
    _win = 0;
    _bgmPlayer = AudioPlayer();
    _sePlayer = AudioPlayer();
    _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readyDialog();
    });
  }

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
                    reset();
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

  void reset() {
    _count = 0;
    game.start = false;
    game.mistake = false;
    game.point = 0;
    _currentIndex = 0;
    _isPlaying = false;
    motiTimer = null;
  }

  void gameStart() {
    _startSE();
    _playBGM();
    game.start = true;
    game.timerSec = 30;
    game.next = 1;
    startTimer();
  }

  // タイマー開始
  void startTimer() {
    Stream.periodic(const Duration(seconds: 1), (int count) => count)
        .take(game.timerSec)
        .listen((int count) {
      setState(() {
        game.timerSec--;
        if (game.timerSec <= 0) {
          _stopBGM();
          _endDialog();
        }
      });
    });
  }

  Image? moti() {
    if (game.next == 2) {
      return Image.asset(imagePath1[_currentIndex],
          width: 500, height: 600, fit: BoxFit.cover);
    } else if (game.next == 1) {
      return Image.asset(imagePath2[_currentIndex],
          width: 500, height: 600, fit: BoxFit.cover);
    } else {
      return Image.asset(imagePath1[0],
          width: 500, height: 600, fit: BoxFit.cover);
    }
  }

  Image? timer() {
    setState(() {
      _count = (30 - game.timerSec) ~/ 3;
    });

    if (game.timerSec <= 0) {
      return Image.asset(timerUrl.toString() + "12_0.png");
    } else if (game.timerSec <= 5) {
      return Image.asset(
          timerUrl.toString() + "12_" + game.timerSec.toString() + ".png");
    } else {
      return Image.asset(timerUrl.toString() + _count.toString() + ".png");
    }
  }

  // BGM再生
  Future<void> _playBGM() async {
    await _bgmPlayer.play(AssetSource('/bgm/Shougatsu_test_inGame.mp3'),
        volume: 0.5);
  }

  // BGM停止
  Future<void> _stopBGM() async {
    await _bgmPlayer.stop();
  }

  // 杵撃ち
  Future<void> _dagekiSE() async {
    await _sePlayer.play(AssetSource("/se/moti/moti_dageki.mp3"));
  }

  // スタート
  Future<void> _startSE() async {
    await _sePlayer.play(AssetSource("se/start.mp3"));
  }

  // こねるSE
  Future<void> _koneruSE() async {
    await _sePlayer.play(AssetSource("/se/moti/moti_koneru.mp3"));
  }

  // ミスSE
  Future<void> _missSE() async {
    await _sePlayer.play(AssetSource("/se/moti/moti_miss.mp3"));
  }

  void moveView1() {
    if (_isPlaying) {
      _missSE();
      game.mistake = true;
      return;
    }
    _dagekiSE();
    setState(() {
      _isPlaying = true;
      game.next = 2;
    });
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6 * 75), // 全体のアニメーション時間
    );
    controller.addListener(() {
      setState(() {
        _currentIndex = (controller.value * imagePath1.length).floor();
        if (_currentIndex >= imagePath1.length) {
          controller.stop();
          _currentIndex = 0;
          _isPlaying = false;
          moveStop();
        }
      });
    });
    controller.forward();
  }

  void moveView2() {
    if (_isPlaying) {
      _missSE();
      game.mistake = true;
      return;
    }
    _koneruSE();
    setState(() {
      _isPlaying = true;
      game.next = 1;
    });
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 9 * 75), // 全体のアニメーション時間
    );
    controller.addListener(() {
      setState(() {
        _currentIndex = (controller.value * imagePath2.length).floor();
        if (_currentIndex >= imagePath2.length) {
          controller.stop();
          _currentIndex = 0;
          _isPlaying = false;
          game.point++;
          moveStop();
        }
      });
    });
    controller.forward();
  }

  void moveStop() {
    motiTimer?.cancel();
    motiTimer = null;
    setState(() {
      _isPlaying = false;
      _currentIndex = 0;
    });
    if (game.mistake) {
      motiTimer = Timer(const Duration(milliseconds: 100), () {
        setState(() {
          game.mistake = false;
        });
      });
    }
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
              const SizedBox(height: 140),
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
                                  onPressed: moveView1,
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
                                  onPressed: moveView2,
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
