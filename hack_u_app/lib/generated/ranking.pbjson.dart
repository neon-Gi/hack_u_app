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

@$core.Deprecated('Use insertPlayerRequesrDescriptor instead')
const InsertPlayerRequesr$json = {
  '1': 'InsertPlayerRequesr',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `InsertPlayerRequesr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertPlayerRequesrDescriptor = $convert.base64Decode(
    'ChNJbnNlcnRQbGF5ZXJSZXF1ZXNyEhIKBG5hbWUYASABKAlSBG5hbWUSGgoIcGFzc3dvcmQYAi'
    'ABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use insertPlayerResponseDescriptor instead')
const InsertPlayerResponse$json = {
  '1': 'InsertPlayerResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `InsertPlayerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertPlayerResponseDescriptor = $convert.base64Decode(
    'ChRJbnNlcnRQbGF5ZXJSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhcKB3VzZX'
    'JfaWQYAiABKAVSBnVzZXJJZA==');

@$core.Deprecated('Use loginPlayerRequesrDescriptor instead')
const LoginPlayerRequesr$json = {
  '1': 'LoginPlayerRequesr',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginPlayerRequesr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginPlayerRequesrDescriptor = $convert.base64Decode(
    'ChJMb2dpblBsYXllclJlcXVlc3ISEgoEbmFtZRgBIAEoCVIEbmFtZRIaCghwYXNzd29yZBgCIA'
    'EoCVIIcGFzc3dvcmQ=');

@$core.Deprecated('Use loginPlayerResponseDescriptor instead')
const LoginPlayerResponse$json = {
  '1': 'LoginPlayerResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `LoginPlayerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginPlayerResponseDescriptor = $convert.base64Decode(
    'ChNMb2dpblBsYXllclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSFwoHdXNlcl'
    '9pZBgCIAEoBVIGdXNlcklk');

@$core.Deprecated('Use recordDescriptor instead')
const Record$json = {
  '1': 'Record',
  '2': [
    {'1': 'user_name', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'score', '3': 2, '4': 1, '5': 5, '10': 'score'},
  ],
};

/// Descriptor for `Record`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordDescriptor = $convert.base64Decode(
    'CgZSZWNvcmQSGwoJdXNlcl9uYW1lGAEgASgJUgh1c2VyTmFtZRIUCgVzY29yZRgCIAEoBVIFc2'
    'NvcmU=');

@$core.Deprecated('Use getRankingRequestDescriptor instead')
const GetRankingRequest$json = {
  '1': 'GetRankingRequest',
  '2': [
    {'1': 'game_id', '3': 1, '4': 1, '5': 5, '10': 'gameId'},
  ],
};

/// Descriptor for `GetRankingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRankingRequestDescriptor = $convert.base64Decode(
    'ChFHZXRSYW5raW5nUmVxdWVzdBIXCgdnYW1lX2lkGAEgASgFUgZnYW1lSWQ=');

@$core.Deprecated('Use getRankingResponseDescriptor instead')
const GetRankingResponse$json = {
  '1': 'GetRankingResponse',
  '2': [
    {'1': 'records', '3': 1, '4': 3, '5': 11, '6': '.ranking.Record', '10': 'records'},
  ],
};

/// Descriptor for `GetRankingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRankingResponseDescriptor = $convert.base64Decode(
    'ChJHZXRSYW5raW5nUmVzcG9uc2USKQoHcmVjb3JkcxgBIAMoCzIPLnJhbmtpbmcuUmVjb3JkUg'
    'dyZWNvcmRz');

@$core.Deprecated('Use insertRankingResponseDescriptor instead')
const InsertRankingResponse$json = {
  '1': 'InsertRankingResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'game_id', '3': 2, '4': 1, '5': 5, '10': 'gameId'},
    {'1': 'score', '3': 3, '4': 1, '5': 5, '10': 'score'},
  ],
};

/// Descriptor for `InsertRankingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertRankingResponseDescriptor = $convert.base64Decode(
    'ChVJbnNlcnRSYW5raW5nUmVzcG9uc2USFwoHdXNlcl9pZBgBIAEoBVIGdXNlcklkEhcKB2dhbW'
    'VfaWQYAiABKAVSBmdhbWVJZBIUCgVzY29yZRgDIAEoBVIFc2NvcmU=');

@$core.Deprecated('Use insertRankigResponseDescriptor instead')
const InsertRankigResponse$json = {
  '1': 'InsertRankigResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `InsertRankigResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertRankigResponseDescriptor = $convert.base64Decode(
    'ChRJbnNlcnRSYW5raWdSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

