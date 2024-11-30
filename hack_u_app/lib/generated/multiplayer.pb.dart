//
//  Generated code. Do not modify.
//  source: multiplayer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 部屋関連のメッセージ
class Room extends $pb.GeneratedMessage {
  factory Room({
    $core.String? serverID,
    $core.String? hostname,
    $core.String? status,
    $core.Iterable<$core.String>? players,
  }) {
    final $result = create();
    if (serverID != null) {
      $result.serverID = serverID;
    }
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (status != null) {
      $result.status = status;
    }
    if (players != null) {
      $result.players.addAll(players);
    }
    return $result;
  }
  Room._() : super();
  factory Room.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Room.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Room', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverID', protoName: 'serverID')
    ..aOS(2, _omitFieldNames ? '' : 'hostname')
    ..aOS(3, _omitFieldNames ? '' : 'status')
    ..pPS(4, _omitFieldNames ? '' : 'players')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Room clone() => Room()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Room copyWith(void Function(Room) updates) => super.copyWith((message) => updates(message as Room)) as Room;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Room create() => Room._();
  Room createEmptyInstance() => create();
  static $pb.PbList<Room> createRepeated() => $pb.PbList<Room>();
  @$core.pragma('dart2js:noInline')
  static Room getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Room>(create);
  static Room? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverID => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServerID() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hostname => $_getSZ(1);
  @$pb.TagNumber(2)
  set hostname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHostname() => $_has(1);
  @$pb.TagNumber(2)
  void clearHostname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get players => $_getList(3);
}

/// ゲーム関連のメッセージ
class Game extends $pb.GeneratedMessage {
  factory Game({
    $core.String? hostname,
    $core.String? title,
    $core.String? gameStatus,
    $core.int? remainingTime,
    $core.String? playerAction,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (title != null) {
      $result.title = title;
    }
    if (gameStatus != null) {
      $result.gameStatus = gameStatus;
    }
    if (remainingTime != null) {
      $result.remainingTime = remainingTime;
    }
    if (playerAction != null) {
      $result.playerAction = playerAction;
    }
    return $result;
  }
  Game._() : super();
  factory Game.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Game.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Game', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'gameStatus')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'remainingTime', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'playerAction')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Game clone() => Game()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Game copyWith(void Function(Game) updates) => super.copyWith((message) => updates(message as Game)) as Game;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Game create() => Game._();
  Game createEmptyInstance() => create();
  static $pb.PbList<Game> createRepeated() => $pb.PbList<Game>();
  @$core.pragma('dart2js:noInline')
  static Game getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Game>(create);
  static Game? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get gameStatus => $_getSZ(2);
  @$pb.TagNumber(3)
  set gameStatus($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGameStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get remainingTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set remainingTime($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRemainingTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemainingTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get playerAction => $_getSZ(4);
  @$pb.TagNumber(5)
  set playerAction($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPlayerAction() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlayerAction() => clearField(5);
}

/// ルーム作成リクエスト
class CreateRoomRequest extends $pb.GeneratedMessage {
  factory CreateRoomRequest({
    $core.String? hostname,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    return $result;
  }
  CreateRoomRequest._() : super();
  factory CreateRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRoomRequest clone() => CreateRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRoomRequest copyWith(void Function(CreateRoomRequest) updates) => super.copyWith((message) => updates(message as CreateRoomRequest)) as CreateRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoomRequest create() => CreateRoomRequest._();
  CreateRoomRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRoomRequest> createRepeated() => $pb.PbList<CreateRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRoomRequest>(create);
  static CreateRoomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);
}

/// ルーム作成完了
class CreateRoomResponse extends $pb.GeneratedMessage {
  factory CreateRoomResponse({
    Room? room,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  CreateRoomResponse._() : super();
  factory CreateRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Room>(1, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRoomResponse clone() => CreateRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRoomResponse copyWith(void Function(CreateRoomResponse) updates) => super.copyWith((message) => updates(message as CreateRoomResponse)) as CreateRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoomResponse create() => CreateRoomResponse._();
  CreateRoomResponse createEmptyInstance() => create();
  static $pb.PbList<CreateRoomResponse> createRepeated() => $pb.PbList<CreateRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRoomResponse>(create);
  static CreateRoomResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Room get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(Room v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  Room ensureRoom() => $_ensure(0);
}

/// ルーム更新データリクエスト(クライアントから自動でリクエスト、ルーム状態がゲーム中ならStartGameRequestを送る)
class UpdateRequest extends $pb.GeneratedMessage {
  factory UpdateRequest({
    $core.String? hostname,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    return $result;
  }
  UpdateRequest._() : super();
  factory UpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateRequest clone() => UpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateRequest copyWith(void Function(UpdateRequest) updates) => super.copyWith((message) => updates(message as UpdateRequest)) as UpdateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRequest create() => UpdateRequest._();
  UpdateRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateRequest> createRepeated() => $pb.PbList<UpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateRequest>(create);
  static UpdateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);
}

/// ルーム更新データ取得
class UpdateResponse extends $pb.GeneratedMessage {
  factory UpdateResponse({
    Room? room,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  UpdateResponse._() : super();
  factory UpdateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Room>(1, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateResponse clone() => UpdateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateResponse copyWith(void Function(UpdateResponse) updates) => super.copyWith((message) => updates(message as UpdateResponse)) as UpdateResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateResponse create() => UpdateResponse._();
  UpdateResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateResponse> createRepeated() => $pb.PbList<UpdateResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateResponse>(create);
  static UpdateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Room get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(Room v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  Room ensureRoom() => $_ensure(0);
}

/// ルーム加入
class JoinRoomRequest extends $pb.GeneratedMessage {
  factory JoinRoomRequest({
    $core.String? hostname,
    $core.String? playername,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (playername != null) {
      $result.playername = playername;
    }
    return $result;
  }
  JoinRoomRequest._() : super();
  factory JoinRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'playername')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinRoomRequest clone() => JoinRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinRoomRequest copyWith(void Function(JoinRoomRequest) updates) => super.copyWith((message) => updates(message as JoinRoomRequest)) as JoinRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinRoomRequest create() => JoinRoomRequest._();
  JoinRoomRequest createEmptyInstance() => create();
  static $pb.PbList<JoinRoomRequest> createRepeated() => $pb.PbList<JoinRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static JoinRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinRoomRequest>(create);
  static JoinRoomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playername => $_getSZ(1);
  @$pb.TagNumber(2)
  set playername($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayername() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayername() => clearField(2);
}

/// ルーム加入完了
class JoinRoomResponse extends $pb.GeneratedMessage {
  factory JoinRoomResponse({
    Room? room,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  JoinRoomResponse._() : super();
  factory JoinRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Room>(1, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinRoomResponse clone() => JoinRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinRoomResponse copyWith(void Function(JoinRoomResponse) updates) => super.copyWith((message) => updates(message as JoinRoomResponse)) as JoinRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinRoomResponse create() => JoinRoomResponse._();
  JoinRoomResponse createEmptyInstance() => create();
  static $pb.PbList<JoinRoomResponse> createRepeated() => $pb.PbList<JoinRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static JoinRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinRoomResponse>(create);
  static JoinRoomResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Room get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(Room v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  Room ensureRoom() => $_ensure(0);
}

/// ルーム退出
class ExitRoomRequest extends $pb.GeneratedMessage {
  factory ExitRoomRequest({
    $core.String? hostname,
    $core.String? playername,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (playername != null) {
      $result.playername = playername;
    }
    return $result;
  }
  ExitRoomRequest._() : super();
  factory ExitRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExitRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExitRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'playername')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExitRoomRequest clone() => ExitRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExitRoomRequest copyWith(void Function(ExitRoomRequest) updates) => super.copyWith((message) => updates(message as ExitRoomRequest)) as ExitRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExitRoomRequest create() => ExitRoomRequest._();
  ExitRoomRequest createEmptyInstance() => create();
  static $pb.PbList<ExitRoomRequest> createRepeated() => $pb.PbList<ExitRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static ExitRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExitRoomRequest>(create);
  static ExitRoomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playername => $_getSZ(1);
  @$pb.TagNumber(2)
  set playername($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayername() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayername() => clearField(2);
}

/// ルーム退出完了
class ExitRoomResponse extends $pb.GeneratedMessage {
  factory ExitRoomResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  ExitRoomResponse._() : super();
  factory ExitRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExitRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExitRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExitRoomResponse clone() => ExitRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExitRoomResponse copyWith(void Function(ExitRoomResponse) updates) => super.copyWith((message) => updates(message as ExitRoomResponse)) as ExitRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExitRoomResponse create() => ExitRoomResponse._();
  ExitRoomResponse createEmptyInstance() => create();
  static $pb.PbList<ExitRoomResponse> createRepeated() => $pb.PbList<ExitRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static ExitRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExitRoomResponse>(create);
  static ExitRoomResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

/// ゲーム開始リクエスト(ホスト名とプレイヤー名が一緒ならルーム状態をゲーム中にする)
class StartGameRequest extends $pb.GeneratedMessage {
  factory StartGameRequest({
    $core.String? hostname,
    $core.String? playername,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (playername != null) {
      $result.playername = playername;
    }
    return $result;
  }
  StartGameRequest._() : super();
  factory StartGameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartGameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartGameRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'playername')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartGameRequest clone() => StartGameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartGameRequest copyWith(void Function(StartGameRequest) updates) => super.copyWith((message) => updates(message as StartGameRequest)) as StartGameRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartGameRequest create() => StartGameRequest._();
  StartGameRequest createEmptyInstance() => create();
  static $pb.PbList<StartGameRequest> createRepeated() => $pb.PbList<StartGameRequest>();
  @$core.pragma('dart2js:noInline')
  static StartGameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartGameRequest>(create);
  static StartGameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playername => $_getSZ(1);
  @$pb.TagNumber(2)
  set playername($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayername() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayername() => clearField(2);
}

/// ゲーム開始処理(ゲームはサーバから自動で決定)
class StartGameResponse extends $pb.GeneratedMessage {
  factory StartGameResponse({
    Room? room,
    Game? game,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (game != null) {
      $result.game = game;
    }
    return $result;
  }
  StartGameResponse._() : super();
  factory StartGameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartGameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartGameResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Room>(1, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..aOM<Game>(2, _omitFieldNames ? '' : 'game', subBuilder: Game.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartGameResponse clone() => StartGameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartGameResponse copyWith(void Function(StartGameResponse) updates) => super.copyWith((message) => updates(message as StartGameResponse)) as StartGameResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartGameResponse create() => StartGameResponse._();
  StartGameResponse createEmptyInstance() => create();
  static $pb.PbList<StartGameResponse> createRepeated() => $pb.PbList<StartGameResponse>();
  @$core.pragma('dart2js:noInline')
  static StartGameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartGameResponse>(create);
  static StartGameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Room get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(Room v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  Room ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  Game get game => $_getN(1);
  @$pb.TagNumber(2)
  set game(Game v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGame() => $_has(1);
  @$pb.TagNumber(2)
  void clearGame() => clearField(2);
  @$pb.TagNumber(2)
  Game ensureGame() => $_ensure(1);
}

/// ゲーム情報更新
class UpdateGameRequest extends $pb.GeneratedMessage {
  factory UpdateGameRequest({
    $core.String? hostname,
    $core.String? playername,
    $core.bool? action,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (playername != null) {
      $result.playername = playername;
    }
    if (action != null) {
      $result.action = action;
    }
    return $result;
  }
  UpdateGameRequest._() : super();
  factory UpdateGameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateGameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGameRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'playername')
    ..aOB(3, _omitFieldNames ? '' : 'action')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateGameRequest clone() => UpdateGameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateGameRequest copyWith(void Function(UpdateGameRequest) updates) => super.copyWith((message) => updates(message as UpdateGameRequest)) as UpdateGameRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGameRequest create() => UpdateGameRequest._();
  UpdateGameRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateGameRequest> createRepeated() => $pb.PbList<UpdateGameRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateGameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGameRequest>(create);
  static UpdateGameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playername => $_getSZ(1);
  @$pb.TagNumber(2)
  set playername($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayername() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayername() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get action => $_getBF(2);
  @$pb.TagNumber(3)
  set action($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearAction() => clearField(3);
}

/// ゲーム情報更新結果
class UpdateGameResponse extends $pb.GeneratedMessage {
  factory UpdateGameResponse({
    Room? room,
    Game? game,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (game != null) {
      $result.game = game;
    }
    return $result;
  }
  UpdateGameResponse._() : super();
  factory UpdateGameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateGameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGameResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Room>(1, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..aOM<Game>(2, _omitFieldNames ? '' : 'game', subBuilder: Game.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateGameResponse clone() => UpdateGameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateGameResponse copyWith(void Function(UpdateGameResponse) updates) => super.copyWith((message) => updates(message as UpdateGameResponse)) as UpdateGameResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGameResponse create() => UpdateGameResponse._();
  UpdateGameResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateGameResponse> createRepeated() => $pb.PbList<UpdateGameResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateGameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGameResponse>(create);
  static UpdateGameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Room get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(Room v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  Room ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  Game get game => $_getN(1);
  @$pb.TagNumber(2)
  set game(Game v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGame() => $_has(1);
  @$pb.TagNumber(2)
  void clearGame() => clearField(2);
  @$pb.TagNumber(2)
  Game ensureGame() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
