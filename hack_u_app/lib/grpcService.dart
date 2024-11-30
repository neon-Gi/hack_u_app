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

  // ルーム作成
  Future<Room> createRoom(String hostname) async {
    final request = CreateRoomRequest()..hostname = hostname;
    try {
      final response = await _client.createRoom(request);
      print("Success Create: $response");
      return response.room;
    } catch (e) {
      print('Caught error: $e');
      rethrow;
    }
  }

  // ルーム情報更新
  Future<Room?> updateRoom(String hostname) async {
    final request = UpdateRequest()..hostname = hostname;
    try {
      final response = await _client.updateRoom(request);
      return response.room;
    } catch (e) {
      print('Caught error: $e');
      rethrow;
    }
  }

  // ルーム参加
  Future<Room> joinRoom(String hostname, String playername) async {
    final request = JoinRoomRequest()
      ..hostname = hostname
      ..playername = playername;
    try {
      final response = await _client.joinRoom(request);
      return response.room;
    } catch (e) {
      print('Caught error: $e');
      rethrow;
    }
  }

  // ルーム退出
  Future<bool> exitRoom(String hostname, String playername) async {
    final request = ExitRoomRequest()
      ..hostname = hostname
      ..playername = playername;
    try {
      final response = await _client.exitRoom(request);
      return response.success;
    } catch (e) {
      print('Caught error: $e');
      rethrow;
    }
  }
}
