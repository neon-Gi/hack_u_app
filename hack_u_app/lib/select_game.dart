import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hack_u_app/etoquestion.dart';
import 'hagaki.dart';
import 'karuta.dart';
import 'main.dart';
import 'moti.dart';
import 'escape.dart';

// 選択画面
class SelectPage extends StatefulWidget {
  const SelectPage({super.key});
  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> _playSound() async {
    // アセットから音声を再生
    await _audioPlayer.play(AssetSource('se/button_tap.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // ボタンのサイズを設定
    double buttonSize = screenWidth * 0.3; // 幅と高さを画面幅の30%に設定
    double buttonSpacing = screenHeight * 0.03; // ボタン間のスペースを画面幅の3%に設定

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/title_screen/background_gray.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.05),
            // 1行目
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildGameButton(context, "assets/select_screen/moti_icon.png",
                    const GameDetail("moti"), buttonSize),
                _buildGameButton(context, "assets/select_screen/etoq_icon.png",
                    const GameDetail("etoq"), buttonSize),
                _buildGameButton(
                    context,
                    "assets/select_screen/karuta_icon.png",
                    const GameDetail("karuta"),
                    buttonSize),
              ],
            ),
            SizedBox(height: buttonSpacing),
            // 2行目
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildGameButton(
                    context,
                    "assets/select_screen/hagaki_icon.png",
                    const GameDetail("nengajo"),
                    buttonSize),
                _buildGameButton(
                    context,
                    "assets/select_screen/riddle_icon.png",
                    const GameDetail("riddle"),
                    buttonSize),
                _buildGameButton(
                    context,
                    "assets/select_screen/game_icon_white.png",
                    "None",
                    buttonSize),
              ],
            ),
            SizedBox(height: buttonSpacing),
            // 3行目
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildGameButton(
                    context,
                    "assets/select_screen/game_icon_white.png",
                    "None",
                    buttonSize),
                _buildGameButton(
                    context,
                    "assets/select_screen/game_icon_white.png",
                    "None",
                    buttonSize),
                _buildGameButton(
                    context,
                    "assets/select_screen/game_icon_white.png",
                    "None",
                    buttonSize),
              ],
            ),
            SizedBox(height: buttonSpacing),
            // 4行目
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildGameButton(
                    context,
                    "assets/select_screen/game_icon_white.png",
                    "None",
                    buttonSize),
                _buildGameButton(
                    context,
                    "assets/select_screen/game_icon_white.png",
                    "None",
                    buttonSize),
                _buildGameButton(
                    context,
                    "assets/select_screen/game_icon_white.png",
                    "None",
                    buttonSize),
              ],
            ),
            SizedBox(height: buttonSpacing),
            // 最終行
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildGameButton(
                    context,
                    "assets/select_screen/game_icon_left.png",
                    const AlertDialogSample(),
                    buttonSize),
                _buildGameButton(
                    context,
                    "assets/select_screen/game_icon_return.png",
                    const MyHomePage(),
                    buttonSize), // 右のボタンを少し大きく
                _buildGameButton(
                    context,
                    "assets/select_screen/game_icon_right.png",
                    const AlertDialogSample(),
                    buttonSize),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ボタンを生成するための共通メソッド
  Widget _buildGameButton(
      BuildContext context, String iconPath, page, double size) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
      width: size,
      height: size,
      alignment: Alignment.center,
      child: IconButton(
        onPressed: () {
          _playSound();
          if (page == "None") {
            showDialog(
              context: context,
              builder: (_) {
                return const AlertDialogSample();
              },
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
        },
        icon: Image.asset(iconPath),
        iconSize: size * 0.6, // アイコンサイズをボタンサイズの60%に設定
      ),
    );
  }
}

// ゲームの詳細
class GameDetail extends StatefulWidget {
  const GameDetail(this.game, {super.key});
  final String game;
  @override
  State<GameDetail> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final AudioPlayer audioPlayer = AudioPlayer();
    Future<void> playSound() async {
      // アセットから音声を再生
      await audioPlayer.play(AssetSource('se/button_tap.mp3'));
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/title_screen/background_gray.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.1),
              // タイトル
              Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: screenWidth * 0.6,
                child: switch (widget.game) {
                  "moti" =>
                    Image.asset("assets/select_screen/titles/moti_title.png"),
                  "etoq" =>
                    Image.asset("assets/select_screen/titles/etoq_title.png"),
                  "karuta" =>
                    Image.asset("assets/select_screen/titles/karuta_title.png"),
                  "nengajo" => Image.asset(
                      "assets/select_screen/titles/nengajo_title.png"),
                  "riddle" =>
                    Image.asset("assets/select_screen/titles/riddle_title.png"),
                  _ => Image.asset("assets/select_screen/game_title.png"),
                },
              ),
              // 説明
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: screenWidth * 0.7,
                child: switch (widget.game) {
                  "moti" => Image.asset(
                      "assets/select_screen/explain/moti_explain.png"),
                  "etoq" => Image.asset(
                      "assets/select_screen/explain/etoq_explain.png"),
                  "karuta" => Image.asset(
                      "assets/select_screen/explain/karuta_explain.png"),
                  "nengajo" => Image.asset(
                      "assets/select_screen/explain/nengajo_explain.png"),
                  "riddle" => Image.asset(
                      "assets/select_screen/explain/riddle_explain.png"),
                  _ => Image.asset(
                      "assets/select_screen/explain/example_game_explain.png"),
                },
              ),
              SizedBox(height: screenHeight * 0.05),
              // ゲーム開始ボタン
              switch (widget.game) {
                "moti" => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        height: screenHeight * 0.09,
                        child: IconButton(
                          icon: Image.asset(
                              "assets/title_screen/start_first.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MotiGamePage()),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.center,
                        height: screenHeight * 0.09,
                        child: IconButton(
                          icon: Image.asset(
                              "assets/title_screen/start_second.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MultiMotiGamePage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                "etoq" => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        height: screenHeight * 0.09,
                        child: IconButton(
                          icon: Image.asset(
                              "assets/title_screen/start_first.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EtoQuestion()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                "karuta" => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        height: screenHeight * 0.09,
                        child: IconButton(
                          icon: Image.asset(
                              "assets/title_screen/start_first.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const KarutaGamePage()),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        height: screenHeight * 0.09,
                        child: IconButton(
                          icon: Image.asset(
                              "assets/title_screen/start_second.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MultiKarutaGamePage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                "nengajo" => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        height: screenHeight * 0.09,
                        child: IconButton(
                          icon: Image.asset(
                              "assets/title_screen/start_first.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HagakiGamePage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                "riddle" => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        height: screenHeight * 0.09,
                        child: IconButton(
                          icon: Image.asset(
                              "assets/title_screen/start_first.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EscapeGamePage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                _ => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        height: screenHeight * 0.09,
                        child: IconButton(
                          icon: Image.asset(
                              "assets/title_screen/start_first.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MotiGamePage()),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.center,
                        height: screenHeight * 0.09,
                        child: IconButton(
                          icon: Image.asset(
                              "assets/title_screen/start_second.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MultiMotiGamePage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
              },
              // ランキングボタン・戻るボタン
              switch (widget.game) {
                "moti" => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        alignment: Alignment.center,
                        width: screenWidth * 0.4,
                        child: IconButton(
                          icon: Image.asset(
                            "assets/select_screen/ranking_button.png",
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            playSound();
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.3),
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.1,
                        child: IconButton(
                          icon: Image.asset("assets/title_screen/return.png"),
                          onPressed: () {
                            playSound();
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const SelectPage();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final Animatable<Offset> tween = Tween(
                                          begin: const Offset(-1.0, 0.0),
                                          end: Offset.zero)
                                      .chain(
                                          CurveTween(curve: Curves.easeInOut));
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
                  ),
                "etoq" => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        alignment: Alignment.center,
                        width: screenWidth * 0.4,
                        child: IconButton(
                          icon: Image.asset(
                            "assets/select_screen/ranking_button.png",
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            playSound();
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.3),
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.1,
                        child: IconButton(
                          icon: Image.asset("assets/title_screen/return.png"),
                          onPressed: () {
                            playSound();
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const SelectPage();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final Animatable<Offset> tween = Tween(
                                          begin: const Offset(-1.0, 0.0),
                                          end: Offset.zero)
                                      .chain(
                                          CurveTween(curve: Curves.easeInOut));
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
                  ),
                "karuta" => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: screenWidth * 0.7),
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.1,
                        child: IconButton(
                          icon: Image.asset("assets/title_screen/return.png"),
                          onPressed: () {
                            playSound();
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const SelectPage();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final Animatable<Offset> tween = Tween(
                                          begin: const Offset(-1.0, 0.0),
                                          end: Offset.zero)
                                      .chain(
                                          CurveTween(curve: Curves.easeInOut));
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
                  ),
                "nengajo" => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        alignment: Alignment.center,
                        width: screenWidth * 0.4,
                        child: IconButton(
                          icon: Image.asset(
                            "assets/select_screen/ranking_button.png",
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            playSound();
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.3),
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.1,
                        child: IconButton(
                          icon: Image.asset("assets/title_screen/return.png"),
                          onPressed: () {
                            playSound();
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const SelectPage();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final Animatable<Offset> tween = Tween(
                                          begin: const Offset(-1.0, 0.0),
                                          end: Offset.zero)
                                      .chain(
                                          CurveTween(curve: Curves.easeInOut));
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
                  ),
                "riddle" => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: screenWidth * 0.7),
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.1,
                        child: IconButton(
                          icon: Image.asset("assets/title_screen/return.png"),
                          onPressed: () {
                            playSound();
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const SelectPage();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final Animatable<Offset> tween = Tween(
                                          begin: const Offset(-1.0, 0.0),
                                          end: Offset.zero)
                                      .chain(
                                          CurveTween(curve: Curves.easeInOut));
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
                  ),
                _ => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        alignment: Alignment.center,
                        width: screenWidth * 0.4,
                        child: IconButton(
                          icon: Image.asset(
                            "assets/select_screen/ranking_button.png",
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            playSound();
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.3),
                      Container(
                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.1,
                        child: IconButton(
                          icon: Image.asset("assets/title_screen/return.png"),
                          onPressed: () {
                            playSound();
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const SelectPage();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final Animatable<Offset> tween = Tween(
                                          begin: const Offset(-1.0, 0.0),
                                          end: Offset.zero)
                                      .chain(
                                          CurveTween(curve: Curves.easeInOut));
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
              }
            ],
          ),
        ),
      ),
    );
  }
}

// 未実装ダイアログを表示
class AlertDialogSample extends StatelessWidget {
  const AlertDialogSample({super.key});

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
