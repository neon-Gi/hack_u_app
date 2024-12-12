//
//  Generated code. Do not modify.
//  source: ranking.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'ranking.pb.dart' as $0;

export 'ranking.pb.dart';

@$pb.GrpcServiceName('ranking.RankingService')
class RankingServiceClient extends $grpc.Client {
  static final _$setPlayername = $grpc.ClientMethod<$0.SetPlayernameRequest, $0.SetPlayernameResponse>(
      '/ranking.RankingService/SetPlayername',
      ($0.SetPlayernameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SetPlayernameResponse.fromBuffer(value));
  static final _$getLeaderboard = $grpc.ClientMethod<$0.LeaderboardRequest, $0.LeaderboardResponse>(
      '/ranking.RankingService/GetLeaderboard',
      ($0.LeaderboardRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LeaderboardResponse.fromBuffer(value));
  static final _$submitScore = $grpc.ClientMethod<$0.SubmitScoreRequest, $0.SubmitScoreResponse>(
      '/ranking.RankingService/SubmitScore',
      ($0.SubmitScoreRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SubmitScoreResponse.fromBuffer(value));

  RankingServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.SetPlayernameResponse> setPlayername($0.SetPlayernameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setPlayername, request, options: options);
  }

  $grpc.ResponseFuture<$0.LeaderboardResponse> getLeaderboard($0.LeaderboardRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLeaderboard, request, options: options);
  }

  $grpc.ResponseFuture<$0.SubmitScoreResponse> submitScore($0.SubmitScoreRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$submitScore, request, options: options);
  }
}

@$pb.GrpcServiceName('ranking.RankingService')
abstract class RankingServiceBase extends $grpc.Service {
  $core.String get $name => 'ranking.RankingService';

  RankingServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SetPlayernameRequest, $0.SetPlayernameResponse>(
        'SetPlayername',
        setPlayername_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SetPlayernameRequest.fromBuffer(value),
        ($0.SetPlayernameResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LeaderboardRequest, $0.LeaderboardResponse>(
        'GetLeaderboard',
        getLeaderboard_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LeaderboardRequest.fromBuffer(value),
        ($0.LeaderboardResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubmitScoreRequest, $0.SubmitScoreResponse>(
        'SubmitScore',
        submitScore_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SubmitScoreRequest.fromBuffer(value),
        ($0.SubmitScoreResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SetPlayernameResponse> setPlayername_Pre($grpc.ServiceCall call, $async.Future<$0.SetPlayernameRequest> request) async {
    return setPlayername(call, await request);
  }

  $async.Future<$0.LeaderboardResponse> getLeaderboard_Pre($grpc.ServiceCall call, $async.Future<$0.LeaderboardRequest> request) async {
    return getLeaderboard(call, await request);
  }

  $async.Future<$0.SubmitScoreResponse> submitScore_Pre($grpc.ServiceCall call, $async.Future<$0.SubmitScoreRequest> request) async {
    return submitScore(call, await request);
  }

  $async.Future<$0.SetPlayernameResponse> setPlayername($grpc.ServiceCall call, $0.SetPlayernameRequest request);
  $async.Future<$0.LeaderboardResponse> getLeaderboard($grpc.ServiceCall call, $0.LeaderboardRequest request);
  $async.Future<$0.SubmitScoreResponse> submitScore($grpc.ServiceCall call, $0.SubmitScoreRequest request);
}
