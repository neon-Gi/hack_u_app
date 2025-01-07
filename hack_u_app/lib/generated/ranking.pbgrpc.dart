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
  static final _$insertPlayer = $grpc.ClientMethod<$0.InsertPlayerRequesr, $0.InsertPlayerResponse>(
      '/ranking.RankingService/InsertPlayer',
      ($0.InsertPlayerRequesr value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.InsertPlayerResponse.fromBuffer(value));
  static final _$loginPlayer = $grpc.ClientMethod<$0.LoginPlayerRequesr, $0.LoginPlayerResponse>(
      '/ranking.RankingService/LoginPlayer',
      ($0.LoginPlayerRequesr value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginPlayerResponse.fromBuffer(value));
  static final _$getRanking = $grpc.ClientMethod<$0.GetRankingRequest, $0.GetRankingResponse>(
      '/ranking.RankingService/GetRanking',
      ($0.GetRankingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetRankingResponse.fromBuffer(value));
  static final _$insertRanking = $grpc.ClientMethod<$0.InsertRankingResponse, $0.InsertRankigResponse>(
      '/ranking.RankingService/InsertRanking',
      ($0.InsertRankingResponse value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.InsertRankigResponse.fromBuffer(value));

  RankingServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.InsertPlayerResponse> insertPlayer($0.InsertPlayerRequesr request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$insertPlayer, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginPlayerResponse> loginPlayer($0.LoginPlayerRequesr request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loginPlayer, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRankingResponse> getRanking($0.GetRankingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRanking, request, options: options);
  }

  $grpc.ResponseFuture<$0.InsertRankigResponse> insertRanking($0.InsertRankingResponse request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$insertRanking, request, options: options);
  }
}

@$pb.GrpcServiceName('ranking.RankingService')
abstract class RankingServiceBase extends $grpc.Service {
  $core.String get $name => 'ranking.RankingService';

  RankingServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.InsertPlayerRequesr, $0.InsertPlayerResponse>(
        'InsertPlayer',
        insertPlayer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InsertPlayerRequesr.fromBuffer(value),
        ($0.InsertPlayerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginPlayerRequesr, $0.LoginPlayerResponse>(
        'LoginPlayer',
        loginPlayer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginPlayerRequesr.fromBuffer(value),
        ($0.LoginPlayerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRankingRequest, $0.GetRankingResponse>(
        'GetRanking',
        getRanking_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRankingRequest.fromBuffer(value),
        ($0.GetRankingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InsertRankingResponse, $0.InsertRankigResponse>(
        'InsertRanking',
        insertRanking_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InsertRankingResponse.fromBuffer(value),
        ($0.InsertRankigResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.InsertPlayerResponse> insertPlayer_Pre($grpc.ServiceCall call, $async.Future<$0.InsertPlayerRequesr> request) async {
    return insertPlayer(call, await request);
  }

  $async.Future<$0.LoginPlayerResponse> loginPlayer_Pre($grpc.ServiceCall call, $async.Future<$0.LoginPlayerRequesr> request) async {
    return loginPlayer(call, await request);
  }

  $async.Future<$0.GetRankingResponse> getRanking_Pre($grpc.ServiceCall call, $async.Future<$0.GetRankingRequest> request) async {
    return getRanking(call, await request);
  }

  $async.Future<$0.InsertRankigResponse> insertRanking_Pre($grpc.ServiceCall call, $async.Future<$0.InsertRankingResponse> request) async {
    return insertRanking(call, await request);
  }

  $async.Future<$0.InsertPlayerResponse> insertPlayer($grpc.ServiceCall call, $0.InsertPlayerRequesr request);
  $async.Future<$0.LoginPlayerResponse> loginPlayer($grpc.ServiceCall call, $0.LoginPlayerRequesr request);
  $async.Future<$0.GetRankingResponse> getRanking($grpc.ServiceCall call, $0.GetRankingRequest request);
  $async.Future<$0.InsertRankigResponse> insertRanking($grpc.ServiceCall call, $0.InsertRankingResponse request);
}
