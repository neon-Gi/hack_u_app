import 'dart:async';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hack_u_app/player.dart';
import 'package:hack_u_app/select_game.dart';
import 'package:toml/toml.dart';

class HagakiGamePage extends StatefulWidget {
  const HagakiGamePage({super.key});
  @override
  State<HagakiGamePage> createState() => _HagakiGamePageState();
}

class _HagakiGamePageState extends State<HagakiGamePage> {
  Stopwatch _stopwatch = Stopwatch();
  Stopwatch _otetsuki = Stopwatch();
  bool _start_dialog_show = false;
  bool _update_location = true;
  bool _nengajo_omote = true;
  String _contents = "";
  int _greet = 0;
  int _location = 0;
  int _caption = 0;
  int _type = 0;
  int _score = 0;
  late AudioPlayer _bgmPlayer; // BGM用のAudioPlayer
  late AudioPlayer _sePlayer;

  Row folder_row(String left, int left_num, String right, int right_num) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        folder_icon(left, left_num),
        Container(width: 40.0),
        folder_icon(right, right_num)
      ]);

  IconButton folder_icon(String name, num) => IconButton(
        icon: Image.asset('assets/hagaki/image/folder/${name}.png'),
        style: IconButton.styleFrom(iconSize: 200.0),
        onPressed: () => check_nengajo(num),
      );

  void check_nengajo(int num) async {
    if (!_otetsuki.isRunning) {
      if (num == _type) {
        _stopSE();
        _correctSE();
        _score++;
      } else {
        _stopSE();
        _uncorrectSE();
        _otetsuki.start();
      }
      _update_location = true;
    }
  }

  Future<String> nengajo_update() async {
    if (_nengajo_omote)
      return await rootBundle.loadString('assets/hagaki/toml/todouhuken.toml');
    return await rootBundle.loadString("assets/hagaki/toml/nengajo.toml");
  }

  Future<String> nengajo_type() async =>
      await rootBundle.loadString('assets/hagaki/toml/todouhuken.toml');

  AssetImage hagaki_update() {
    if (_nengajo_omote)
      return AssetImage('assets/hagaki/image/hagaki/hagaki.png');
    return AssetImage('assets/hagaki/image/hagaki/hagaki_white.png');
  }

  EdgeInsets please_top() {
    return EdgeInsets.only(
      top: (math.sin(_stopwatch.elapsedMilliseconds / 400.0) * 40.0).abs() +
          70.0,
    );
  }

  void turn() {
    _nengajo_omote = !_nengajo_omote;
  }

  Future<void> showStartDialog() => showDialog<void>(
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
                    _startSE();
                    _playBGM();
                    Navigator.of(context).pop();
                  },
                  child: const Text('！開始！'),
                ),
              ],
            ),
          ),
        );
      });

  Future<void> showEndDialog() => showDialog<void>(
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
                  'ストップ！\n結果 ' + _score.toString() + " 点",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const HagakiGamePage();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final Animatable<Offset> tween = Tween(
                                      begin: const Offset(1.0, 0.0),
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
                      child: const Text("もう一度",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });

  Future<void> submitScore() async {
    try {
      final response = await PlayerManager().submitSocre(4, _score);
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

  Future<void> _stopSE() async {
    await _sePlayer.stop();
  } // SE停止(再生中のみ

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

  @override
  void initState() {
    super.initState();
    _bgmPlayer = AudioPlayer();
    _sePlayer = AudioPlayer();
    _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    Timer.periodic(
      const Duration(milliseconds: 1),
      (Timer timer) async {
        final random = math.Random();
        if (!_start_dialog_show) {
          _start_dialog_show = true;
          await showStartDialog();
          _stopwatch.start();
        }
        if (_stopwatch.isRunning) {
          String a = await nengajo_update();
          if (!_otetsuki.isRunning) {
            if (_nengajo_omote) {
              final map = TomlDocument.parse(a).toMap();
              final name = map["location"][_location]["name"] ?? "";
              final capital =
                  map["location"][_location]["capital"][_caption] ?? "";
              _contents = " " + name + "\n " + capital;
            } else {
              final map = TomlDocument.parse(a).toMap();
              final greet = map["greetings"][_greet] ?? "";
              _contents = greet;
            }
          } else {
            _nengajo_omote = true;
            _contents = " お手つき！";
          }
          if (_otetsuki.elapsedMilliseconds > 1000) {
            _otetsuki.stop();
            _otetsuki.reset();
            _update_location = true;
          }
          if (_stopwatch.elapsedMilliseconds > 60000) {
            _stopwatch.stop();
            _stopBGM();
            await showEndDialog();
          }
        }
        if (_update_location) {
          _location = random.nextInt(57);
          _caption = random.nextInt(5);
          _type = TomlDocument.parse(await nengajo_type()).toMap()["location"]
                  [_location]["type"] ??
              7;
          _greet = random.nextInt(20);
          _nengajo_omote = random.nextDouble() > 0.25;
          _update_location = false;
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            // 背景
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/hagaki/image/haikei/haikei.png'),
              ),
            ),

            // ゲームレイアウト
            alignment: Alignment.topRight,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              folder_row("west", 2, "south", 3),
              Container(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: 70.0,
                              height: 70.0,
                              child:
                                  clock_update(_stopwatch.elapsedMilliseconds)),
                          Container(height: 20.0),
                          Container(
                            alignment: Alignment.center,
                            width: 60.0,
                            height: 50.0,
                            color: Color.fromRGBO(255, 255, 100, 1),
                            child: Text("SCORE\n" + _score.toString(),
                                textAlign: TextAlign.center),
                          ),
                          Container(height: 50.0),
                          Container(
                              alignment: Alignment.center,
                              width: 70.0,
                              child: IconButton(
                                  onPressed: () => check_nengajo(6),
                                  icon: Image.asset(
                                      'assets/hagaki/image/button/sendback.png')))
                        ]),
                  ),
                  Container(
                      width: 250.0,
                      height: 450.0,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: hagaki_update(),
                        ),
                      ),
                      child: Stack(children: [
                        Container(
                          height: 350.0,
                          margin: EdgeInsets.only(top: 60.0),
                          child: Tategaki(" \n \n \n \n \n \n" + _contents,
                              style: TextStyle(fontSize: 20)),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 80.0,
                            margin: please_top(),
                            child: please_image(_nengajo_omote),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            margin: EdgeInsets.only(right: 0.0, bottom: 0.0),
                            child: IconButton(
                              onPressed: () => turn(),
                              icon: Image.asset(
                                  "assets/hagaki/image/hagaki/turn.png"),
                            ),
                          ),
                        )
                      ])),
                  Container(
                      width: 80.0,
                      child: IconButton(
                        onPressed: () => check_nengajo(5),
                        icon:
                            Image.asset('assets/hagaki/image/button/inter.png'),
                      ))
                ],
              ),
              Container(height: 20.0),
              folder_row("edge", 4, "east", 1)
            ])));
  }
}

Image clock_update(int milli_sec) {
  final sec = milli_sec ~/ 1000;
  if (milli_sec < 55000)
    return Image.asset("assets/hagaki/image/clock/clock_${sec ~/ 5}.png");
  else if (milli_sec < 60000)
    return Image.asset(
        "assets/hagaki/image/clock/clock_12_${60 - sec}left.png");
  return Image.asset('assets/hagaki/image/clock/clock_12_0left.png');
}

Image please_image(bool omote) {
  if (!omote) return Image.asset("assets/hagaki/image/hagaki/turn_please.png");
  return Image.asset('assets/hagaki/image/hagaki/turn_please_none.png');
}

class Tategaki extends StatelessWidget {
  Tategaki(
    this.text, {
    this.style,
    this.space = 12,
    this.align = WrapAlignment.start,
  });

  final String text;
  final TextStyle? style;
  final double space;
  final WrapAlignment align;

  @override
  Widget build(BuildContext context) {
    final splitText = text.split("\n");
    return Align(
      child: Row(textDirection: TextDirection.rtl, children: [
        for (var s in splitText) _textBox(s.runes),
      ]),
      alignment: Alignment.topCenter,
    );
  }

  Widget _textBox(Runes runes) {
    return Wrap(
      alignment: align,
      textDirection: TextDirection.rtl,
      direction: Axis.vertical,
      children: [
        for (var rune in runes)
          Row(
            children: [
              SizedBox(width: space),
              _character(String.fromCharCode(rune)),
            ],
          )
      ],
    );
  }

  Widget _character(String char) => Text(char, style: style);
}
