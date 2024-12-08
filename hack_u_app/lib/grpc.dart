import 'package:grpc/grpc.dart';
import 'generated/multiplayer.pbgrpc.dart';

class GrpcClient {
  late MultiplayerServiceClient _client;
  late ClientChannel _channel;
  GrpcClient() {
    _channel = ClientChannel(
      "localhost",
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    _client = MultiplayerServiceClient(_channel);
  }

  Future<Room> createRoom(String hostname) async {
    final request = createRoomRequest(hostname: hostname);
    try {
      final response = await _client.createRoom(request);
      print("部屋作成成功");
      return response.room;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Room> joinRoom(String hostname, String currentName) async {
    final request =
        joinRoomRequest(hostname: hostname, currentname: currentName);
    try {
      final response = await _client.joinRoom(request);
      print("部屋入室成功");
      return response.room;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Room> updateRoom(String hostname) async {
    final request = updateRoomRequest(hostname: hostname);
    try {
      final response = await _client.updateRoom(request);
      print("部屋更新成功");
      return response.room;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> exitRoom(String hostname, String currentName) async {
    final request =
        exitRoomRequest(hostname: hostname, currentname: currentName);
    try {
      final response = await _client.exitRoom(request);
      print("部屋退室成功");
      return response.success;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Game> startGame(String hostname, String currentName) async {
    final request =
        startGameRequest(hostname: hostname, currentname: currentName);
    try {
      final response = await _client.startGame(request);
      print("ゲーム開始成功");
      return response.game;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Game> updateGame(
      String hostname, String currentName, String action) async {
    final request = updateGameRequest(
        hostname: hostname, currentname: currentName, action: action);
    try {
      final response = await _client.updateGame(request);
      print("ゲーム更新成功");
      return response.game;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
