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
  static final _$createRoom = $grpc.ClientMethod<$0.CreateRoomRequest, $0.CreateRoomResponse>(
      '/multiplayer.MultiplayerService/CreateRoom',
      ($0.CreateRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateRoomResponse.fromBuffer(value));
  static final _$roomData = $grpc.ClientMethod<$0.RoomDataRequest, $0.RoomDataResponse>(
      '/multiplayer.MultiplayerService/RoomData',
      ($0.RoomDataRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RoomDataResponse.fromBuffer(value));
  static final _$joinRoom = $grpc.ClientMethod<$0.JoinRoomRequest, $0.JoinRoomResponse>(
      '/multiplayer.MultiplayerService/JoinRoom',
      ($0.JoinRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.JoinRoomResponse.fromBuffer(value));
  static final _$exitRoom = $grpc.ClientMethod<$0.ExitRoomRequest, $0.ExitRoomResponse>(
      '/multiplayer.MultiplayerService/ExitRoom',
      ($0.ExitRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ExitRoomResponse.fromBuffer(value));

  MultiplayerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateRoomResponse> createRoom($0.CreateRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomDataResponse> roomData($0.RoomDataRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$roomData, request, options: options);
  }

  $grpc.ResponseFuture<$0.JoinRoomResponse> joinRoom($0.JoinRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$joinRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.ExitRoomResponse> exitRoom($0.ExitRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$exitRoom, request, options: options);
  }
}

@$pb.GrpcServiceName('multiplayer.MultiplayerService')
abstract class MultiplayerServiceBase extends $grpc.Service {
  $core.String get $name => 'multiplayer.MultiplayerService';

  MultiplayerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateRoomRequest, $0.CreateRoomResponse>(
        'CreateRoom',
        createRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRoomRequest.fromBuffer(value),
        ($0.CreateRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoomDataRequest, $0.RoomDataResponse>(
        'RoomData',
        roomData_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RoomDataRequest.fromBuffer(value),
        ($0.RoomDataResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.JoinRoomRequest, $0.JoinRoomResponse>(
        'JoinRoom',
        joinRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.JoinRoomRequest.fromBuffer(value),
        ($0.JoinRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ExitRoomRequest, $0.ExitRoomResponse>(
        'ExitRoom',
        exitRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ExitRoomRequest.fromBuffer(value),
        ($0.ExitRoomResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateRoomResponse> createRoom_Pre($grpc.ServiceCall call, $async.Future<$0.CreateRoomRequest> request) async {
    return createRoom(call, await request);
  }

  $async.Future<$0.RoomDataResponse> roomData_Pre($grpc.ServiceCall call, $async.Future<$0.RoomDataRequest> request) async {
    return roomData(call, await request);
  }

  $async.Future<$0.JoinRoomResponse> joinRoom_Pre($grpc.ServiceCall call, $async.Future<$0.JoinRoomRequest> request) async {
    return joinRoom(call, await request);
  }

  $async.Future<$0.ExitRoomResponse> exitRoom_Pre($grpc.ServiceCall call, $async.Future<$0.ExitRoomRequest> request) async {
    return exitRoom(call, await request);
  }

  $async.Future<$0.CreateRoomResponse> createRoom($grpc.ServiceCall call, $0.CreateRoomRequest request);
  $async.Future<$0.RoomDataResponse> roomData($grpc.ServiceCall call, $0.RoomDataRequest request);
  $async.Future<$0.JoinRoomResponse> joinRoom($grpc.ServiceCall call, $0.JoinRoomRequest request);
  $async.Future<$0.ExitRoomResponse> exitRoom($grpc.ServiceCall call, $0.ExitRoomRequest request);
}
