import 'package:flutter/material.dart';
import 'main.dart';
import 'moti.dart';

class SelectPage extends StatefulWidget {
  SelectPage({Key? key}) : super(key: key);
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            width: 320,
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 1, 20, 10),
                width: 130,
                height: 130,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameDetail()));
                  },
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                padding: const EdgeInsets.fromLTRB(20, 1, 20, 10),
                width: 130,
                height: 130,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameDetail()));
                  },
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                padding: const EdgeInsets.fromLTRB(20, 1, 20, 10),
                width: 130,
                height: 130,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameDetail()));
                  },
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                padding: const EdgeInsets.fromLTRB(20, 1, 20, 10),
                width: 130,
                height: 130,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameDetail()));
                  },
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                padding: const EdgeInsets.fromLTRB(20, 1, 20, 10),
                width: 130,
                height: 130,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameDetail()));
                  },
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_white.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_left.png"),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 1, 20, 10),
                width: 130,
                height: 130,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
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
                  icon:
                      Image.asset("assets/select_screen/game_icon_return.png"),
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
                  icon: Image.asset("assets/select_screen/game_icon_right.png"),
                ),
              ),
            ],
          ),
        ],
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
    return Scaffold(
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
              child: Image.asset("assets/select_screen/example_game_title.png"),
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
                    MaterialPageRoute(
                        builder: (context) => MotiGamePage("Select")),
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
