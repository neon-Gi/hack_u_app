import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'select_game.dart';
import 'player.dart';

void main() {
  runApp(const MyApp());
}

// アプリ実行
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHOGATU PARTY',
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
  late VideoPlayerController _controller;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound() async {
    // アセットから音声を再生
    await _audioPlayer.play(AssetSource('/se/button_tap.mp3'));
  }

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset("assets/title_screen/title_op.mp4")
          ..initialize().then((_) {
            _controller.setVolume(1.0);
            _controller.play();
            setState(() {});
          });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showVideoDialog();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(() {}); // リスナーを削除
    _controller.dispose();
    super.dispose();
  }

  Future<void> _showVideoDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            width: 900, // 幅を指定
            height: 700, // 高さを指定
            child: VideoPlayer(_controller),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _controller.pause();
                Navigator.of(context).pop();
              },
              child: const Text(
                '×',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
              height: 550,
            ),
            // スタートボタン
            Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              width: 250,
              height: 100,
              child: IconButton(
                onPressed: () {
                  _playSound();
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const ModePage();
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
                      barrierDismissible: false,
                      context: context,
                      builder: (_) {
                        return const PlayerNameDialog();
                      });
                },
                icon: Image.asset("assets/title_screen/option.png"),
                iconSize: 100,
              ),
            )
          ],
        ),
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
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound() async {
    // アセットから音声を再生
    await _audioPlayer.play(AssetSource('/se/button_tap.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                height: 60,
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
                    _playSound();
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const GameMode("Single");
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
                    _playSound();
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const GameMode("Party");
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
                    _playSound();
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const GameMode("Select");
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
                        _playSound();
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return MyHomePage();
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
                    ),
                  )
                ],
              )
            ],
          ),
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
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound() async {
    // アセットから音声を再生
    await _audioPlayer.play(AssetSource('/se/button_tap.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    _playSound();
                    if (widget.mode == "Select") {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
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
                    } else {
                      showDialog(
                          barrierDismissible: false,
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
                        _playSound();
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const ModePage();
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
                    ),
                  )
                ],
              )
            ],
          ),
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
      title: const Text('実装できませんでした'),
      content: const Text('実装間に合わなかったため表示できません。'),
      actions: <Widget>[
        GestureDetector(
          child: const Text('OK', style: TextStyle(fontSize: 24)),
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

// プレイヤー名の入力を受け付けるダイアログ
class PlayerNameDialog extends StatefulWidget {
  const PlayerNameDialog({Key? key}) : super(key: key);

  @override
  State<PlayerNameDialog> createState() => _PlayerNameDialogState();
}

class _PlayerNameDialogState extends State<PlayerNameDialog> {
  String playerName = "";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('プレイヤー名を入力してください'),
      content: TextField(
        onChanged: (value) {
          playerName = value;
        },
      ),
      actions: <Widget>[
        GestureDetector(
          child: const Text('OK', style: TextStyle(fontSize: 24)),
          onTap: () async {
            final result = await PlayerManager().savePlayer(playerName);
            Navigator.of(context).pop();
            if (!result) {
              _errorDialog();
            }
          },
        )
      ],
    );
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
}
