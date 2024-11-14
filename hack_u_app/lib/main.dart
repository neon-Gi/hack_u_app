import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      home: KeyWordPage(),
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
          image: AssetImage("title_screen/background.png"),
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
          SizedBox(
            width: 320,
            height: 100,
            child: Image.asset(
              "title_screen/title.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 320,
            height: 250,
          ),
          Container(
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
            width: 250,
            height: 100,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ModePage()));
              },
              icon: Image.asset("title_screen/start.png"),
              iconSize: 100,
            ),
          ),
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
              icon: Image.asset("title_screen/option.png"),
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
              image: AssetImage("title_screen/background_gray.png"),
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
              child:
                  Image.asset("title_screen/mode_title.png", fit: BoxFit.fill),
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
                icon: Image.asset("title_screen/single.png"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameMode("Single")));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 5.0),
              alignment: Alignment.center,
              height: 100,
              child: IconButton(
                icon: Image.asset("title_screen/party.png"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameMode("Party")));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 5.0),
              alignment: Alignment.center,
              height: 100,
              child: IconButton(
                icon: Image.asset("title_screen/select.png"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameMode("Select")));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 320,
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: IconButton(
                    icon: Image.asset("title_screen/return.png"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
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
              image: AssetImage("title_screen/background_gray.png"),
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
                    ? Image.asset("title_screen/single_title.png",
                        fit: BoxFit.fill)
                    : (widget.mode == "Party")
                        ? Image.asset("title_screen/party_title.png",
                            fit: BoxFit.fill)
                        : Image.asset("title_screen/select_title.png",
                            fit: BoxFit.fill)),
            Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: 310,
                child: (widget.mode == "Single")
                    ? Image.asset("title_screen/single_explain.png")
                    : (widget.mode == "Party")
                        ? Image.asset("title_screen/party_explain.png")
                        : Image.asset("title_screen/select_explain.png")),
            const SizedBox(
              width: 320,
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              height: 80,
              child: IconButton(
                icon: Image.asset("title_screen/start_mode.png"),
                onPressed: () {
                  if (widget.mode == "Select") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectPage()));
                  } else if (widget.mode == "Party") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => KeyWordPage()));
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
                  width: 320,
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: IconButton(
                    icon: Image.asset("title_screen/return.png"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ModePage()));
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("title_screen/background_gray.png"),
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
              child: Image.asset("title_screen/keyword_title.png",
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
                  Image.asset("title_screen/keyword_field.png"),
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
                              fontSize: 12.0,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
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
              height: 60,
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              height: 80,
              child: IconButton(
                icon: Image.asset("title_screen/keyword_enter.png"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return const AlertDialogSample();
                      });
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
                  width: 320,
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: IconButton(
                    icon: Image.asset("title_screen/return.png"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ModePage()));
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
