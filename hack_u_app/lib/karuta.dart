import 'dart:async';
import 'dart:math';
import 'select_game.dart';
import 'package:flutter/material.dart';

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
  "犬も歩けば棒に当たる",
  "犬も歩けば山となる",
  "犬も歩けば坊主に当たる",
  "犬。",
  "猪も歩けば棒に当たる",
  "猪も歩けば山となる",
  "猪も歩けば坊主に当たる",
  "「い」がつく十二支は犬と何？",
  "一石二鳥",
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
  "論より証拠",
  "論より団子",
  "論よりロバ",
  "ロバより証拠",
  "ロバより団子",
  "ロバも歩けば棒にあたる",
  "ロバに乗り猫に乗られる動物",
  "ロバ。",
  "ロウソク。"
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
  "花より団子",
  "花より証拠",
  "鼻より花",
  "花嫁衣裳",
  "花。",
  "針より団子",
  "針より証拠",
  "針ほどのことを棒ほどに言う",
  "針の穴に糸を通す"
];

// カルタ(得点の付け方はどうする?)
class KarutaGamePage extends StatefulWidget {
  const KarutaGamePage({super.key});

  @override
  State<KarutaGamePage> createState() => _KarutaGamePageState();
}

class _KarutaGamePageState extends State<KarutaGamePage> {
  bool _isPlaying = false;
  int round = 1; // 1=い、2=ろ、3=は
  List<int> cards_index = [0, 1, 2, 3, 4, 5, 6, 7, 8]; // 選択肢
  int answer_card = 0; // 正解
  List<bool> otetuki = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  String question_text = ""; // 出題する問題
  String display_text = ""; // 表示する文字
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    reset();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readyDialog();
    });
  }

  void reset() {
    round = 1;
    _isPlaying = false;
  }

  // 準備ダイアログ・ゲーム開始
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
                  Text(
                    '第$round問 用意はいいか？',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '準備できたら開始を押してください。',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      prepare_card();
                      _isPlaying = true;
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

  // 正解ダイアログ・次の問題へ
  Future<void> _correctDialog() async {
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
                    '正解!',
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
                      prepare_card();
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
                  const Text(
                    "得点: 〇〇点",
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

  void prepare_card() {
    setState(() {
      otetuki = [false, false, false, false, false, false, false, false, false];
      cards_index.shuffle();
      answer_card = Random().nextInt(9);
      question_text = "";
      if (round == 1) {
        question_text = i_keyword[answer_card];
      } else if (round == 2) {
        question_text = ro_keyword[answer_card];
      } else {
        question_text = ha_keyword[answer_card];
      }
      display_text = "";
    });
    print(question_text);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (display_text.length < question_text.length) {
          display_text += question_text[display_text.length];
        } else {
          _timer?.cancel();
        }
      });
    });
    print("$cards_index, 正解:$answer_card");
  }

  Image button0() {
    if (otetuki[0]) {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (round == 1) {
      return Image.asset(i_imagePath[cards_index[0]], fit: BoxFit.cover);
    } else if (round == 2) {
      return Image.asset(ro_imagePath[cards_index[0]], fit: BoxFit.cover);
    } else {
      return Image.asset(ha_imagePath[cards_index[0]], fit: BoxFit.cover);
    }
  }

  Image button1() {
    if (otetuki[1]) {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (round == 1) {
      return Image.asset(i_imagePath[cards_index[1]], fit: BoxFit.cover);
    } else if (round == 2) {
      return Image.asset(ro_imagePath[cards_index[1]], fit: BoxFit.cover);
    } else {
      return Image.asset(ha_imagePath[cards_index[1]], fit: BoxFit.cover);
    }
  }

  Image button2() {
    if (otetuki[2]) {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (round == 1) {
      return Image.asset(i_imagePath[cards_index[2]], fit: BoxFit.cover);
    } else if (round == 2) {
      return Image.asset(ro_imagePath[cards_index[2]], fit: BoxFit.cover);
    } else {
      return Image.asset(ha_imagePath[cards_index[2]], fit: BoxFit.cover);
    }
  }

  Image button3() {
    if (otetuki[3]) {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (round == 1) {
      return Image.asset(i_imagePath[cards_index[3]], fit: BoxFit.cover);
    } else if (round == 2) {
      return Image.asset(ro_imagePath[cards_index[3]], fit: BoxFit.cover);
    } else {
      return Image.asset(ha_imagePath[cards_index[3]], fit: BoxFit.cover);
    }
  }

  Image button4() {
    if (otetuki[4]) {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (round == 1) {
      return Image.asset(i_imagePath[cards_index[4]], fit: BoxFit.cover);
    } else if (round == 2) {
      return Image.asset(ro_imagePath[cards_index[4]], fit: BoxFit.cover);
    } else {
      return Image.asset(ha_imagePath[cards_index[4]], fit: BoxFit.cover);
    }
  }

  Image button5() {
    if (otetuki[5]) {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (round == 1) {
      return Image.asset(i_imagePath[cards_index[5]], fit: BoxFit.cover);
    } else if (round == 2) {
      return Image.asset(ro_imagePath[cards_index[5]], fit: BoxFit.cover);
    } else {
      return Image.asset(ha_imagePath[cards_index[5]], fit: BoxFit.cover);
    }
  }

  Image button6() {
    if (otetuki[6]) {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (round == 1) {
      return Image.asset(i_imagePath[cards_index[6]], fit: BoxFit.cover);
    } else if (round == 2) {
      return Image.asset(ro_imagePath[cards_index[6]], fit: BoxFit.cover);
    } else {
      return Image.asset(ha_imagePath[cards_index[6]], fit: BoxFit.cover);
    }
  }

  Image button7() {
    if (otetuki[7]) {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (round == 1) {
      return Image.asset(i_imagePath[cards_index[7]], fit: BoxFit.cover);
    } else if (round == 2) {
      return Image.asset(ro_imagePath[cards_index[7]], fit: BoxFit.cover);
    } else {
      return Image.asset(ha_imagePath[cards_index[7]], fit: BoxFit.cover);
    }
  }

  Image button8() {
    if (otetuki[8]) {
      return Image.asset(
        "assets/karuta/otetsuki.png",
        fit: BoxFit.cover,
      );
    } else if (round == 1) {
      return Image.asset(i_imagePath[cards_index[8]], fit: BoxFit.cover);
    } else if (round == 2) {
      return Image.asset(ro_imagePath[cards_index[8]], fit: BoxFit.cover);
    } else {
      return Image.asset(ha_imagePath[cards_index[8]], fit: BoxFit.cover);
    }
  }

  void onPress(int index) {
    if (answer_card == cards_index[index] && _isPlaying) {
      _isPlaying = false;
      _timer?.cancel();
      print("正解");
      if (round == 3) {
        _endDialog();
      } else {
        question_text = "";
        _correctDialog();
      }
    } else {
      setState(() {
        otetuki[index] = true;
      });
      print("不正解");
    }
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
                display_text,
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
