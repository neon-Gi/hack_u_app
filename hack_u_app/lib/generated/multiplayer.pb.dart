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
    $core.Iterable<$core.String>? players,
  }) {
    final $result = create();
    if (serverID != null) {
      $result.serverID = serverID;
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
    ..pPS(2, _omitFieldNames ? '' : 'players')
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
  $core.List<$core.String> get players => $_getList(1);
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
    $core.String? hostname,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (hostname != null) {
      $result.hostname = hostname;
    }
    return $result;
  }
  CreateRoomResponse._() : super();
  factory CreateRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Room>(1, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..aOS(2, _omitFieldNames ? '' : 'hostname')
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

  @$pb.TagNumber(2)
  $core.String get hostname => $_getSZ(1);
  @$pb.TagNumber(2)
  set hostname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHostname() => $_has(1);
  @$pb.TagNumber(2)
  void clearHostname() => clearField(2);
}

/// ルーム更新データリクエスト
class RoomDataRequest extends $pb.GeneratedMessage {
  factory RoomDataRequest({
    $core.String? hostname,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    return $result;
  }
  RoomDataRequest._() : super();
  factory RoomDataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomDataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomDataRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomDataRequest clone() => RoomDataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomDataRequest copyWith(void Function(RoomDataRequest) updates) => super.copyWith((message) => updates(message as RoomDataRequest)) as RoomDataRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomDataRequest create() => RoomDataRequest._();
  RoomDataRequest createEmptyInstance() => create();
  static $pb.PbList<RoomDataRequest> createRepeated() => $pb.PbList<RoomDataRequest>();
  @$core.pragma('dart2js:noInline')
  static RoomDataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomDataRequest>(create);
  static RoomDataRequest? _defaultInstance;

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
class RoomDataResponse extends $pb.GeneratedMessage {
  factory RoomDataResponse({
    Room? room,
    $core.String? hostname,
  }) {
    final $result = create();
    if (room != null) {
      $result.room = room;
    }
    if (hostname != null) {
      $result.hostname = hostname;
    }
    return $result;
  }
  RoomDataResponse._() : super();
  factory RoomDataResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomDataResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RoomDataResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOM<Room>(1, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..aOS(2, _omitFieldNames ? '' : 'hostname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomDataResponse clone() => RoomDataResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomDataResponse copyWith(void Function(RoomDataResponse) updates) => super.copyWith((message) => updates(message as RoomDataResponse)) as RoomDataResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomDataResponse create() => RoomDataResponse._();
  RoomDataResponse createEmptyInstance() => create();
  static $pb.PbList<RoomDataResponse> createRepeated() => $pb.PbList<RoomDataResponse>();
  @$core.pragma('dart2js:noInline')
  static RoomDataResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomDataResponse>(create);
  static RoomDataResponse? _defaultInstance;

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
  $core.String get hostname => $_getSZ(1);
  @$pb.TagNumber(2)
  set hostname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHostname() => $_has(1);
  @$pb.TagNumber(2)
  void clearHostname() => clearField(2);
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
    $core.bool? success,
    Room? room,
    $core.String? hostname,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (room != null) {
      $result.room = room;
    }
    if (hostname != null) {
      $result.hostname = hostname;
    }
    return $result;
  }
  JoinRoomResponse._() : super();
  factory JoinRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JoinRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'multiplayer'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<Room>(2, _omitFieldNames ? '' : 'room', subBuilder: Room.create)
    ..aOS(3, _omitFieldNames ? '' : 'hostname')
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
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  Room get room => $_getN(1);
  @$pb.TagNumber(2)
  set room(Room v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);
  @$pb.TagNumber(2)
  Room ensureRoom() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get hostname => $_getSZ(2);
  @$pb.TagNumber(3)
  set hostname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHostname() => $_has(2);
  @$pb.TagNumber(3)
  void clearHostname() => clearField(3);
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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
