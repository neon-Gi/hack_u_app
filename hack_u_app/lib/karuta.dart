import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hack_u_app/select_game.dart';

// い
List<String> i_imagePath = [
  "assets/karuta/i/inumoarukeba_bou.png",
  "assets/karuta/i/inuyama.png",
  "assets/karuta/i/inumoarukeba_bouzu.png",
  "assets/karuta/i/inu.png",
  "assets/karuta/i/inoshishi_bou.png",
  "assets/karuta/i/inoshishi_yama.png",
  "assets/karuta/i/inoshishi_bouzu.png",
  "assets/karuta/i/inoshishi.png",
  "assets/karuta/i/isseki_nicho.png",
];
List<String> i_keyword = [
  "いぬもあるけばぼうにあたる",
  "いぬもあるけばやまとなる",
  "いぬもあるけばぼうずにあたる",
  "いぬ。",
  "いのししもあるけばぼうにあたる",
  "いのししもあるけばやまとなる",
  "いのししもあるけばぼうずにあたる",
  "「い」がつくじゅうにしはいぬとなに？",
  "いっせきにちょう",
];

// ろ
List<String> ro_imagePath = [
  "assets/karuta/ro/ron_shoko.png",
  "assets/karuta/ro/ron_dango.png",
  "assets/karuta/ro/ron_roba.png",
  "assets/karuta/ro/roba_shoko.png",
  "assets/karuta/ro/roba_dango.png",
  "assets/karuta/ro/roba_bou.png",
  "assets/karuta/ro/roba_animal.png",
  "assets/karuta/ro/roba.png",
  "assets/karuta/ro/candle.png"
];
List<String> ro_keyword = [
  "ろんよりしょうこ",
  "ろんよりだんご",
  "ろんよりろば",
  "ろばよりしょうこ",
  "ろばよりだんご",
  "ろばもあるけばぼうにあたる",
  "ろばにのりねこにのられるのはいぬ",
  "ろば。",
  "ろうそく。"
];

// は
List<String> ha_imagePath = [
  "assets/karuta/ha/flower_dango.png",
  "assets/karuta/ha/flower_shoko.png",
  "assets/karuta/ha/nose_flower.png",
  "assets/karuta/ha/hanayome.png",
  "assets/karuta/ha/flower.png",
  "assets/karuta/ha/niddle_dango.png",
  "assets/karuta/ha/niddle_shoko.png",
  "assets/karuta/ha/niddle_bou.png",
  "assets/karuta/ha/niddle_string.png"
];
List<String> ha_keyword = [
  "はなよりだんご",
  "はなよりしょうこ",
  "はなよりはな",
  "はなよめいしょう",
  "はな。",
  "はりよりだんご",
  "はりよりしょうこ",
  "はりほどのことをぼうほどにいう",
  "はりのあなにいとをとおす"
];

// シングル用カルタ(練習用)
class KarutaGamePage extends StatefulWidget {
  const KarutaGamePage({super.key});

  @override
  State<KarutaGamePage> createState() => _KarutaGamePageState();
}

class _KarutaGamePageState extends State<KarutaGamePage> {
  bool _isPlaying = false; // ゲーム時間中
  int round = 1; // 1=い、2=ろ、3=は
  List<String> card_status = [
    "no",
    "no",
    "no",
    "no",
    "no",
    "no",
    "no",
    "no",
    "no"
  ];
  // お手つき処理
  List<String> card_images = []; // 登場させるカード
  List<String> card_keyword = []; // 登場させるカードの読み
  List<int> card_index = [0, 1, 2, 3, 4, 5, 6, 7, 8]; // どのカードが置かれるか
  int answer_index = 0;
  String prepare_answer = "";
  String display = "";
  Timer? _timer;
  late AudioPlayer _bgmPlayer; // BGM用のAudioPlayer
  late AudioPlayer _sePlayer;

  @override
  void initState() {
    super.initState();
    _bgmPlayer = AudioPlayer();
    _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    _sePlayer = AudioPlayer();
    reset();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readyDialog();
    });
  }

  void reset() {
    _isPlaying = false;
    round = 1;
    card_status = ["no", "no", "no", "no", "no", "no", "no", "no", "no"];
    card_images = [];
    display = "";
    List<int> correct_number = []; // 重複しないように、カウントを記録する
    while (card_images.length != 9) {
      int random_index = Random().nextInt(9);
      // 重複がないようにする
      if (correct_number.contains(random_index)) {
        continue;
      } else if (card_images.length <= 2) {
        setState(() {
          card_images.add(i_imagePath[random_index]);
          card_keyword.add(i_keyword[random_index]);
          correct_number.add(random_index);
        });
      } else if (card_images.length <= 5) {
        setState(() {
          card_images.add(ro_imagePath[random_index]);
          card_keyword.add(ro_keyword[random_index]);
          correct_number.add(random_index);
        });
      } else {
        setState(() {
          card_images.add(ha_imagePath[random_index]);
          card_keyword.add(ha_keyword[random_index]);
          correct_number.add(random_index);
        });
      }
    }
    card_index.shuffle();
    print(card_index);
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

  // 読み上げスタートSE
  Future<void> _readStartSE() async {
    await _sePlayer.play(AssetSource('/se/karuta/karuta_readStart.mp3'));
  }

  Future<void> _missSE() async {
    await _sePlayer.play(AssetSource('/se/karuta/karuta_miss.mp3'));
  }

  Future<void> _correctSE() async {
    await _sePlayer.play(AssetSource('/se/karuta/karuta_correct.mp3'));
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
                  Text(
                    '第$round問 用意はいいか？',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '準備ができたら開始を押せ!!',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _playBGM();
                      prepare_question();
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

  // 出題
  void prepare_question() {
    answer_index = Random().nextInt(9);
    if (card_status[card_index.indexOf(answer_index)] == "1") {
      print("再抽選");
      prepare_question();
      return;
    }
    print("抽選");
    _readStartSE();
    if (card_index.contains(answer_index)) {
      setState(() {
        display = "";
        prepare_answer = card_keyword[answer_index];
        for (int i = 0; i < card_index.length; i++) {
          if (card_status[i] == "otetuki") {
            card_status[i] = "no";
          }
        }
        _isPlaying = true;
        _timer = Timer.periodic(const Duration(seconds: 1), (_) {
          setState(() {
            if (display.length == prepare_answer.length) {
              _timer?.cancel();
            } else {
              display = prepare_answer.substring(0, display.length + 1);
            }
          });
        });
      });
      print("出題:$prepare_answer, $answer_index");
    } else {
      print("再抽選");
      prepare_question();
    }
  }

  // 正解ダイアログ
  void _correctDialog() async {
    _timer?.cancel();
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
                    '正解!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(prepare_answer),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      round++;
                      Navigator.of(context).pop();
                      _readyDialog();
                    },
                    child: const Text('次の問題へ'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // 終了ダイアグラム
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
                    "得点: 9点",
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
                          reset();
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

  Image button0() {
    if (card_status[0] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[0] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[0]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button1() {
    if (card_status[1] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[1] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[1]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button2() {
    if (card_status[2] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[2] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[2]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button3() {
    if (card_status[3] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[3] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[3]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button4() {
    if (card_status[4] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[4] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[4]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button5() {
    if (card_status[5] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[5] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[5]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button6() {
    if (card_status[6] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[6] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[6]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button7() {
    if (card_status[7] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[7] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[7]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button8() {
    if (card_status[8] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[8] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[8]],
        fit: BoxFit.cover,
      );
    }
  }

  void onPress(int index) {
    print(
        "press: ${card_index[index]}, answer:$answer_index, Playing:$_isPlaying");
    if (card_status[index] == "otetuki" || card_status[index] == "1") {
      return;
    } else if (answer_index == card_index[index] && _isPlaying) {
      _correctSE();
      _isPlaying = false;
      card_status[index] = "1";
      if (round == 9) {
        _stopBGM();
        _endDialog();
      } else {
        _correctDialog();
      }
    } else {
      _missSE();
      setState(() {
        card_status[index] = "otetuki";
      });
    }
    print(card_status);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/karuta/tatami11.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Text(
                display,
                style: const TextStyle(fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(0),
                      icon: button0(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(1),
                      icon: button1(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(2),
                      icon: button2(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(3),
                      icon: button3(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(4),
                      icon: button4(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(5),
                      icon: button5(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(6),
                      icon: button6(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(7),
                      icon: button7(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(8),
                      icon: button8(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// マルチ用カルタ(対戦)
class MultiKarutaGamePage extends StatefulWidget {
  const MultiKarutaGamePage({super.key});

  @override
  State<MultiKarutaGamePage> createState() => MultiKarutaGamePageState();
}

class MultiKarutaGamePageState extends State<MultiKarutaGamePage> {
  bool _isPlaying = false; // ゲーム時間中
  int round = 0;
  List<String> card_status = [
    "no",
    "no",
    "no",
    "no",
    "no",
    "no",
    "no",
    "no",
    "no"
  ];
  // お手つき処理
  List<String> card_images = []; // 登場させるカード
  List<String> card_keyword = []; // 登場させるカードの読み
  List<int> card_index = [0, 1, 2, 3, 4, 5, 6, 7, 8]; // どのカードが置かれるか
  int answer_index = 0;
  String prepare_answer = "";
  String display = "";
  Timer? _timer;
  String wins = "";
  int player1Point = 0;
  int player2Point = 0;
  late AudioPlayer _bgmPlayer; // BGM用のAudioPlayer
  late AudioPlayer _sePlayer;

  @override
  void initState() {
    super.initState();
    _bgmPlayer = AudioPlayer();
    _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    _sePlayer = AudioPlayer();
    reset();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readyDialog();
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

  // 読み上げスタートSE
  Future<void> _readStartSE() async {
    await _sePlayer.play(AssetSource('/se/karuta/karuta_readStart.mp3'));
  }

  Future<void> _missSE() async {
    await _sePlayer.play(AssetSource('/se/karuta/karuta_miss.mp3'));
  }

  Future<void> _correctSE() async {
    await _sePlayer.play(AssetSource('/se/karuta/karuta_correct.mp3'));
  }

  void reset() {
    _isPlaying = false;
    round = 0;
    player1Point = 0;
    player2Point = 0;
    card_status = ["no", "no", "no", "no", "no", "no", "no", "no", "no"];
    card_images = [];
    display = "";
    List<int> correct_number = []; // 重複しないように、カウントを記録する
    while (card_images.length != 9) {
      int random_index = Random().nextInt(9);
      // 重複がないようにする
      if (correct_number.contains(random_index)) {
        continue;
      } else if (card_images.length <= 2) {
        setState(() {
          card_images.add(i_imagePath[random_index]);
          card_keyword.add(i_keyword[random_index]);
          correct_number.add(random_index);
        });
      } else if (card_images.length <= 5) {
        setState(() {
          card_images.add(ro_imagePath[random_index]);
          card_keyword.add(ro_keyword[random_index]);
          correct_number.add(random_index);
        });
      } else {
        setState(() {
          card_images.add(ha_imagePath[random_index]);
          card_keyword.add(ha_keyword[random_index]);
          correct_number.add(random_index);
        });
      }
    }
    card_index.shuffle();
    print(card_index);
  }

  // 準備ダイアログ
  Future<void> _readyDialog() async {
    setState(() {
      round++;
    });
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
                  Text(
                    '第$round問 用意はいいか？',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '1Pと2Pに分かれてプレイ！\n準備ができたら開始を押せ!!',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _playBGM();
                      prepare_question();
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

  // 出題
  void prepare_question() {
    answer_index = Random().nextInt(9);
    if (card_status[card_index.indexOf(answer_index)] == "1" ||
        card_status[card_index.indexOf(answer_index)] == "2") {
      print("再抽選");
      prepare_question();
      return;
    }
    print("抽選");
    _readStartSE();
    if (card_index.contains(answer_index)) {
      setState(() {
        display = "";
        prepare_answer = card_keyword[answer_index];
        for (int i = 0; i < card_index.length; i++) {
          if (card_status[i] == "otetuki") {
            card_status[i] = "no";
          }
        }
        _isPlaying = true;
        _timer = Timer.periodic(const Duration(seconds: 1), (_) {
          setState(() {
            if (display.length == prepare_answer.length) {
              _timer?.cancel();
            } else {
              display = prepare_answer.substring(0, display.length + 1);
            }
          });
        });
      });
      print("出題:$prepare_answer, $answer_index");
    } else {
      print("再抽選");
      prepare_question();
    }
  }

  // 正解ダイアログ
  void _correctDialog(int index) async {
    _timer?.cancel();
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
                    '正解!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text("正解したプレイヤーがボタンを押してください"),
                  ElevatedButton(
                    onPressed: () {
                      player1Point++;
                      setState(() {
                        card_status[index] = "1";
                      });
                      Navigator.of(context).pop();
                      if (round == 9) {
                        _endDialog();
                      } else {
                        _readyDialog();
                      }
                    },
                    child: const Text('Player1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      player2Point++;
                      setState(() {
                        card_status[index] = "2";
                      });
                      Navigator.of(context).pop();
                      if (round == 9) {
                        _stopBGM();
                        _endDialog();
                      } else {
                        _readyDialog();
                      }
                    },
                    child: const Text('Player2'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // 終了ダイアグラム
  Future<void> _endDialog() async {
    _stopBGM();
    if (player1Point > player2Point) {
      wins = "1";
    } else {
      wins = "2";
    }
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
                  Text(
                    '結果: Player${wins}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Player1:$player1Point点\n Player2:$player2Point点",
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
                          reset();
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

  Image button0() {
    if (card_status[0] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[0] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[0] == "2") {
      return Image.asset(
        "assets/karuta/2P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[0]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button1() {
    if (card_status[1] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[1] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[1] == "2") {
      return Image.asset(
        "assets/karuta/2P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[1]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button2() {
    if (card_status[2] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[2] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[2] == "2") {
      return Image.asset(
        "assets/karuta/2P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[2]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button3() {
    if (card_status[3] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[3] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[3] == "2") {
      return Image.asset(
        "assets/karuta/2P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[3]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button4() {
    if (card_status[4] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[4] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[4] == "2") {
      return Image.asset(
        "assets/karuta/2P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[4]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button5() {
    if (card_status[5] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[5] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[5] == "2") {
      return Image.asset(
        "assets/karuta/2P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[5]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button6() {
    if (card_status[6] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[6] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[6] == "2") {
      return Image.asset(
        "assets/karuta/2P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[6]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button7() {
    if (card_status[7] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[7] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[7] == "2") {
      return Image.asset(
        "assets/karuta/2P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[7]],
        fit: BoxFit.cover,
      );
    }
  }

  Image button8() {
    if (card_status[8] == "otetuki") {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[8] == "1") {
      return Image.asset(
        "assets/karuta/1P.png",
        fit: BoxFit.cover,
      );
    } else if (card_status[8] == "2") {
      return Image.asset(
        "assets/karuta/2P.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        card_images[card_index[8]],
        fit: BoxFit.cover,
      );
    }
  }

  void onPress(int index) {
    print(
        "press: ${card_index[index]}, answer:$answer_index, Playing:$_isPlaying");
    if (card_status[index] == "otetuki" ||
        card_status[index] == "1" ||
        card_status[index] == "2") {
      return;
    } else if (answer_index == card_index[index] && _isPlaying) {
      _correctSE();
      _isPlaying = false;
      _correctDialog(index);
    } else {
      _missSE();
      setState(() {
        card_status[index] = "otetuki";
      });
    }
    print(card_status);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/karuta/tatami11.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Text(
                display,
                style: const TextStyle(fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(0),
                      icon: button0(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(1),
                      icon: button1(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(2),
                      icon: button2(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(3),
                      icon: button3(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(4),
                      icon: button4(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(5),
                      icon: button5(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(6),
                      icon: button6(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(7),
                      icon: button7(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    width: 120,
                    child: IconButton(
                      onPressed: () => onPress(8),
                      icon: button8(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
