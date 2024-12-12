//
//  Generated code. Do not modify.
//  source: ranking.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use setPlayernameRequestDescriptor instead')
const SetPlayernameRequest$json = {
  '1': 'SetPlayernameRequest',
  '2': [
    {'1': 'playerName', '3': 1, '4': 1, '5': 9, '10': 'playerName'},
  ],
};

/// Descriptor for `SetPlayernameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPlayernameRequestDescriptor = $convert.base64Decode(
    'ChRTZXRQbGF5ZXJuYW1lUmVxdWVzdBIeCgpwbGF5ZXJOYW1lGAEgASgJUgpwbGF5ZXJOYW1l');

@$core.Deprecated('Use setPlayernameResponseDescriptor instead')
const SetPlayernameResponse$json = {
  '1': 'SetPlayernameResponse',
  '2': [
    {'1': 'playerId', '3': 1, '4': 1, '5': 5, '10': 'playerId'},
  ],
};

/// Descriptor for `SetPlayernameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPlayernameResponseDescriptor = $convert.base64Decode(
    'ChVTZXRQbGF5ZXJuYW1lUmVzcG9uc2USGgoIcGxheWVySWQYASABKAVSCHBsYXllcklk');

@$core.Deprecated('Use leaderboardRequestDescriptor instead')
const LeaderboardRequest$json = {
  '1': 'LeaderboardRequest',
  '2': [
    {'1': 'gameId', '3': 1, '4': 1, '5': 5, '10': 'gameId'},
  ],
};

/// Descriptor for `LeaderboardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaderboardRequestDescriptor = $convert.base64Decode(
    'ChJMZWFkZXJib2FyZFJlcXVlc3QSFgoGZ2FtZUlkGAEgASgFUgZnYW1lSWQ=');

@$core.Deprecated('Use leaderboardResponseDescriptor instead')
const LeaderboardResponse$json = {
  '1': 'LeaderboardResponse',
  '2': [
    {'1': 'scores', '3': 1, '4': 3, '5': 11, '6': '.ranking.PlayerScore', '10': 'scores'},
  ],
};

/// Descriptor for `LeaderboardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaderboardResponseDescriptor = $convert.base64Decode(
    'ChNMZWFkZXJib2FyZFJlc3BvbnNlEiwKBnNjb3JlcxgBIAMoCzIULnJhbmtpbmcuUGxheWVyU2'
    'NvcmVSBnNjb3Jlcw==');

@$core.Deprecated('Use playerScoreDescriptor instead')
const PlayerScore$json = {
  '1': 'PlayerScore',
  '2': [
    {'1': 'playerName', '3': 1, '4': 1, '5': 9, '10': 'playerName'},
    {'1': 'score', '3': 2, '4': 1, '5': 5, '10': 'score'},
  ],
};

/// Descriptor for `PlayerScore`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerScoreDescriptor = $convert.base64Decode(
    'CgtQbGF5ZXJTY29yZRIeCgpwbGF5ZXJOYW1lGAEgASgJUgpwbGF5ZXJOYW1lEhQKBXNjb3JlGA'
    'IgASgFUgVzY29yZQ==');

@$core.Deprecated('Use submitScoreRequestDescriptor instead')
const SubmitScoreRequest$json = {
  '1': 'SubmitScoreRequest',
  '2': [
    {'1': 'gameId', '3': 1, '4': 1, '5': 5, '10': 'gameId'},
    {'1': 'playerName', '3': 2, '4': 1, '5': 9, '10': 'playerName'},
    {'1': 'score', '3': 3, '4': 1, '5': 5, '10': 'score'},
  ],
};

/// Descriptor for `SubmitScoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitScoreRequestDescriptor = $convert.base64Decode(
    'ChJTdWJtaXRTY29yZVJlcXVlc3QSFgoGZ2FtZUlkGAEgASgFUgZnYW1lSWQSHgoKcGxheWVyTm'
    'FtZRgCIAEoCVIKcGxheWVyTmFtZRIUCgVzY29yZRgDIAEoBVIFc2NvcmU=');

@$core.Deprecated('Use submitScoreResponseDescriptor instead')
const SubmitScoreResponse$json = {
  '1': 'SubmitScoreResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SubmitScoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitScoreResponseDescriptor = $convert.base64Decode(
    'ChNTdWJtaXRTY29yZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

