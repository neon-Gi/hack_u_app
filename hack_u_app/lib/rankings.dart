import 'package:grpc/grpc.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:hack_u_app/generated/ranking.pbgrpc.dart';

class RankingsClient {
  late final RankingServiceClient client;
  RankingsClient() {
    final channel = ClientChannel(
      '172.24.13.122',
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    client = RankingServiceClient(channel);
  }

  // プレイヤー追加
  Future<InsertPlayerResponse> singup(String name, String password) async {
    final bytes = utf8.encode(password);
    final hashPassword = sha256.convert(bytes);
    final request =
        InsertPlayerRequesr(name: name, password: hashPassword.toString());
    try {
      final response = await client.insertPlayer(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // ログイン
  Future<LoginPlayerResponse> singin(String name, String password) async {
    final bytes = utf8.encode(password);
    final hashPassword = sha256.convert(bytes);
    final request =
        LoginPlayerRequesr(name: name, password: hashPassword.toString());
    try {
      final response = await client.loginPlayer(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // ランキング取得
  Future<GetRankingResponse> getRanking(int gameID) async {
    final request = GetRankingRequest(gameId: gameID);
    try {
      final response = await client.getRanking(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // ランキング登録
  Future<InsertRankigResponse> insertRanking(
      int userID, int gameID, int score) async {
    final request =
        InsertRankingRequest(userId: userID, gameId: gameID, score: score);
    try {
      final response = await client.insertRanking(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

class Player {
  void signup(String name, String password) {
    try {
      final client = RankingsClient();
      final _ = client.singup(name, password);
    } catch (e) {
      rethrow;
    }
  }
}
