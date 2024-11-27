import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:hack_u_app/main.dart';
import '../generated/multiplayer.pbgrpc.dart';

class GrpcService {
  // シングルトンインスタンス
  static final GrpcService _instance = GrpcService._internal();

  // ファクトリーメソッド
  factory GrpcService() => _instance;

  // プライベートコンストラクタ
  GrpcService._internal();

  // gRPCのクライアントとチャンネル
  late MultiplayerServiceClient _client;
  late ClientChannel _channel;
  Timer? timer;

  // 初期化
  Future<void> init({
    int port = 50051,
    bool useSecure = false,
  }) async {
    _channel = ClientChannel(
      'localhost',
      port: port,
      options: ChannelOptions(
        credentials: useSecure
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure(),
      ),
    );
    _client = MultiplayerServiceClient(_channel); // クライアント名を修正
  }

  // Create Room
  Future<CreateRoomResponse> createRoom(String hostname) async {
    final request = CreateRoomRequest()..hostname = hostname;
    final response = await _client.createRoom(request);
    // ログ表示(リクエスト結果も)
    print('CreateRoomResponse $response');
    return response;
  }

  // Update Room Data
  Future<RoomDataResponse> roomData(String hostname) async {
    final request = RoomDataRequest()..hostname = hostname;
    while (true) {
      await Future.delayed(const Duration(seconds: 3));
      try {
        final response = await _client.roomData(request);
        print(response);
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  // Join Room
  Future<JoinRoomResponse> joinRoom(String hostname) async {
    final request = JoinRoomRequest()..hostname = hostname;
    return await _client.joinRoom(request);
  }

  Future<ExitRoomResponse> exitRoom(String hostname, String playername) async {
    final request = ExitRoomRequest()
      ..hostname = hostname
      ..playername = playername;
    return await _client.exitRoom(request);
  }

  // Channel Shutdown
  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}

class roomView extends StatefulWidget {
  roomView(this.mode, this.name, {Key? key}) : super(key: key);
  String mode;
  String name;
  @override
  _roomViewState createState() => _roomViewState();
}

class _roomViewState extends State<roomView> {
  Timer? timer;
  String? _hostname;
  String _member = "募集中";
  final grpcService = GrpcService();
  @override
  void initState() {
    super.initState();
    grpcService.init();
    if (widget.mode == "Create") {
      final _ = grpcService.createRoom(widget.name).then(
            (value) => setState(
              () {
                _hostname = value.hostname;
              },
            ),
          );
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        final update = grpcService.roomData(_hostname!).then(
              (value) => setState(() {
                if (value.room.players[1] != "") {
                  _member = value.room.players[1];
                }
              }),
            );
      });
    }
  }

  void disposeConnect() {
    if (_hostname == widget.name) {
      grpcService.shutdown();
      print("Shut down room");
    } else {
      grpcService.exitRoom(_hostname!, widget.name);
      print("Exit room");
    }
    timer!.cancel();
    timer = null;
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
                        "$_hostname の部屋",
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
                          Text("$_hostname",
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
                          disposeConnect();
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
}
