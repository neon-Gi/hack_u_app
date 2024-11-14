import 'package:flutter/material.dart';
import 'main.dart';

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
            image: AssetImage("title_screen/background_gray.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            width: 320,
            height: 20,
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_white.png"),
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
                  icon: Image.asset("select_screen/game_icon_left.png"),
                ),
              ),
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
                            builder: (context) => const ModePage()));
                  },
                  icon: Image.asset("select_screen/game_icon_return.png"),
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
                  icon: Image.asset("select_screen/game_icon_right.png"),
                ),
              ),
            ],
          ),
        ],
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
