import 'package:grpc/grpc.dart';
import 'generated/ranking.pbgrpc.dart'; // 自動生成されたgRPCコード

class grpcClient {
  late RankingServiceClient stub;
  late ClientChannel channel;
  grpcClient() {
    channel = ClientChannel(
      '172.24.15.238',
      port: 50051,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry:
            CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );
    stub = RankingServiceClient(channel);
  }

  // プレイヤー登録
  Future<int> setPlayername(String playername) async {
    final request = SetPlayernameRequest(playerName: playername);
    try {
      final response = await stub.setPlayername(request);
      return response.playerId;
    } on GrpcError catch (e) {
      print('gRPC Error: ${e.message}');
      rethrow;
    } finally {
      await channel.shutdown();
    }
  }

  // ランキング取得
  Future<List> getRanking(int game) async {
    final request = LeaderboardRequest(gameId: game);
    try {
      final response = await stub.getLeaderboard(request);
      print(response.scores);
      return response.scores
          .map((score) => [score.playerName, score.score])
          .toList();
    } on GrpcError catch (e) {
      print('gRPC Error: ${e.message}');
      rethrow;
    } finally {
      await channel.shutdown();
    }
  }

  // ランキング登録
  Future<bool> SubmitScore(int game, String playername, int score) async {
    final request =
        SubmitScoreRequest(gameId: game, playerName: playername, score: score);
    try {
      final response = await stub.submitScore(request);
      return response.success;
    } on GrpcError catch (e) {
      print('gRPC Error: ${e.message}');
      rethrow;
    } finally {
      await channel.shutdown();
    }
  }
}
