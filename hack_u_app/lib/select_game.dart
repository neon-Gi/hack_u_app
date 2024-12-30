import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hack_u_app/player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hagaki.dart';
import 'karuta.dart';
import 'etoq.dart';
import 'main.dart';
import 'moti.dart';

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
                    const MotiGameDetail(), buttonSize),
                _buildGameButton(context, "assets/select_screen/etoq_icon.png",
                    const EtoqGameDetail(), buttonSize),
                _buildGameButton(
                    context,
                    "assets/select_screen/karuta_icon.png",
                    const KarutaGameDetail(),
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
                    const NengajoGameDetail(),
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

// 餅ミニゲームの詳細
class MotiGameDetail extends StatefulWidget {
  const MotiGameDetail({super.key});
  @override
  State<MotiGameDetail> createState() => _MotiGameDetailState();
}

class _MotiGameDetailState extends State<MotiGameDetail> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> _playSound() async {
    // アセットから音声を再生
    await _audioPlayer.play(AssetSource('se/button_tap.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
              Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: screenWidth * 0.6,
                child: Image.asset("assets/select_screen/moti_title.png"),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: screenWidth * 0.7,
                child: Image.asset("assets/select_screen/moti_explain.png"),
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                    height: screenHeight * 0.09,
                    child: IconButton(
                      icon: Image.asset("assets/title_screen/start_first.png"),
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
                      icon: Image.asset("assets/title_screen/start_second.png"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MultiMotiGamePage()),
                        );
                      },
                    ),
                  )
                ],
              ),
              Row(
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
                        _playSound();
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ScoreTablePage(gameID: 1);
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
                        _playSound();
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

// 干支クイズの詳細
class EtoqGameDetail extends StatefulWidget {
  const EtoqGameDetail({super.key});
  @override
  State<EtoqGameDetail> createState() => _EtoqGameDetailState();
}

class _EtoqGameDetailState extends State<EtoqGameDetail> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> _playSound() async {
    // アセットから音声を再生
    await _audioPlayer.play(AssetSource('se/button_tap.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
              Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: screenWidth * 0.6,
                child: Image.asset("assets/select_screen/etoq_title.png"),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: screenWidth * 0.7,
                child: Image.asset("assets/select_screen/etoq_explain.png"),
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                    height: screenHeight * 0.09,
                    child: IconButton(
                      icon: Image.asset("assets/title_screen/start_first.png"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const etoqpage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
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
                        _playSound();
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ScoreTablePage(gameID: 2);
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
                        _playSound();
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

// カルタの詳細
class KarutaGameDetail extends StatefulWidget {
  const KarutaGameDetail({super.key});
  @override
  State<KarutaGameDetail> createState() => _KarutaGameDetailState();
}

class _KarutaGameDetailState extends State<KarutaGameDetail> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> _playSound() async {
    // アセットから音声を再生
    await _audioPlayer.play(AssetSource('se/button_tap.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
              Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: screenWidth * 0.6,
                child: Image.asset("assets/select_screen/karuta_title.png"),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: screenWidth * 0.7,
                child: Image.asset("assets/select_screen/karuta_explain.png"),
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                    height: screenHeight * 0.09,
                    child: IconButton(
                      icon: Image.asset("assets/title_screen/start_first.png"),
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
                      icon: Image.asset("assets/title_screen/start_second.png"),
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
              Row(
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
                        _playSound();
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

// 年賀状の詳細
class NengajoGameDetail extends StatefulWidget {
  const NengajoGameDetail({super.key});
  @override
  State<NengajoGameDetail> createState() => _NengajoGameDetailState();
}

class _NengajoGameDetailState extends State<NengajoGameDetail> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> _playSound() async {
    // アセットから音声を再生
    await _audioPlayer.play(AssetSource('se/button_tap.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
              Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: screenWidth * 0.6,
                child: Image.asset("assets/select_screen/nengajo_title.png"),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: screenWidth * 0.7,
                child: Image.asset("assets/select_screen/nengajo_explain.png"),
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                    height: screenHeight * 0.09,
                    child: IconButton(
                      icon: Image.asset("assets/title_screen/start_first.png"),
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
              Row(
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
                        _playSound();
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ScoreTablePage(gameID: 4);
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
                        _playSound();
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

// ランキングテーブル
class ScoreTablePage extends StatefulWidget {
  ScoreTablePage({super.key, required this.gameID});
  int gameID;

  @override
  State<ScoreTablePage> createState() => _ScoreTablePageState();
}

class _ScoreTablePageState extends State<ScoreTablePage> {
  String pl_id = "";
  String pl_name = "";
  int gameID = 0;
  List<dynamic> rankings = [];
  String first_name = "";
  String second_name = "";
  String third_name = "";
  String forth_name = "";
  String fifth_name = "";
  int first_score = 0;
  int second_score = 0;
  int third_score = 0;
  int forth_score = 0;
  int fifth_score = 0;

  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> _playSound() async {
    // アセットから音声を再生
    await _audioPlayer.play(AssetSource('se/button_tap.mp3'));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTable();
    });
  }

  Future getTable() async {
    // ID・名前登録チェック
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pl_name = prefs.getString("player") ?? "未設定";
    });
    // ID設定
    gameID = widget.gameID;
    // ランキング取得
    try {
      final response = await PlayerManager().getRankings(gameID);
      setState(() {
        rankings = response;
        // 名前
        first_name = rankings[0][0];
        second_name = rankings[1][0];
        third_name = rankings[2][0];
        forth_name = rankings[3][0];
        fifth_name = rankings[4][0];
        // スコア
        first_score = rankings[0][1];
        second_score = rankings[1][1];
        third_score = rankings[2][1];
        forth_score = rankings[3][1];
        fifth_score = rankings[4][1];
      });
    } catch (e) {
      _errorDialog();
    }
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
                    '接続または処理に失敗しました。',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const SelectPage();
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
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/title_screen/background_gray.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/ranking.png",
                  fit: BoxFit.cover,
                  width: 250,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.center,
                child: DataTable(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  columns: const [
                    DataColumn(label: Text("順位")),
                    DataColumn(label: Text("名前")),
                    DataColumn(label: Text("スコア"))
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        const DataCell(Text("1位")),
                        DataCell(Text(first_name)),
                        DataCell(Text("$first_score")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text("2位")),
                        DataCell(Text(second_name)),
                        DataCell(Text("$second_score")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text("3位")),
                        DataCell(Text(third_name)),
                        DataCell(Text("$third_score")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text("4位")),
                        DataCell(Text(forth_name)),
                        DataCell(Text("$forth_score")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text("5位")),
                        DataCell(Text(fifth_name)),
                        DataCell(Text("$fifth_score")),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.center,
                child: IconButton(
                  icon: Image.asset(
                    "assets/title_screen/return.png",
                    width: 100,
                  ),
                  onPressed: () {
                    _playSound();
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const SelectPage();
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
              ),
              Text("名前: $pl_name"),
            ],
          ),
        ),
      ),
    );
  }
}
