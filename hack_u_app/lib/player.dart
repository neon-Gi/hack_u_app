import 'package:shared_preferences/shared_preferences.dart';
import 'grpc.dart';

class PlayerManager {
  // プレイヤー情報をDBに登録し、こちらにも登録する
  Future<bool> savePlayer(String playerName) async {
    final prefs = await SharedPreferences.getInstance();
    if (playerName == "") {
      await prefs.remove("player");
      return false;
    }
    prefs.setString("player", playerName);
    final playerID = await setPlayerDB(playerName);
    if (playerID == -1) {
      await prefs.remove("player");
      return false;
    }
    return true;
  }

  // DBにユーザ登録
  Future<int> setPlayerDB(String playerName) async {
    final client = grpcClient();
    try {
      final response = await client.setPlayername(playerName);
      return response;
    } catch (e) {
      return -1;
    }
  }

  //  ランキング表示
  Future<List> getRankings(int gameID) async {
    final client = grpcClient();
    final response = await client.getRanking(gameID);
    return response;
  }
}
