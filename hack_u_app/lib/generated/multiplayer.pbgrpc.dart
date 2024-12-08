//
//  Generated code. Do not modify.
//  source: multiplayer.proto
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

import 'multiplayer.pb.dart' as $0;

export 'multiplayer.pb.dart';

@$pb.GrpcServiceName('multiplayer.MultiplayerService')
class MultiplayerServiceClient extends $grpc.Client {
  static final _$createRoom = $grpc.ClientMethod<$0.createRoomRequest, $0.createRoomResponse>(
      '/multiplayer.MultiplayerService/CreateRoom',
      ($0.createRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.createRoomResponse.fromBuffer(value));
  static final _$joinRoom = $grpc.ClientMethod<$0.joinRoomRequest, $0.joinRoomResponse>(
      '/multiplayer.MultiplayerService/JoinRoom',
      ($0.joinRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.joinRoomResponse.fromBuffer(value));
  static final _$updateRoom = $grpc.ClientMethod<$0.updateRoomRequest, $0.updateRoomResponse>(
      '/multiplayer.MultiplayerService/UpdateRoom',
      ($0.updateRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.updateRoomResponse.fromBuffer(value));
  static final _$exitRoom = $grpc.ClientMethod<$0.exitRoomRequest, $0.exitRoomResponse>(
      '/multiplayer.MultiplayerService/ExitRoom',
      ($0.exitRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.exitRoomResponse.fromBuffer(value));
  static final _$startGame = $grpc.ClientMethod<$0.startGameRequest, $0.startGameResponse>(
      '/multiplayer.MultiplayerService/StartGame',
      ($0.startGameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.startGameResponse.fromBuffer(value));
  static final _$updateGame = $grpc.ClientMethod<$0.updateGameRequest, $0.updateGameResponse>(
      '/multiplayer.MultiplayerService/UpdateGame',
      ($0.updateGameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.updateGameResponse.fromBuffer(value));

  MultiplayerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.createRoomResponse> createRoom($0.createRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.joinRoomResponse> joinRoom($0.joinRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$joinRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.updateRoomResponse> updateRoom($0.updateRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.exitRoomResponse> exitRoom($0.exitRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$exitRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.startGameResponse> startGame($0.startGameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$startGame, request, options: options);
  }

  $grpc.ResponseFuture<$0.updateGameResponse> updateGame($0.updateGameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateGame, request, options: options);
  }
}

@$pb.GrpcServiceName('multiplayer.MultiplayerService')
abstract class MultiplayerServiceBase extends $grpc.Service {
  $core.String get $name => 'multiplayer.MultiplayerService';

  MultiplayerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.createRoomRequest, $0.createRoomResponse>(
        'CreateRoom',
        createRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.createRoomRequest.fromBuffer(value),
        ($0.createRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.joinRoomRequest, $0.joinRoomResponse>(
        'JoinRoom',
        joinRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.joinRoomRequest.fromBuffer(value),
        ($0.joinRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.updateRoomRequest, $0.updateRoomResponse>(
        'UpdateRoom',
        updateRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.updateRoomRequest.fromBuffer(value),
        ($0.updateRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.exitRoomRequest, $0.exitRoomResponse>(
        'ExitRoom',
        exitRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.exitRoomRequest.fromBuffer(value),
        ($0.exitRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.startGameRequest, $0.startGameResponse>(
        'StartGame',
        startGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.startGameRequest.fromBuffer(value),
        ($0.startGameResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.updateGameRequest, $0.updateGameResponse>(
        'UpdateGame',
        updateGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.updateGameRequest.fromBuffer(value),
        ($0.updateGameResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.createRoomResponse> createRoom_Pre($grpc.ServiceCall call, $async.Future<$0.createRoomRequest> request) async {
    return createRoom(call, await request);
  }

  $async.Future<$0.joinRoomResponse> joinRoom_Pre($grpc.ServiceCall call, $async.Future<$0.joinRoomRequest> request) async {
    return joinRoom(call, await request);
  }

  $async.Future<$0.updateRoomResponse> updateRoom_Pre($grpc.ServiceCall call, $async.Future<$0.updateRoomRequest> request) async {
    return updateRoom(call, await request);
  }

  $async.Future<$0.exitRoomResponse> exitRoom_Pre($grpc.ServiceCall call, $async.Future<$0.exitRoomRequest> request) async {
    return exitRoom(call, await request);
  }

  $async.Future<$0.startGameResponse> startGame_Pre($grpc.ServiceCall call, $async.Future<$0.startGameRequest> request) async {
    return startGame(call, await request);
  }

  $async.Future<$0.updateGameResponse> updateGame_Pre($grpc.ServiceCall call, $async.Future<$0.updateGameRequest> request) async {
    return updateGame(call, await request);
  }

  $async.Future<$0.createRoomResponse> createRoom($grpc.ServiceCall call, $0.createRoomRequest request);
  $async.Future<$0.joinRoomResponse> joinRoom($grpc.ServiceCall call, $0.joinRoomRequest request);
  $async.Future<$0.updateRoomResponse> updateRoom($grpc.ServiceCall call, $0.updateRoomRequest request);
  $async.Future<$0.exitRoomResponse> exitRoom($grpc.ServiceCall call, $0.exitRoomRequest request);
  $async.Future<$0.startGameResponse> startGame($grpc.ServiceCall call, $0.startGameRequest request);
  $async.Future<$0.updateGameResponse> updateGame($grpc.ServiceCall call, $0.updateGameRequest request);
}
