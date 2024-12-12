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
  SelectPage({Key? key}) : super(key: key);
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MotiGameDetail()));
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EtoqGameDetail()));
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KarutaGameDetail()));
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NengajoGameDetail()));
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSample();
                          });
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSample();
                          });
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GameDetail()));
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSample();
                          });
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSample();
                          });
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GameDetail()));
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSample();
                          });
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSample();
                          });
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GameDetail()));
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSample();
                          });
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSample();
                          });
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_white.png"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSample();
                          });
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_left.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: IconButton(
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
                    icon: Image.asset(
                        "assets/select_screen/game_icon_return.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 1, 20, 10),
                  width: 130,
                  height: 130,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSample();
                          });
                    },
                    icon:
                        Image.asset("assets/select_screen/game_icon_right.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ミニゲームの詳細
class GameDetail extends StatefulWidget {
  const GameDetail({Key? key}) : super(key: key);
  @override
  State<GameDetail> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                width: 320,
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: 250,
                child:
                    Image.asset("assets/select_screen/example_game_title.png"),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: 310,
                child:
                    Image.asset("assets/select_screen/example_game_detail.png"),
              ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MotiGamePage()),
                    );
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

// 餅ミニゲームの詳細
class MotiGameDetail extends StatefulWidget {
  const MotiGameDetail({Key? key}) : super(key: key);
  @override
  State<MotiGameDetail> createState() => _MotiGameDetailState();
}

class _MotiGameDetailState extends State<MotiGameDetail> {
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                width: 320,
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: 250,
                child: Image.asset("assets/select_screen/moti_title.png"),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: 310,
                child: Image.asset("assets/select_screen/moti_explain.png"),
              ),
              const SizedBox(
                width: 320,
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                    height: 80,
                    child: IconButton(
                      icon: Image.asset("assets/title_screen/start_first.png"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MotiGamePage()),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    height: 75,
                    child: IconButton(
                      icon: Image.asset("assets/title_screen/start_second.png"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MultiMotiGamePage()),
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
                    width: 150,
                    child: IconButton(
                      icon: Image.asset(
                        "assets/select_screen/ranking_button.png",
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ScoreTablePage(1);
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
                  const SizedBox(
                    width: 150,
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
  const EtoqGameDetail({Key? key}) : super(key: key);
  @override
  State<EtoqGameDetail> createState() => _EtoqGameDetailState();
}

class _EtoqGameDetailState extends State<EtoqGameDetail> {
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                width: 320,
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: 250,
                child: Image.asset("assets/select_screen/etoq_title.png"),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: 310,
                child: Image.asset("assets/select_screen/etoq_explain.png"),
              ),
              const SizedBox(
                width: 320,
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                height: 80,
                child: IconButton(
                  icon: Image.asset("assets/title_screen/start_first.png"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const etoqpage()),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    alignment: Alignment.center,
                    width: 150,
                    child: IconButton(
                      icon: Image.asset(
                        "assets/select_screen/ranking_button.png",
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ScoreTablePage(1);
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
                  const SizedBox(
                    width: 150,
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
  const KarutaGameDetail({Key? key}) : super(key: key);
  @override
  State<KarutaGameDetail> createState() => _KarutaGameDetailState();
}

class _KarutaGameDetailState extends State<KarutaGameDetail> {
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                width: 320,
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: 250,
                child: Image.asset("assets/select_screen/karuta_title.png"),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: 310,
                child: Image.asset("assets/select_screen/karuta_explain.png"),
              ),
              const SizedBox(
                width: 320,
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                    height: 80,
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
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    height: 75,
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
                    width: 150,
                    child: IconButton(
                      icon: Image.asset(
                        "assets/select_screen/ranking_button.png",
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ScoreTablePage(3);
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
                  const SizedBox(
                    width: 150,
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
  const NengajoGameDetail({Key? key}) : super(key: key);
  @override
  State<NengajoGameDetail> createState() => _NengajoGameDetailState();
}

class _NengajoGameDetailState extends State<NengajoGameDetail> {
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                width: 320,
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 20.0),
                alignment: Alignment.center,
                width: 250,
                child: Image.asset("assets/select_screen/nengajo_title.png"),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: 310,
                child: Image.asset("assets/select_screen/nengajo_explain.png"),
              ),
              const SizedBox(
                width: 320,
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                    height: 80,
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
                  // Container(
                  //   padding: const EdgeInsets.all(0),
                  //   alignment: Alignment.center,
                  //   height: 75,
                  //   child: IconButton(
                  //     icon: Image.asset("assets/title_screen/start_second.png"),
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) =>
                  //                 const MultiKarutaGamePage()),
                  //       );
                  //     },
                  //   ),
                  // )
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
                    width: 150,
                    child: IconButton(
                      icon: Image.asset(
                        "assets/select_screen/ranking_button.png",
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ScoreTablePage(4);
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
                  const SizedBox(
                    width: 150,
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
      title: const Text('実装中'),
      content: const Text('実装中のため表示できません。'),
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
  ScoreTablePage(this.gameID, {Key? key}) : super(key: key);
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
                            return SelectPage();
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
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return SelectPage();
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
