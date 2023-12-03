import 'package:flutter/material.dart';

@immutable
final class NetworkEntity {
  final String? uri;
  final dynamic headers;
  final dynamic queryParams;
  final dynamic payload;
  final dynamic response;
  final int? statusCode;

  const NetworkEntity({
    required this.headers,
    required this.payload,
    required this.queryParams,
    required this.response,
    required this.uri,
    required this.statusCode,
  });
}
