import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';
import 'grpcService.dart';
import 'generated/multiplayer.pb.dart';

class roomView extends StatefulWidget {
  roomView(this.mode, this.name, this.host, {Key? key}) : super(key: key);
  String mode;
  String name;
  String host;
  @override
  _roomViewState createState() => _roomViewState();
}

class _roomViewState extends State<roomView> {
  final GrpcClient grpcClient = GrpcClient();
  Room currentRoom = Room();
  String _hostname = "";
  String _member = "募集中";
  Timer? _time;

  @override
  void initState() {
    super.initState();
    if (widget.mode == "Create") {
      _hostname = widget.name;
      createRoom();
    } else if (widget.mode == "Join") {
      _member = widget.name;
      if (widget.host == "") return;
      _hostname = widget.host;
      joinRoom();
    }
    _time = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      updateRoom();
    });
  }

  // ルーム作成
  Future<void> createRoom() async {
    if (_hostname == "") return;
    try {
      final room = await grpcClient.createRoom(_hostname);
      setState(() {
        currentRoom = room;
      });
    } catch (e) {
      print('Failed to create room: $e');
    }
  }

  // ルーム情報更新
  Future<void> updateRoom() async {
    try {
      final room = await grpcClient.updateRoom(_hostname);
      setState(() {
        currentRoom = room as Room;
        if (currentRoom.players[1].isEmpty) {
          _member = "募集中";
        } else {
          _member = currentRoom.players[1];
        }
      });
    } catch (e) {
      print('Failed to update room: $e');
    }
  }

  // ルーム参加
  Future<void> joinRoom() async {
    try {
      final room = await grpcClient.joinRoom(_hostname, _member);
      setState(() {
        currentRoom = room;
      });
    } catch (e) {
      print('Failed to join room: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(0),
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
            const SizedBox(height: 70),
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/title_screen/white_name.png",
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        currentRoom.hostname,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/title_screen/white_detail.png"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/title_screen/white_name.png"),
                          Text("${currentRoom.hostname}",
                              style: const TextStyle(fontSize: 24))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/title_screen/white_name.png"),
                          Text("$_member", style: const TextStyle(fontSize: 24))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0),
              child: IconButton(
                onPressed: null,
                icon: Image.asset(
                  "assets/title_screen/start.png",
                  height: 60,
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 240),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const ModePage();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          null;
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
                    "assets/title_screen/return.png",
                    height: 60,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _TextDialog() async {
    final _ = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('見つかりませんでした'),
          content: const Text("検索しましたが見つかりませんでした。"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 入力値を返す
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _ExitDialog() async {
    final _ = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ルーム退出'),
          content: const Text("ホストがルームを終了したので退出しました。"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 入力値を返す
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
