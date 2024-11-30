//
//  Generated code. Do not modify.
//  source: multiplayer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use roomDescriptor instead')
const Room$json = {
  '1': 'Room',
  '2': [
    {'1': 'serverID', '3': 1, '4': 1, '5': 9, '10': 'serverID'},
    {'1': 'hostname', '3': 2, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
    {'1': 'players', '3': 4, '4': 3, '5': 9, '10': 'players'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode(
    'CgRSb29tEhoKCHNlcnZlcklEGAEgASgJUghzZXJ2ZXJJRBIaCghob3N0bmFtZRgCIAEoCVIIaG'
    '9zdG5hbWUSFgoGc3RhdHVzGAMgASgJUgZzdGF0dXMSGAoHcGxheWVycxgEIAMoCVIHcGxheWVy'
    'cw==');

@$core.Deprecated('Use gameDescriptor instead')
const Game$json = {
  '1': 'Game',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'game_status', '3': 3, '4': 1, '5': 9, '10': 'gameStatus'},
    {'1': 'remaining_time', '3': 4, '4': 1, '5': 5, '10': 'remainingTime'},
    {'1': 'player_action', '3': 5, '4': 1, '5': 9, '10': 'playerAction'},
  ],
};

/// Descriptor for `Game`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameDescriptor = $convert.base64Decode(
    'CgRHYW1lEhoKCGhvc3RuYW1lGAEgASgJUghob3N0bmFtZRIUCgV0aXRsZRgCIAEoCVIFdGl0bG'
    'USHwoLZ2FtZV9zdGF0dXMYAyABKAlSCmdhbWVTdGF0dXMSJQoOcmVtYWluaW5nX3RpbWUYBCAB'
    'KAVSDXJlbWFpbmluZ1RpbWUSIwoNcGxheWVyX2FjdGlvbhgFIAEoCVIMcGxheWVyQWN0aW9u');

@$core.Deprecated('Use createRoomRequestDescriptor instead')
const CreateRoomRequest$json = {
  '1': 'CreateRoomRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
  ],
};

/// Descriptor for `CreateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVSb29tUmVxdWVzdBIaCghob3N0bmFtZRgBIAEoCVIIaG9zdG5hbWU=');

@$core.Deprecated('Use createRoomResponseDescriptor instead')
const CreateRoomResponse$json = {
  '1': 'CreateRoomResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Room', '10': 'room'},
  ],
};

/// Descriptor for `CreateRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVSb29tUmVzcG9uc2USJQoEcm9vbRgBIAEoCzIRLm11bHRpcGxheWVyLlJvb21SBH'
    'Jvb20=');

@$core.Deprecated('Use updateRequestDescriptor instead')
const UpdateRequest$json = {
  '1': 'UpdateRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
  ],
};

/// Descriptor for `UpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRequestDescriptor = $convert.base64Decode(
    'Cg1VcGRhdGVSZXF1ZXN0EhoKCGhvc3RuYW1lGAEgASgJUghob3N0bmFtZQ==');

@$core.Deprecated('Use updateResponseDescriptor instead')
const UpdateResponse$json = {
  '1': 'UpdateResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Room', '10': 'room'},
  ],
};

/// Descriptor for `UpdateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateResponseDescriptor = $convert.base64Decode(
    'Cg5VcGRhdGVSZXNwb25zZRIlCgRyb29tGAEgASgLMhEubXVsdGlwbGF5ZXIuUm9vbVIEcm9vbQ'
    '==');

@$core.Deprecated('Use joinRoomRequestDescriptor instead')
const JoinRoomRequest$json = {
  '1': 'JoinRoomRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'playername', '3': 2, '4': 1, '5': 9, '10': 'playername'},
  ],
};

/// Descriptor for `JoinRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRoomRequestDescriptor = $convert.base64Decode(
    'Cg9Kb2luUm9vbVJlcXVlc3QSGgoIaG9zdG5hbWUYASABKAlSCGhvc3RuYW1lEh4KCnBsYXllcm'
    '5hbWUYAiABKAlSCnBsYXllcm5hbWU=');

@$core.Deprecated('Use joinRoomResponseDescriptor instead')
const JoinRoomResponse$json = {
  '1': 'JoinRoomResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Room', '10': 'room'},
  ],
};

/// Descriptor for `JoinRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRoomResponseDescriptor = $convert.base64Decode(
    'ChBKb2luUm9vbVJlc3BvbnNlEiUKBHJvb20YASABKAsyES5tdWx0aXBsYXllci5Sb29tUgRyb2'
    '9t');

@$core.Deprecated('Use exitRoomRequestDescriptor instead')
const ExitRoomRequest$json = {
  '1': 'ExitRoomRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'playername', '3': 2, '4': 1, '5': 9, '10': 'playername'},
  ],
};

/// Descriptor for `ExitRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exitRoomRequestDescriptor = $convert.base64Decode(
    'Cg9FeGl0Um9vbVJlcXVlc3QSGgoIaG9zdG5hbWUYASABKAlSCGhvc3RuYW1lEh4KCnBsYXllcm'
    '5hbWUYAiABKAlSCnBsYXllcm5hbWU=');

@$core.Deprecated('Use exitRoomResponseDescriptor instead')
const ExitRoomResponse$json = {
  '1': 'ExitRoomResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ExitRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exitRoomResponseDescriptor = $convert.base64Decode(
    'ChBFeGl0Um9vbVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use startGameRequestDescriptor instead')
const StartGameRequest$json = {
  '1': 'StartGameRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'playername', '3': 2, '4': 1, '5': 9, '10': 'playername'},
  ],
};

/// Descriptor for `StartGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startGameRequestDescriptor = $convert.base64Decode(
    'ChBTdGFydEdhbWVSZXF1ZXN0EhoKCGhvc3RuYW1lGAEgASgJUghob3N0bmFtZRIeCgpwbGF5ZX'
    'JuYW1lGAIgASgJUgpwbGF5ZXJuYW1l');

@$core.Deprecated('Use startGameResponseDescriptor instead')
const StartGameResponse$json = {
  '1': 'StartGameResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Room', '10': 'room'},
    {'1': 'game', '3': 2, '4': 1, '5': 11, '6': '.multiplayer.Game', '10': 'game'},
  ],
};

/// Descriptor for `StartGameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startGameResponseDescriptor = $convert.base64Decode(
    'ChFTdGFydEdhbWVSZXNwb25zZRIlCgRyb29tGAEgASgLMhEubXVsdGlwbGF5ZXIuUm9vbVIEcm'
    '9vbRIlCgRnYW1lGAIgASgLMhEubXVsdGlwbGF5ZXIuR2FtZVIEZ2FtZQ==');

@$core.Deprecated('Use updateGameRequestDescriptor instead')
const UpdateGameRequest$json = {
  '1': 'UpdateGameRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'playername', '3': 2, '4': 1, '5': 9, '10': 'playername'},
    {'1': 'action', '3': 3, '4': 1, '5': 8, '10': 'action'},
  ],
};

/// Descriptor for `UpdateGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGameRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVHYW1lUmVxdWVzdBIaCghob3N0bmFtZRgBIAEoCVIIaG9zdG5hbWUSHgoKcGxheW'
    'VybmFtZRgCIAEoCVIKcGxheWVybmFtZRIWCgZhY3Rpb24YAyABKAhSBmFjdGlvbg==');

@$core.Deprecated('Use updateGameResponseDescriptor instead')
const UpdateGameResponse$json = {
  '1': 'UpdateGameResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Room', '10': 'room'},
    {'1': 'game', '3': 2, '4': 1, '5': 11, '6': '.multiplayer.Game', '10': 'game'},
  ],
};

/// Descriptor for `UpdateGameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGameResponseDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVHYW1lUmVzcG9uc2USJQoEcm9vbRgBIAEoCzIRLm11bHRpcGxheWVyLlJvb21SBH'
    'Jvb20SJQoEZ2FtZRgCIAEoCzIRLm11bHRpcGxheWVyLkdhbWVSBGdhbWU=');

