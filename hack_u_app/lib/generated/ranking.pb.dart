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

/// プレイヤー追加
class InsertPlayerRequesr extends $pb.GeneratedMessage {
  factory InsertPlayerRequesr({
    $core.String? name,
    $core.String? password,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  InsertPlayerRequesr._() : super();
  factory InsertPlayerRequesr.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsertPlayerRequesr.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsertPlayerRequesr', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsertPlayerRequesr clone() => InsertPlayerRequesr()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsertPlayerRequesr copyWith(void Function(InsertPlayerRequesr) updates) => super.copyWith((message) => updates(message as InsertPlayerRequesr)) as InsertPlayerRequesr;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsertPlayerRequesr create() => InsertPlayerRequesr._();
  InsertPlayerRequesr createEmptyInstance() => create();
  static $pb.PbList<InsertPlayerRequesr> createRepeated() => $pb.PbList<InsertPlayerRequesr>();
  @$core.pragma('dart2js:noInline')
  static InsertPlayerRequesr getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsertPlayerRequesr>(create);
  static InsertPlayerRequesr? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class InsertPlayerResponse extends $pb.GeneratedMessage {
  factory InsertPlayerResponse({
    $core.bool? success,
    $core.int? userId,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  InsertPlayerResponse._() : super();
  factory InsertPlayerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsertPlayerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsertPlayerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsertPlayerResponse clone() => InsertPlayerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsertPlayerResponse copyWith(void Function(InsertPlayerResponse) updates) => super.copyWith((message) => updates(message as InsertPlayerResponse)) as InsertPlayerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsertPlayerResponse create() => InsertPlayerResponse._();
  InsertPlayerResponse createEmptyInstance() => create();
  static $pb.PbList<InsertPlayerResponse> createRepeated() => $pb.PbList<InsertPlayerResponse>();
  @$core.pragma('dart2js:noInline')
  static InsertPlayerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsertPlayerResponse>(create);
  static InsertPlayerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

/// プレイヤーログイン
class LoginPlayerRequesr extends $pb.GeneratedMessage {
  factory LoginPlayerRequesr({
    $core.String? name,
    $core.String? password,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  LoginPlayerRequesr._() : super();
  factory LoginPlayerRequesr.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginPlayerRequesr.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginPlayerRequesr', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginPlayerRequesr clone() => LoginPlayerRequesr()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginPlayerRequesr copyWith(void Function(LoginPlayerRequesr) updates) => super.copyWith((message) => updates(message as LoginPlayerRequesr)) as LoginPlayerRequesr;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginPlayerRequesr create() => LoginPlayerRequesr._();
  LoginPlayerRequesr createEmptyInstance() => create();
  static $pb.PbList<LoginPlayerRequesr> createRepeated() => $pb.PbList<LoginPlayerRequesr>();
  @$core.pragma('dart2js:noInline')
  static LoginPlayerRequesr getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginPlayerRequesr>(create);
  static LoginPlayerRequesr? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginPlayerResponse extends $pb.GeneratedMessage {
  factory LoginPlayerResponse({
    $core.bool? success,
    $core.int? userId,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  LoginPlayerResponse._() : super();
  factory LoginPlayerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginPlayerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginPlayerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginPlayerResponse clone() => LoginPlayerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginPlayerResponse copyWith(void Function(LoginPlayerResponse) updates) => super.copyWith((message) => updates(message as LoginPlayerResponse)) as LoginPlayerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginPlayerResponse create() => LoginPlayerResponse._();
  LoginPlayerResponse createEmptyInstance() => create();
  static $pb.PbList<LoginPlayerResponse> createRepeated() => $pb.PbList<LoginPlayerResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginPlayerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginPlayerResponse>(create);
  static LoginPlayerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

/// ランキングレコード型
class Record extends $pb.GeneratedMessage {
  factory Record({
    $core.String? userName,
    $core.int? score,
  }) {
    final $result = create();
    if (userName != null) {
      $result.userName = userName;
    }
    if (score != null) {
      $result.score = score;
    }
    return $result;
  }
  Record._() : super();
  factory Record.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Record.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Record', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'score', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Record clone() => Record()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Record copyWith(void Function(Record) updates) => super.copyWith((message) => updates(message as Record)) as Record;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Record create() => Record._();
  Record createEmptyInstance() => create();
  static $pb.PbList<Record> createRepeated() => $pb.PbList<Record>();
  @$core.pragma('dart2js:noInline')
  static Record getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Record>(create);
  static Record? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);
}

/// ランキング取得
class GetRankingRequest extends $pb.GeneratedMessage {
  factory GetRankingRequest({
    $core.int? gameId,
  }) {
    final $result = create();
    if (gameId != null) {
      $result.gameId = gameId;
    }
    return $result;
  }
  GetRankingRequest._() : super();
  factory GetRankingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRankingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRankingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'gameId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRankingRequest clone() => GetRankingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRankingRequest copyWith(void Function(GetRankingRequest) updates) => super.copyWith((message) => updates(message as GetRankingRequest)) as GetRankingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRankingRequest create() => GetRankingRequest._();
  GetRankingRequest createEmptyInstance() => create();
  static $pb.PbList<GetRankingRequest> createRepeated() => $pb.PbList<GetRankingRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRankingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRankingRequest>(create);
  static GetRankingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gameId => $_getIZ(0);
  @$pb.TagNumber(1)
  set gameId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => clearField(1);
}

class GetRankingResponse extends $pb.GeneratedMessage {
  factory GetRankingResponse({
    $core.Iterable<Record>? records,
  }) {
    final $result = create();
    if (records != null) {
      $result.records.addAll(records);
    }
    return $result;
  }
  GetRankingResponse._() : super();
  factory GetRankingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRankingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRankingResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..pc<Record>(1, _omitFieldNames ? '' : 'records', $pb.PbFieldType.PM, subBuilder: Record.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRankingResponse clone() => GetRankingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRankingResponse copyWith(void Function(GetRankingResponse) updates) => super.copyWith((message) => updates(message as GetRankingResponse)) as GetRankingResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRankingResponse create() => GetRankingResponse._();
  GetRankingResponse createEmptyInstance() => create();
  static $pb.PbList<GetRankingResponse> createRepeated() => $pb.PbList<GetRankingResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRankingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRankingResponse>(create);
  static GetRankingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Record> get records => $_getList(0);
}

/// ランキング登録
class InsertRankingResponse extends $pb.GeneratedMessage {
  factory InsertRankingResponse({
    $core.int? userId,
    $core.int? gameId,
    $core.int? score,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (gameId != null) {
      $result.gameId = gameId;
    }
    if (score != null) {
      $result.score = score;
    }
    return $result;
  }
  InsertRankingResponse._() : super();
  factory InsertRankingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsertRankingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsertRankingResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'gameId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'score', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsertRankingResponse clone() => InsertRankingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsertRankingResponse copyWith(void Function(InsertRankingResponse) updates) => super.copyWith((message) => updates(message as InsertRankingResponse)) as InsertRankingResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsertRankingResponse create() => InsertRankingResponse._();
  InsertRankingResponse createEmptyInstance() => create();
  static $pb.PbList<InsertRankingResponse> createRepeated() => $pb.PbList<InsertRankingResponse>();
  @$core.pragma('dart2js:noInline')
  static InsertRankingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsertRankingResponse>(create);
  static InsertRankingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get gameId => $_getIZ(1);
  @$pb.TagNumber(2)
  set gameId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGameId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);
}

class InsertRankigResponse extends $pb.GeneratedMessage {
  factory InsertRankigResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  InsertRankigResponse._() : super();
  factory InsertRankigResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InsertRankigResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InsertRankigResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InsertRankigResponse clone() => InsertRankigResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InsertRankigResponse copyWith(void Function(InsertRankigResponse) updates) => super.copyWith((message) => updates(message as InsertRankigResponse)) as InsertRankigResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InsertRankigResponse create() => InsertRankigResponse._();
  InsertRankigResponse createEmptyInstance() => create();
  static $pb.PbList<InsertRankigResponse> createRepeated() => $pb.PbList<InsertRankigResponse>();
  @$core.pragma('dart2js:noInline')
  static InsertRankigResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InsertRankigResponse>(create);
  static InsertRankigResponse? _defaultInstance;

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
