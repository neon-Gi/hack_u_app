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

/// Room型
class Room extends $pb.GeneratedMessage {
  factory Room({
    $core.String? hostname,
    $core.String? status,
    $core.Iterable<$core.String>? players,
  }) {
    final $result = create();
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
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..pPS(3, _omitFieldNames ? '' : 'players')
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
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get players => $_getList(2);
}

class Game extends $pb.GeneratedMessage {
  factory Game({
    $core.String? hostname,
    $core.String? status,
    $core.Iterable<$core.String>? players,
    $core.String? title,
    $core.String? hostAction,
    $core.String? playerAction,
    $core.int? timer,
    $core.int? hostPoint,
    $core.int? playerPoint,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (status != null) {
      $result.status = status;
    }
    if (players != null) {
      $result.players.addAll(players);
    }
    if (title != null) {
      $result.title = title;
    }
    if (hostAction != null) {
      $result.hostAction = hostAction;
    }
    if (playerAction != null) {
      $result.playerAction = playerAction;
    }
    if (timer != null) {
      $result.timer = timer;
    }
    if (hostPoint != null) {
      $result.hostPoint = hostPoint;
    }
    if (playerPoint != null) {
      $result.playerPoint = playerPoint;
    }
    return $result;
  }
  Game._() : super();
  factory Game.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Game.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Game', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..pPS(3, _omitFieldNames ? '' : 'players')
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aOS(5, _omitFieldNames ? '' : 'hostAction')
    ..aOS(6, _omitFieldNames ? '' : 'playerAction')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'timer', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'hostPoint', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'playerPoint', $pb.PbFieldType.O3)
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
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get players => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get hostAction => $_getSZ(4);
  @$pb.TagNumber(5)
  set hostAction($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHostAction() => $_has(4);
  @$pb.TagNumber(5)
  void clearHostAction() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get playerAction => $_getSZ(5);
  @$pb.TagNumber(6)
  set playerAction($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPlayerAction() => $_has(5);
  @$pb.TagNumber(6)
  void clearPlayerAction() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get timer => $_getIZ(6);
  @$pb.TagNumber(7)
  set timer($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTimer() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimer() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get hostPoint => $_getIZ(7);
  @$pb.TagNumber(8)
  set hostPoint($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHostPoint() => $_has(7);
  @$pb.TagNumber(8)
  void clearHostPoint() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get playerPoint => $_getIZ(8);
  @$pb.TagNumber(9)
  set playerPoint($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPlayerPoint() => $_has(8);
  @$pb.TagNumber(9)
  void clearPlayerPoint() => clearField(9);
}

/// ルーム作成
class createRoomRequest extends $pb.GeneratedMessage {
  factory createRoomRequest({
    $core.String? hostname,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    return $result;
  }
  createRoomRequest._() : super();
  factory createRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory createRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'createRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  createRoomRequest clone() => createRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  createRoomRequest copyWith(void Function(createRoomRequest) updates) => super.copyWith((message) => updates(message as createRoomRequest)) as createRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static createRoomRequest create() => createRoomRequest._();
  createRoomRequest createEmptyInstance() => create();
  static $pb.PbList<createRoomRequest> createRepeated() => $pb.PbList<createRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static createRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<createRoomRequest>(create);
  static createRoomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);
}

class createRoomResponse extends $pb.GeneratedMessage {
  factory createRoomResponse({
    Room? room,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  createRoomResponse._() : super();
  factory createRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory createRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'createRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Room>(1, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  createRoomResponse clone() => createRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  createRoomResponse copyWith(void Function(createRoomResponse) updates) => super.copyWith((message) => updates(message as createRoomResponse)) as createRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static createRoomResponse create() => createRoomResponse._();
  createRoomResponse createEmptyInstance() => create();
  static $pb.PbList<createRoomResponse> createRepeated() => $pb.PbList<createRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static createRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<createRoomResponse>(create);
  static createRoomResponse? _defaultInstance;

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

/// ルーム参加
class joinRoomRequest extends $pb.GeneratedMessage {
  factory joinRoomRequest({
    $core.String? hostname,
    $core.String? currentname,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (currentname != null) {
      $result.currentname = currentname;
    }
    return $result;
  }
  joinRoomRequest._() : super();
  factory joinRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory joinRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'joinRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'currentname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  joinRoomRequest clone() => joinRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  joinRoomRequest copyWith(void Function(joinRoomRequest) updates) => super.copyWith((message) => updates(message as joinRoomRequest)) as joinRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static joinRoomRequest create() => joinRoomRequest._();
  joinRoomRequest createEmptyInstance() => create();
  static $pb.PbList<joinRoomRequest> createRepeated() => $pb.PbList<joinRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static joinRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<joinRoomRequest>(create);
  static joinRoomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get currentname => $_getSZ(1);
  @$pb.TagNumber(2)
  set currentname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentname() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentname() => clearField(2);
}

class joinRoomResponse extends $pb.GeneratedMessage {
  factory joinRoomResponse({
    Room? room,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  joinRoomResponse._() : super();
  factory joinRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory joinRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'joinRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Room>(1, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  joinRoomResponse clone() => joinRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  joinRoomResponse copyWith(void Function(joinRoomResponse) updates) => super.copyWith((message) => updates(message as joinRoomResponse)) as joinRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static joinRoomResponse create() => joinRoomResponse._();
  joinRoomResponse createEmptyInstance() => create();
  static $pb.PbList<joinRoomResponse> createRepeated() => $pb.PbList<joinRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static joinRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<joinRoomResponse>(create);
  static joinRoomResponse? _defaultInstance;

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

/// ルーム情報更新受け取り
class updateRoomRequest extends $pb.GeneratedMessage {
  factory updateRoomRequest({
    $core.String? hostname,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    return $result;
  }
  updateRoomRequest._() : super();
  factory updateRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory updateRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'updateRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  updateRoomRequest clone() => updateRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  updateRoomRequest copyWith(void Function(updateRoomRequest) updates) => super.copyWith((message) => updates(message as updateRoomRequest)) as updateRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static updateRoomRequest create() => updateRoomRequest._();
  updateRoomRequest createEmptyInstance() => create();
  static $pb.PbList<updateRoomRequest> createRepeated() => $pb.PbList<updateRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static updateRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<updateRoomRequest>(create);
  static updateRoomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);
}

class updateRoomResponse extends $pb.GeneratedMessage {
  factory updateRoomResponse({
    Room? room,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    return $result;
  }
  updateRoomResponse._() : super();
  factory updateRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory updateRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'updateRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Room>(1, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  updateRoomResponse clone() => updateRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  updateRoomResponse copyWith(void Function(updateRoomResponse) updates) => super.copyWith((message) => updates(message as updateRoomResponse)) as updateRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static updateRoomResponse create() => updateRoomResponse._();
  updateRoomResponse createEmptyInstance() => create();
  static $pb.PbList<updateRoomResponse> createRepeated() => $pb.PbList<updateRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static updateRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<updateRoomResponse>(create);
  static updateRoomResponse? _defaultInstance;

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
class exitRoomRequest extends $pb.GeneratedMessage {
  factory exitRoomRequest({
    $core.String? hostname,
    $core.String? currentname,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (currentname != null) {
      $result.currentname = currentname;
    }
    return $result;
  }
  exitRoomRequest._() : super();
  factory exitRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory exitRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'exitRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'currentname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  exitRoomRequest clone() => exitRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  exitRoomRequest copyWith(void Function(exitRoomRequest) updates) => super.copyWith((message) => updates(message as exitRoomRequest)) as exitRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static exitRoomRequest create() => exitRoomRequest._();
  exitRoomRequest createEmptyInstance() => create();
  static $pb.PbList<exitRoomRequest> createRepeated() => $pb.PbList<exitRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static exitRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<exitRoomRequest>(create);
  static exitRoomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get currentname => $_getSZ(1);
  @$pb.TagNumber(2)
  set currentname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentname() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentname() => clearField(2);
}

class exitRoomResponse extends $pb.GeneratedMessage {
  factory exitRoomResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  exitRoomResponse._() : super();
  factory exitRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory exitRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'exitRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  exitRoomResponse clone() => exitRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  exitRoomResponse copyWith(void Function(exitRoomResponse) updates) => super.copyWith((message) => updates(message as exitRoomResponse)) as exitRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static exitRoomResponse create() => exitRoomResponse._();
  exitRoomResponse createEmptyInstance() => create();
  static $pb.PbList<exitRoomResponse> createRepeated() => $pb.PbList<exitRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static exitRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<exitRoomResponse>(create);
  static exitRoomResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

/// ゲーム開始
class startGameRequest extends $pb.GeneratedMessage {
  factory startGameRequest({
    $core.String? hostname,
    $core.String? currentname,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (currentname != null) {
      $result.currentname = currentname;
    }
    return $result;
  }
  startGameRequest._() : super();
  factory startGameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory startGameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'startGameRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'currentname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  startGameRequest clone() => startGameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  startGameRequest copyWith(void Function(startGameRequest) updates) => super.copyWith((message) => updates(message as startGameRequest)) as startGameRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static startGameRequest create() => startGameRequest._();
  startGameRequest createEmptyInstance() => create();
  static $pb.PbList<startGameRequest> createRepeated() => $pb.PbList<startGameRequest>();
  @$core.pragma('dart2js:noInline')
  static startGameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<startGameRequest>(create);
  static startGameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get currentname => $_getSZ(1);
  @$pb.TagNumber(2)
  set currentname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentname() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentname() => clearField(2);
}

class startGameResponse extends $pb.GeneratedMessage {
  factory startGameResponse({
    Game? game,
  }) {
    final $result = create();
    if (game != null) {
      $result.game = game;
    }
    return $result;
  }
  startGameResponse._() : super();
  factory startGameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory startGameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'startGameResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Game>(1, _omitFieldNames ? '' : 'game', subBuilder: Game.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  startGameResponse clone() => startGameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  startGameResponse copyWith(void Function(startGameResponse) updates) => super.copyWith((message) => updates(message as startGameResponse)) as startGameResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static startGameResponse create() => startGameResponse._();
  startGameResponse createEmptyInstance() => create();
  static $pb.PbList<startGameResponse> createRepeated() => $pb.PbList<startGameResponse>();
  @$core.pragma('dart2js:noInline')
  static startGameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<startGameResponse>(create);
  static startGameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Game get game => $_getN(0);
  @$pb.TagNumber(1)
  set game(Game v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGame() => $_has(0);
  @$pb.TagNumber(1)
  void clearGame() => clearField(1);
  @$pb.TagNumber(1)
  Game ensureGame() => $_ensure(0);
}

/// ゲーム情報更新
class updateGameRequest extends $pb.GeneratedMessage {
  factory updateGameRequest({
    $core.String? hostname,
    $core.String? currentname,
    $core.String? action,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (currentname != null) {
      $result.currentname = currentname;
    }
    if (action != null) {
      $result.action = action;
    }
    return $result;
  }
  updateGameRequest._() : super();
  factory updateGameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory updateGameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'updateGameRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..aOS(2, _omitFieldNames ? '' : 'currentname')
    ..aOS(3, _omitFieldNames ? '' : 'action')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  updateGameRequest clone() => updateGameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  updateGameRequest copyWith(void Function(updateGameRequest) updates) => super.copyWith((message) => updates(message as updateGameRequest)) as updateGameRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static updateGameRequest create() => updateGameRequest._();
  updateGameRequest createEmptyInstance() => create();
  static $pb.PbList<updateGameRequest> createRepeated() => $pb.PbList<updateGameRequest>();
  @$core.pragma('dart2js:noInline')
  static updateGameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<updateGameRequest>(create);
  static updateGameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get currentname => $_getSZ(1);
  @$pb.TagNumber(2)
  set currentname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentname() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get action => $_getSZ(2);
  @$pb.TagNumber(3)
  set action($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearAction() => clearField(3);
}

class updateGameResponse extends $pb.GeneratedMessage {
  factory updateGameResponse({
    Game? game,
  }) {
    final $result = create();
    if (game != null) {
      $result.game = game;
    }
    return $result;
  }
  updateGameResponse._() : super();
  factory updateGameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory updateGameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'updateGameResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Game>(1, _omitFieldNames ? '' : 'game', subBuilder: Game.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  updateGameResponse clone() => updateGameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  updateGameResponse copyWith(void Function(updateGameResponse) updates) => super.copyWith((message) => updates(message as updateGameResponse)) as updateGameResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static updateGameResponse create() => updateGameResponse._();
  updateGameResponse createEmptyInstance() => create();
  static $pb.PbList<updateGameResponse> createRepeated() => $pb.PbList<updateGameResponse>();
  @$core.pragma('dart2js:noInline')
  static updateGameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<updateGameResponse>(create);
  static updateGameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Game get game => $_getN(0);
  @$pb.TagNumber(1)
  set game(Game v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGame() => $_has(0);
  @$pb.TagNumber(1)
  void clearGame() => clearField(1);
  @$pb.TagNumber(1)
  Game ensureGame() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
