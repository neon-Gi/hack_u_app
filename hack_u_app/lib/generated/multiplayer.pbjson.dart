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
    {'1': 'players', '3': 2, '4': 3, '5': 9, '10': 'players'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode(
    'CgRSb29tEhoKCHNlcnZlcklEGAEgASgJUghzZXJ2ZXJJRBIYCgdwbGF5ZXJzGAIgAygJUgdwbG'
    'F5ZXJz');

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
    {'1': 'hostname', '3': 2, '4': 1, '5': 9, '10': 'hostname'},
  ],
};

/// Descriptor for `CreateRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVSb29tUmVzcG9uc2USJQoEcm9vbRgBIAEoCzIRLm11bHRpcGxheWVyLlJvb21SBH'
    'Jvb20SGgoIaG9zdG5hbWUYAiABKAlSCGhvc3RuYW1l');

@$core.Deprecated('Use roomDataRequestDescriptor instead')
const RoomDataRequest$json = {
  '1': 'RoomDataRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
  ],
};

/// Descriptor for `RoomDataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDataRequestDescriptor = $convert.base64Decode(
    'Cg9Sb29tRGF0YVJlcXVlc3QSGgoIaG9zdG5hbWUYASABKAlSCGhvc3RuYW1l');

@$core.Deprecated('Use roomDataResponseDescriptor instead')
const RoomDataResponse$json = {
  '1': 'RoomDataResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Room', '10': 'room'},
    {'1': 'hostname', '3': 2, '4': 1, '5': 9, '10': 'hostname'},
  ],
};

/// Descriptor for `RoomDataResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDataResponseDescriptor = $convert.base64Decode(
    'ChBSb29tRGF0YVJlc3BvbnNlEiUKBHJvb20YASABKAsyES5tdWx0aXBsYXllci5Sb29tUgRyb2'
    '9tEhoKCGhvc3RuYW1lGAIgASgJUghob3N0bmFtZQ==');

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
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'room', '3': 2, '4': 1, '5': 11, '6': '.multiplayer.Room', '10': 'room'},
    {'1': 'hostname', '3': 3, '4': 1, '5': 9, '10': 'hostname'},
  ],
};

/// Descriptor for `JoinRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRoomResponseDescriptor = $convert.base64Decode(
    'ChBKb2luUm9vbVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSJQoEcm9vbRgCIA'
    'EoCzIRLm11bHRpcGxheWVyLlJvb21SBHJvb20SGgoIaG9zdG5hbWUYAyABKAlSCGhvc3RuYW1l');

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

