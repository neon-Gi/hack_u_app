//
//  Generated code. Do not modify.
//  source: ranking.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SetPlayernameRequest extends $pb.GeneratedMessage {
  factory SetPlayernameRequest({
    $core.String? playerName,
  }) {
    final $result = create();
    if (playerName != null) {
      $result.playerName = playerName;
    }
    return $result;
  }
  SetPlayernameRequest._() : super();
  factory SetPlayernameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetPlayernameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetPlayernameRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerName', protoName: 'playerName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetPlayernameRequest clone() => SetPlayernameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetPlayernameRequest copyWith(void Function(SetPlayernameRequest) updates) => super.copyWith((message) => updates(message as SetPlayernameRequest)) as SetPlayernameRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPlayernameRequest create() => SetPlayernameRequest._();
  SetPlayernameRequest createEmptyInstance() => create();
  static $pb.PbList<SetPlayernameRequest> createRepeated() => $pb.PbList<SetPlayernameRequest>();
  @$core.pragma('dart2js:noInline')
  static SetPlayernameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetPlayernameRequest>(create);
  static SetPlayernameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerName => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerName() => clearField(1);
}

class SetPlayernameResponse extends $pb.GeneratedMessage {
  factory SetPlayernameResponse({
    $core.int? playerId,
  }) {
    final $result = create();
    if (playerId != null) {
      $result.playerId = playerId;
    }
    return $result;
  }
  SetPlayernameResponse._() : super();
  factory SetPlayernameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetPlayernameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetPlayernameResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'playerId', $pb.PbFieldType.O3, protoName: 'playerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetPlayernameResponse clone() => SetPlayernameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetPlayernameResponse copyWith(void Function(SetPlayernameResponse) updates) => super.copyWith((message) => updates(message as SetPlayernameResponse)) as SetPlayernameResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPlayernameResponse create() => SetPlayernameResponse._();
  SetPlayernameResponse createEmptyInstance() => create();
  static $pb.PbList<SetPlayernameResponse> createRepeated() => $pb.PbList<SetPlayernameResponse>();
  @$core.pragma('dart2js:noInline')
  static SetPlayernameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetPlayernameResponse>(create);
  static SetPlayernameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playerId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playerId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerId() => clearField(1);
}

class LeaderboardRequest extends $pb.GeneratedMessage {
  factory LeaderboardRequest({
    $core.int? gameId,
  }) {
    final $result = create();
    if (gameId != null) {
      $result.gameId = gameId;
    }
    return $result;
  }
  LeaderboardRequest._() : super();
  factory LeaderboardRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaderboardRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaderboardRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'gameId', $pb.PbFieldType.O3, protoName: 'gameId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaderboardRequest clone() => LeaderboardRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaderboardRequest copyWith(void Function(LeaderboardRequest) updates) => super.copyWith((message) => updates(message as LeaderboardRequest)) as LeaderboardRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaderboardRequest create() => LeaderboardRequest._();
  LeaderboardRequest createEmptyInstance() => create();
  static $pb.PbList<LeaderboardRequest> createRepeated() => $pb.PbList<LeaderboardRequest>();
  @$core.pragma('dart2js:noInline')
  static LeaderboardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaderboardRequest>(create);
  static LeaderboardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gameId => $_getIZ(0);
  @$pb.TagNumber(1)
  set gameId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => clearField(1);
}

class LeaderboardResponse extends $pb.GeneratedMessage {
  factory LeaderboardResponse({
    $core.Iterable<PlayerScore>? scores,
  }) {
    final $result = create();
    if (scores != null) {
      $result.scores.addAll(scores);
    }
    return $result;
  }
  LeaderboardResponse._() : super();
  factory LeaderboardResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaderboardResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaderboardResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..pc<PlayerScore>(1, _omitFieldNames ? '' : 'scores', $pb.PbFieldType.PM, subBuilder: PlayerScore.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaderboardResponse clone() => LeaderboardResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaderboardResponse copyWith(void Function(LeaderboardResponse) updates) => super.copyWith((message) => updates(message as LeaderboardResponse)) as LeaderboardResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaderboardResponse create() => LeaderboardResponse._();
  LeaderboardResponse createEmptyInstance() => create();
  static $pb.PbList<LeaderboardResponse> createRepeated() => $pb.PbList<LeaderboardResponse>();
  @$core.pragma('dart2js:noInline')
  static LeaderboardResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaderboardResponse>(create);
  static LeaderboardResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PlayerScore> get scores => $_getList(0);
}

class PlayerScore extends $pb.GeneratedMessage {
  factory PlayerScore({
    $core.String? playerName,
    $core.int? score,
  }) {
    final $result = create();
    if (playerName != null) {
      $result.playerName = playerName;
    }
    if (score != null) {
      $result.score = score;
    }
    return $result;
  }
  PlayerScore._() : super();
  factory PlayerScore.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerScore.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlayerScore', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'playerName', protoName: 'playerName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'score', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayerScore clone() => PlayerScore()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayerScore copyWith(void Function(PlayerScore) updates) => super.copyWith((message) => updates(message as PlayerScore)) as PlayerScore;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerScore create() => PlayerScore._();
  PlayerScore createEmptyInstance() => create();
  static $pb.PbList<PlayerScore> createRepeated() => $pb.PbList<PlayerScore>();
  @$core.pragma('dart2js:noInline')
  static PlayerScore getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerScore>(create);
  static PlayerScore? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerName => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);
}

class SubmitScoreRequest extends $pb.GeneratedMessage {
  factory SubmitScoreRequest({
    $core.int? gameId,
    $core.String? playerName,
    $core.int? score,
  }) {
    final $result = create();
    if (gameId != null) {
      $result.gameId = gameId;
    }
    if (playerName != null) {
      $result.playerName = playerName;
    }
    if (score != null) {
      $result.score = score;
    }
    return $result;
  }
  SubmitScoreRequest._() : super();
  factory SubmitScoreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitScoreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubmitScoreRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'gameId', $pb.PbFieldType.O3, protoName: 'gameId')
    ..aOS(2, _omitFieldNames ? '' : 'playerName', protoName: 'playerName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'score', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitScoreRequest clone() => SubmitScoreRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitScoreRequest copyWith(void Function(SubmitScoreRequest) updates) => super.copyWith((message) => updates(message as SubmitScoreRequest)) as SubmitScoreRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitScoreRequest create() => SubmitScoreRequest._();
  SubmitScoreRequest createEmptyInstance() => create();
  static $pb.PbList<SubmitScoreRequest> createRepeated() => $pb.PbList<SubmitScoreRequest>();
  @$core.pragma('dart2js:noInline')
  static SubmitScoreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitScoreRequest>(create);
  static SubmitScoreRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gameId => $_getIZ(0);
  @$pb.TagNumber(1)
  set gameId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playerName => $_getSZ(1);
  @$pb.TagNumber(2)
  set playerName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);
}

class SubmitScoreResponse extends $pb.GeneratedMessage {
  factory SubmitScoreResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  SubmitScoreResponse._() : super();
  factory SubmitScoreResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitScoreResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubmitScoreResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitScoreResponse clone() => SubmitScoreResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitScoreResponse copyWith(void Function(SubmitScoreResponse) updates) => super.copyWith((message) => updates(message as SubmitScoreResponse)) as SubmitScoreResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitScoreResponse create() => SubmitScoreResponse._();
  SubmitScoreResponse createEmptyInstance() => create();
  static $pb.PbList<SubmitScoreResponse> createRepeated() => $pb.PbList<SubmitScoreResponse>();
  @$core.pragma('dart2js:noInline')
  static SubmitScoreResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitScoreResponse>(create);
  static SubmitScoreResponse? _defaultInstance;

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
