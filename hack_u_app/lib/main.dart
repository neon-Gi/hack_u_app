import 'dart:async';
import 'dart:math' as math;
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:toml/toml.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
    const MyApp({super.key});
    @override
    Widget build(BuildContext context) => MaterialApp(
        home: const MyHomePage()
    );
}

class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key});
    @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    Stopwatch _stopwatch = Stopwatch();
    bool _start_dialog_show = false;
    bool _update_location = true;
    bool _nengajo_omote = true;
    String _contents = "";
    int _greet = 0;
    int _location = 0;
    int _caption = 0;
    int _type = 0;
    int _score = 0;

    Row folder_row(String left, int left_num, String right, int right_num)
        => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                folder_icon(left, left_num),
                Container(width: 40.0),
                folder_icon(right, right_num)
            ]
        );

    IconButton folder_icon(String name, num)
        => IconButton(
            icon: Image.asset('assets/image/folder/${name}.png'),
            style: IconButton.styleFrom(
                iconSize: 200.0,
            ),
            onPressed: () {
                check_nengajo(num);
            },
        );

    void check_nengajo(int num) async {
        if (num == _type) _score++;
        _update_location = true;
    }

    Future<String> nengajo_update() async {
        if (_nengajo_omote) return await rootBundle.loadString('assets/toml/todouhuken.toml');
        return await rootBundle.loadString("assets/toml/nengajo.toml");
    }

    Future<void> showStartDialog() => showDialog<void> (
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text('用意はいいか？'),
            actions: <Widget>[
                CupertinoDialogAction(
                    child: Text('！開始！', style: TextStyle(color: Colors.black)),
                    onPressed: () => Navigator.of(context).pop(),
                ),
            ],
        )
    );

    @override
    void initState() {
        super.initState();
        Timer.periodic(
            const Duration(milliseconds: 1),
            (Timer timer) async {
                final random = math.Random();
                if (!_start_dialog_show) {
                    _start_dialog_show = true;
                    await showStartDialog();
                    _stopwatch.start();
                    // BGMを載せたければ
                    // AudioPlayer().play(AssetSource('sound/Shougatsu_test_inGame.mp3'));
                }
                if (_update_location) {
                    _location = random.nextInt(57);
                    _caption = random.nextInt(5);
                    _greet = random.nextInt(20);
                    _nengajo_omote = random.nextDouble() > 0.25;
                    _update_location = false;
                }
                if (_stopwatch.isRunning) {
                    String a = await nengajo_update();
                    if (_nengajo_omote) {
                        Map<String, dynamic> map = TomlDocument.parse(a).toMap();
                        String name = map["location"][_location]["name"] ?? "";
                        String capital = map["location"][_location]["capital"][_caption] ?? "";
                        _contents = name + " " + capital;
                    } else {
                        Map<String, dynamic> map = TomlDocument.parse(a).toMap();
                        String greet = map["greetings"][_greet] ?? "";
                        _contents = greet;
                    }
                }
                if (_stopwatch.isRunning && _stopwatch.elapsedMilliseconds > 60000) {
                    _stopwatch.stop();
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/haikei/haikei.png'),
                    ),
                ),

                // ゲームレイアウト
                alignment: Alignment.topRight,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                                                width: 70.0,height: 70.0,
                                                child: clock_update(_stopwatch.elapsedMilliseconds)
                                            ),
                                            Container(height: 20.0),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 60.0, height: 50.0,
                                                color: Color.fromRGBO(255, 255, 100, 1),
                                                child: Text("SCORE\n" + _score.toString(), textAlign: TextAlign.center),
                                            ),
                                            Container(height: 50.0),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 70.0,
                                                child: IconButton(
                                                    onPressed: () => check_nengajo(6),
                                                    icon: Image.asset('assets/image/button/sendback.png')
                                                )
                                            )
                                        ]
                                    ),
                                ),

                                Container(
                                    width: 250.0, height: 450.0,
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: AssetImage('assets/image/hagaki/hagaki.png'),
                                        ),
                                    ),
                                    child: Stack(
                                        children: [
                                            Tategaki(" \n \n \n \n \n \n　" + _contents, style: TextStyle(fontSize: 20)),
                                            Align(
                                                alignment: Alignment.bottomRight,
                                                child: Container(
                                                    width: 80.0, height: 80.0,
                                                    margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                                                    child: IconButton(
                                                        onPressed: () => _nengajo_omote = !_nengajo_omote,
                                                        icon: Image.asset("assets/image/hagaki/turn.png"),
                                                    ),
                                                ),
                                            )
                                        ]
                                    )
                                ),

                                Container(
                                    width: 80.0,
                                    child: IconButton(
                                        onPressed: () => check_nengajo(5),
                                        icon: Image.asset('assets/image/button/inter.png'),
                                    )
                                )
                            ],
                        ),
                        Container(height: 20.0),
                        folder_row("edge", 4, "east", 1)
                    ]
                )
            )
        );
    }
}

Image clock_update(int milli_sec) {
    final sec = milli_sec ~/ 1000;
    if      (milli_sec < 55000) return Image.asset("assets/image/clock/clock_${sec ~/ 5}.png");
    else if (milli_sec < 60000) return Image.asset("assets/image/clock/clock_12_${60 - sec}left.png");
    return Image.asset('assets/image/clock/clock_12_0left.png');
}

class Tategaki extends StatelessWidget {
    Tategaki(
        this.text, {
            this.style,
            this.space = 12,
            this.align = WrapAlignment.start,
        }
    );

    final String text;
    final TextStyle? style;
    final double space;
    final WrapAlignment align;

    @override
    Widget build(BuildContext context) {
        final splitText = text.split("\n");
        return Align(
            child: Row(
                textDirection: TextDirection.rtl,
                children: [
                    for (var s in splitText) _textBox(s.runes),
                ]
            ),
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