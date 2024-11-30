import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hack_u_app/multi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'select_game.dart';

void main() {
  runApp(const MyApp());
}

// アプリ実行
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: MyHomePage(),
    );
  }
}

// ホーム画面
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/title_screen/background.png"), // 背景
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            width: 320,
            height: 60,
          ),
          // タイトル
          SizedBox(
            width: 320,
            height: 100,
            child: Image.asset(
              "assets/title_screen/title.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 320,
            height: 250,
          ),
          // スタートボタン
          Container(
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
            width: 250,
            height: 100,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const ModePage();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final Animatable<Offset> tween =
                          Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
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
              icon: Image.asset("assets/title_screen/start.png"),
              iconSize: 100,
            ),
          ),
          // オプションボタン
          Container(
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
            width: 250,
            height: 100,
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return const AlertDialogSample();
                    });
              },
              icon: Image.asset("assets/title_screen/option.png"),
              iconSize: 100,
            ),
          )
        ],
      ),
    );
  }
}

// モード選択
class ModePage extends StatefulWidget {
  const ModePage({Key? key}) : super(key: key);
  @override
  State<ModePage> createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/title_screen/background_gray.png"),
              fit: BoxFit.cover), // 背景
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 320,
              height: 80,
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              width: 200,
              child: Image.asset("assets/title_screen/mode_title.png",
                  fit: BoxFit.fill),
            ),
            const SizedBox(
              width: 320,
              height: 110,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 5.0),
              alignment: Alignment.center,
              height: 100,
              child: IconButton(
                icon: Image.asset("assets/title_screen/single.png"),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const GameMode("Single");
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final Animatable<Offset> tween = Tween(
                                begin: const Offset(1.0, 0.0), end: Offset.zero)
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
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 5.0),
              alignment: Alignment.center,
              height: 100,
              child: IconButton(
                icon: Image.asset("assets/title_screen/party.png"),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const GameMode("Party");
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final Animatable<Offset> tween = Tween(
                                begin: const Offset(1.0, 0.0), end: Offset.zero)
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
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 5.0),
              alignment: Alignment.center,
              height: 100,
              child: IconButton(
                icon: Image.asset("assets/title_screen/select.png"),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const GameMode("Select");
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final Animatable<Offset> tween = Tween(
                                begin: const Offset(1.0, 0.0), end: Offset.zero)
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
              ),
            ),
            // 戻るボタン
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 290,
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.topLeft,
                  width: 100,
                  height: 100,
                  child: IconButton(
                    icon: Image.asset(
                      "assets/title_screen/return.png",
                      fit: BoxFit.fill,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return MyHomePage();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// 各モードの説明
class GameMode extends StatefulWidget {
  const GameMode(this.mode, {Key? key}) : super(key: key);
  final String mode;
  @override
  State<GameMode> createState() => _GameModePageState();
}

class _GameModePageState extends State<GameMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/title_screen/background_gray.png"),
              fit: BoxFit.cover), // 背景
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 320,
              height: 80,
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: 250,
                child: (widget.mode == "Single")
                    ? Image.asset("assets/title_screen/single_title.png",
                        fit: BoxFit.fill)
                    : (widget.mode == "Party")
                        ? Image.asset("assets/title_screen/party_title.png",
                            fit: BoxFit.fill)
                        : Image.asset("assets/title_screen/select_title.png",
                            fit: BoxFit.fill)),
            Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: 310,
                child: (widget.mode == "Single")
                    ? Image.asset("assets/title_screen/single_explain.png")
                    : (widget.mode == "Party")
                        ? Image.asset("assets/title_screen/party_explain.png")
                        : Image.asset(
                            "assets/title_screen/select_explain.png")),
            const SizedBox(
              width: 320,
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              height: 80,
              child: IconButton(
                icon: Image.asset("assets/title_screen/start_mode.png"),
                onPressed: () {
                  if (widget.mode == "Select") {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return SelectPage();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
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
                  } else if (widget.mode == "Party") {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const KeyWordPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return const FadeUpwardsPageTransitionsBuilder()
                                  .buildTransitions(
                                MaterialPageRoute(
                                    builder: (context) => const KeyWordPage()),
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              );
                            }));
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return const AlertDialogSample();
                        });
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 290,
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: IconButton(
                    icon: Image.asset("assets/title_screen/return.png"),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const ModePage();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// 合言葉
class KeyWordPage extends StatefulWidget {
  const KeyWordPage({Key? key}) : super(key: key);
  @override
  State<KeyWordPage> createState() => _KeyWordPageState();
}

class _KeyWordPageState extends State<KeyWordPage> {
  String keyword = "";
  String? _playerId;
  String? _playerName;

  Future<void> _TextDialog() async {
    final TextEditingController nameController = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('名前を決めよう！'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'ここに名前を入力'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const ModePage();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final Animatable<Offset> tween = Tween(
                              begin: const Offset(-1.0, 0.0), end: Offset.zero)
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
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(nameController.text); // 入力値を返す
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    // 結果を処理
    if (result != null && result.isNotEmpty) {
      _savePlayerData(result);
    }
  }

  // プレイヤーデータをロード
  Future<void> _loadPlayerData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("playerId") == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _TextDialog();
      });
    } else {
      setState(() {
        _playerId = prefs.getString("playerId");
        _playerName = prefs.getString("playerName");
      });
    }
  }

  Future<void> _savePlayerData(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final randomId = List.generate(8, (index) => Random().nextInt(10)).join();
    await prefs.setString('playerId', randomId);
    await prefs.setString("playerName", name);
    setState(() {
      _playerId = randomId;
      _playerName = name;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPlayerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/title_screen/background_gray.png"),
              fit: BoxFit.cover), // 背景
        ),
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 320,
              height: 60,
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              width: 250,
              child: Image.asset("assets/title_screen/keyword_title.png",
                  fit: BoxFit.fill),
            ),
            const SizedBox(
              width: 320,
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Image.asset("assets/title_screen/keyword_field.png"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        width: 250,
                        height: 50,
                        child: TextField(
                          onChanged: (value) {
                            keyword = value;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20)
                          ],
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "合言葉を入力",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      // 文字数カウント入れる場合はここに
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 320,
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              child: IconButton(
                icon: Image.asset(
                  "assets/title_screen/keyword_create.png",
                  width: 280,
                  height: 60,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return roomView("Create", _playerName as String);
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final Animatable<Offset> tween = Tween(
                                begin: const Offset(1.0, 0.0), end: Offset.zero)
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
              ),
            ),
            const SizedBox(
              width: 320,
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              height: 80,
              child: IconButton(
                icon: Image.asset("assets/title_screen/keyword_enter.png"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return const AlertDialogSample();
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              width: 320,
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 290,
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: IconButton(
                    icon: Image.asset("assets/title_screen/return.png"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ModePage()));
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("PlayerId: $_playerId, PlayerName: $_playerName"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// 未実装ダイアログを表示
class AlertDialogSample extends StatelessWidget {
  const AlertDialogSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('実装中'),
      content: const Text('実装中のため表示できません。'),
      actions: <Widget>[
        GestureDetector(
          child: const Text('OK'),
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
