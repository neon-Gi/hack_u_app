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
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'players', '3': 3, '4': 3, '5': 9, '10': 'players'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode(
    'CgRSb29tEhoKCGhvc3RuYW1lGAEgASgJUghob3N0bmFtZRIWCgZzdGF0dXMYAiABKAlSBnN0YX'
    'R1cxIYCgdwbGF5ZXJzGAMgAygJUgdwbGF5ZXJz');

@$core.Deprecated('Use gameDescriptor instead')
const Game$json = {
  '1': 'Game',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'players', '3': 3, '4': 3, '5': 9, '10': 'players'},
    {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    {'1': 'host_action', '3': 5, '4': 1, '5': 9, '10': 'hostAction'},
    {'1': 'player_action', '3': 6, '4': 1, '5': 9, '10': 'playerAction'},
    {'1': 'timer', '3': 7, '4': 1, '5': 5, '10': 'timer'},
    {'1': 'host_point', '3': 8, '4': 1, '5': 5, '10': 'hostPoint'},
    {'1': 'player_point', '3': 9, '4': 1, '5': 5, '10': 'playerPoint'},
  ],
};

/// Descriptor for `Game`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameDescriptor = $convert.base64Decode(
    'CgRHYW1lEhoKCGhvc3RuYW1lGAEgASgJUghob3N0bmFtZRIWCgZzdGF0dXMYAiABKAlSBnN0YX'
    'R1cxIYCgdwbGF5ZXJzGAMgAygJUgdwbGF5ZXJzEhQKBXRpdGxlGAQgASgJUgV0aXRsZRIfCgto'
    'b3N0X2FjdGlvbhgFIAEoCVIKaG9zdEFjdGlvbhIjCg1wbGF5ZXJfYWN0aW9uGAYgASgJUgxwbG'
    'F5ZXJBY3Rpb24SFAoFdGltZXIYByABKAVSBXRpbWVyEh0KCmhvc3RfcG9pbnQYCCABKAVSCWhv'
    'c3RQb2ludBIhCgxwbGF5ZXJfcG9pbnQYCSABKAVSC3BsYXllclBvaW50');

@$core.Deprecated('Use createRoomRequestDescriptor instead')
const createRoomRequest$json = {
  '1': 'createRoomRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
  ],
};

/// Descriptor for `createRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomRequestDescriptor = $convert.base64Decode(
    'ChFjcmVhdGVSb29tUmVxdWVzdBIaCghob3N0bmFtZRgBIAEoCVIIaG9zdG5hbWU=');

@$core.Deprecated('Use createRoomResponseDescriptor instead')
const createRoomResponse$json = {
  '1': 'createRoomResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Room', '10': 'room'},
  ],
};

/// Descriptor for `createRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomResponseDescriptor = $convert.base64Decode(
    'ChJjcmVhdGVSb29tUmVzcG9uc2USJQoEcm9vbRgBIAEoCzIRLm11bHRpcGxheWVyLlJvb21SBH'
    'Jvb20=');

@$core.Deprecated('Use joinRoomRequestDescriptor instead')
const joinRoomRequest$json = {
  '1': 'joinRoomRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'currentname', '3': 2, '4': 1, '5': 9, '10': 'currentname'},
  ],
};

/// Descriptor for `joinRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRoomRequestDescriptor = $convert.base64Decode(
    'Cg9qb2luUm9vbVJlcXVlc3QSGgoIaG9zdG5hbWUYASABKAlSCGhvc3RuYW1lEiAKC2N1cnJlbn'
    'RuYW1lGAIgASgJUgtjdXJyZW50bmFtZQ==');

@$core.Deprecated('Use joinRoomResponseDescriptor instead')
const joinRoomResponse$json = {
  '1': 'joinRoomResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Room', '10': 'room'},
  ],
};

/// Descriptor for `joinRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRoomResponseDescriptor = $convert.base64Decode(
    'ChBqb2luUm9vbVJlc3BvbnNlEiUKBHJvb20YASABKAsyES5tdWx0aXBsYXllci5Sb29tUgRyb2'
    '9t');

@$core.Deprecated('Use updateRoomRequestDescriptor instead')
const updateRoomRequest$json = {
  '1': 'updateRoomRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
  ],
};

/// Descriptor for `updateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRoomRequestDescriptor = $convert.base64Decode(
    'ChF1cGRhdGVSb29tUmVxdWVzdBIaCghob3N0bmFtZRgBIAEoCVIIaG9zdG5hbWU=');

@$core.Deprecated('Use updateRoomResponseDescriptor instead')
const updateRoomResponse$json = {
  '1': 'updateRoomResponse',
  '2': [
    {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Room', '10': 'room'},
  ],
};

/// Descriptor for `updateRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRoomResponseDescriptor = $convert.base64Decode(
    'ChJ1cGRhdGVSb29tUmVzcG9uc2USJQoEcm9vbRgBIAEoCzIRLm11bHRpcGxheWVyLlJvb21SBH'
    'Jvb20=');

@$core.Deprecated('Use exitRoomRequestDescriptor instead')
const exitRoomRequest$json = {
  '1': 'exitRoomRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'currentname', '3': 2, '4': 1, '5': 9, '10': 'currentname'},
  ],
};

/// Descriptor for `exitRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exitRoomRequestDescriptor = $convert.base64Decode(
    'Cg9leGl0Um9vbVJlcXVlc3QSGgoIaG9zdG5hbWUYASABKAlSCGhvc3RuYW1lEiAKC2N1cnJlbn'
    'RuYW1lGAIgASgJUgtjdXJyZW50bmFtZQ==');

@$core.Deprecated('Use exitRoomResponseDescriptor instead')
const exitRoomResponse$json = {
  '1': 'exitRoomResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `exitRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exitRoomResponseDescriptor = $convert.base64Decode(
    'ChBleGl0Um9vbVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use startGameRequestDescriptor instead')
const startGameRequest$json = {
  '1': 'startGameRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'currentname', '3': 2, '4': 1, '5': 9, '10': 'currentname'},
  ],
};

/// Descriptor for `startGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startGameRequestDescriptor = $convert.base64Decode(
    'ChBzdGFydEdhbWVSZXF1ZXN0EhoKCGhvc3RuYW1lGAEgASgJUghob3N0bmFtZRIgCgtjdXJyZW'
    '50bmFtZRgCIAEoCVILY3VycmVudG5hbWU=');

@$core.Deprecated('Use startGameResponseDescriptor instead')
const startGameResponse$json = {
  '1': 'startGameResponse',
  '2': [
    {'1': 'game', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Game', '10': 'game'},
  ],
};

/// Descriptor for `startGameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startGameResponseDescriptor = $convert.base64Decode(
    'ChFzdGFydEdhbWVSZXNwb25zZRIlCgRnYW1lGAEgASgLMhEubXVsdGlwbGF5ZXIuR2FtZVIEZ2'
    'FtZQ==');

@$core.Deprecated('Use updateGameRequestDescriptor instead')
const updateGameRequest$json = {
  '1': 'updateGameRequest',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'currentname', '3': 2, '4': 1, '5': 9, '10': 'currentname'},
    {'1': 'action', '3': 3, '4': 1, '5': 9, '10': 'action'},
  ],
};

/// Descriptor for `updateGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGameRequestDescriptor = $convert.base64Decode(
    'ChF1cGRhdGVHYW1lUmVxdWVzdBIaCghob3N0bmFtZRgBIAEoCVIIaG9zdG5hbWUSIAoLY3Vycm'
    'VudG5hbWUYAiABKAlSC2N1cnJlbnRuYW1lEhYKBmFjdGlvbhgDIAEoCVIGYWN0aW9u');

@$core.Deprecated('Use updateGameResponseDescriptor instead')
const updateGameResponse$json = {
  '1': 'updateGameResponse',
  '2': [
    {'1': 'game', '3': 1, '4': 1, '5': 11, '6': '.multiplayer.Game', '10': 'game'},
  ],
};

/// Descriptor for `updateGameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGameResponseDescriptor = $convert.base64Decode(
    'ChJ1cGRhdGVHYW1lUmVzcG9uc2USJQoEZ2FtZRgBIAEoCzIRLm11bHRpcGxheWVyLkdhbWVSBG'
    'dhbWU=');

