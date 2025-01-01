import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hack_u_app/select_game.dart';

// ゲームの状況
class Game {
  int thinkingTime = 0;
  int point = 0;
}

// シーン
class Scene {
  int riddleNumber = 0;
}

// 解いてる謎
class Riddle {
  String questionURL = "";
  int answerNumber = 0;
  int timer = 0;
  Riddle(
      {required this.questionURL,
      required this.answerNumber,
      required this.timer});
}

// 選択肢
class Statements {
  String statement1 = "";
  String statement2 = "";
  String statement3 = "";
  String statement4 = "";
  Statements({
    required this.statement1,
    required this.statement2,
    required this.statement3,
    required this.statement4,
  });
}

class EscapeGamePage extends StatefulWidget {
  const EscapeGamePage({super.key});
  @override
  State<EscapeGamePage> createState() => _EscapeGamePageState();
}

class _EscapeGamePageState extends State<EscapeGamePage> {
  Game game = Game();
  Scene scene = Scene();
  int timer = 0;
  Timer? _timer;
  late AudioPlayer _bgmPlayer; // BGM用のAudioPlayer
  late AudioPlayer _sePlayer; // SE用のAudioPlayer

  // 出題
  List<Riddle> riddles = [
    Riddle(
        questionURL: "assets/escape/practice.png", answerNumber: 1, timer: 40),
    Riddle(
        questionURL: "assets/escape/riddle1.png", answerNumber: 1, timer: 40),
    Riddle(
        questionURL: "assets/escape/riddle2.png", answerNumber: 3, timer: 30),
    Riddle(
        questionURL: "assets/escape/riddle3.png", answerNumber: 2, timer: 20),
    Riddle(
        questionURL: "assets/escape/riddle4.png", answerNumber: 4, timer: 15),
    Riddle(
        questionURL: "assets/escape/riddle5.png", answerNumber: 2, timer: 10),
    Riddle(questionURL: "assets/escape/riddle6.png", answerNumber: 1, timer: 8),
    Riddle(questionURL: "assets/escape/riddle7.png", answerNumber: 4, timer: 5),
    Riddle(questionURL: "assets/escape/riddle8.png", answerNumber: 3, timer: 3),
  ];

  // 選択肢
  List<Statements> statements = [
    // 練習問題
    Statements(
      statement1: "もんだい",
      statement2: "たぬき",
      statement3: "はじまり",
      statement4: "はしまり",
    ),
    // 第1問
    Statements(
      statement1: "おんさ",
      statement2: "おんぷ",
      statement3: "かんさ",
      statement4: "こんと",
    ),
    // 第2問
    Statements(
      statement1: "かさ",
      statement2: "ない",
      statement3: "かも",
      statement4: "ばつ",
    ),
    // 第3問
    Statements(
      statement1: "17",
      statement2: "05",
      statement3: "09",
      statement4: "13",
    ),
    // 第4問
    Statements(
      statement1: "サクラ",
      statement2: "カメラ",
      statement3: "サイロ",
      statement4: "カイロ",
    ),
    // 第5問
    Statements(
      statement1: "9",
      statement2: "8",
      statement3: "6",
      statement4: "68",
    ),
    // 第6問
    Statements(
      statement1: "こばん",
      statement2: "おおばん",
      statement3: "ほかん",
      statement4: "みかん",
    ),
    // 第7問
    Statements(
      statement1: "1",
      statement2: "2",
      statement3: "3",
      statement4: "4",
    ),
    // 第8問
    Statements(
      statement1: "たぬき",
      statement2: "たぬき",
      statement3: "えもじ",
      statement4: "はじまり",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _bgmPlayer = AudioPlayer();
    _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    _sePlayer = AudioPlayer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  // リセット
  void init() {
    game.point = 0;
    game.thinkingTime = 0;
    scene.riddleNumber = -1;
    prepareAlert();
  }

  // 問題準備
  void prepareQuestion() {
    _startSE();
    setState(() {
      scene.riddleNumber++;
      timer = riddles[scene.riddleNumber].timer;
    });
    startTimer();
  }

  // 問題スタートアラート
  void prepareAlert() {
    showDialog(
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
                Text(
                  '第${scene.riddleNumber + 1}問目',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  scene.riddleNumber + 1 == 0
                      ? '練習問題です！謎とは関係ありません。'
                      : "制限時間は${riddles[scene.riddleNumber + 1].timer}秒です。",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    prepareQuestion();
                  },
                  child: const Text('！開始！'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ヒントアラート
  void hintAlert() {
    showDialog(
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
                  'ヒント',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  '選択肢は赤青黄緑でした。この4色でできているものがヒントになるかも...?',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectPage(),
                      ),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 正解チェック
  void answer(int answerNumber) {
    _stopBGM();
    answerAlert(riddles[scene.riddleNumber].answerNumber == answerNumber);
  }

  // フィードバックアラート
  void answerAlert(bool correct) {
    _timer?.cancel();
    if (correct) {
      _correctSE();
    } else {
      _missSE();
    }
    showDialog(
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
                Text(
                  correct ? '正解!' : "不正解...",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (correct && scene.riddleNumber != 0) game.point++;
                    Navigator.of(context).pop();
                    if (scene.riddleNumber == 8) {
                      endAlert();
                    } else {
                      prepareAlert();
                    }
                  },
                  child: Text(scene.riddleNumber == 8 ? "終わる" : '次の問題へ'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 最終点表示アラート
  void endAlert() {
    showDialog(
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
                  '終了!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Text(
                  '得点: ${game.point} / 8',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (game.point == 8) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectPage(),
                        ),
                      );
                    } else {
                      hintAlert();
                    }
                  },
                  child: const Text('終わる'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // タイマー開始
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _playBGM();
      setState(() {
        if (timer > 0) {
          timer--;
        } else {
          _timer?.cancel();
          answerAlert(false);
        }
      });
    });
  }

  // 出題中BGM
  Future<void> _playBGM() async {
    await _bgmPlayer.play(AssetSource('bgm/Shougatsu_test_inGame.mp3'),
        volume: 0.5);
  }

  // BGM停止
  Future<void> _stopBGM() async {
    await _bgmPlayer.stop();
  }

  // 不正解SE
  Future<void> _missSE() async {
    await _sePlayer.play(AssetSource('se/karuta/karuta_miss.mp3'));
  }

  // 正解SE
  Future<void> _correctSE() async {
    await _sePlayer.play(AssetSource('se/etoq/correct.mp3'));
  }

  // 読み上げスタートSE
  Future<void> _startSE() async {
    await _sePlayer.play(AssetSource('se/karuta/karuta_readStart.mp3'));
  }

  // UI
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
                  child: Image.asset(riddles[scene.riddleNumber].questionURL),
                ),
                SizedBox(height: screenHeight * 0.1),
                Row(
                  children: [
                    SizedBox(width: screenWidth * 0.72),
                    Text(
                      "残り: $timer",
                      style: TextStyle(fontSize: screenHeight * 0.03),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                // 選択肢1,2
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 選択肢1
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () => answer(1),
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
                                statements[scene.riddleNumber].statement1,
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
                          onPressed: () => answer(2),
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
                                statements[scene.riddleNumber].statement2,
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
                          onPressed: () => answer(3),
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
                                statements[scene.riddleNumber].statement3,
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
                          onPressed: () => answer(4),
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
                                statements[scene.riddleNumber].statement4,
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
