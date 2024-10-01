import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:teste_alura/core/exceptions/api_exceptions.dart';

enum TypeRequest { get, post, put, delete }

abstract class HttpHelper {
  Future<dynamic> request(
      {Map<String, String>? headers,
      noDefaultHeaders = false,
      required String url,
      String? body,
      TypeRequest type = TypeRequest.post});
}

class HttpHelperImpl implements HttpHelper {
  final http.Client _httpClient;

  HttpHelperImpl._(this._httpClient);

  static HttpHelperImpl? _instance;

  factory HttpHelperImpl(http.Client? client) {
    _instance ??= HttpHelperImpl._(client!);
    return _instance!;
  }

  @override
  Future<dynamic> request(
      {Map<String, String>? headers,
      noDefaultHeaders = false,
      required String url,
      String? body,
      TypeRequest type = TypeRequest.post}) async {
    Map<String, String>? customHeaders;

    if (!noDefaultHeaders) {
      customHeaders = {
        'Content-Type': 'application/json',
      };
      if (headers != null) {
        customHeaders.addAll(headers);
      }
    }
    log(customHeaders.toString(), name: 'FETCH');
    log(type.toString(), name: 'FETCH_TYPE');
    log(body ?? '', name: 'BODY');
    try {
      log(
        url,
        name: 'FETCH URL',
        sequenceNumber: 1,
      );
      final uri = Uri.parse(url);
      final http.Response response = await _makeRequest(
          type: type, uri: uri, headers: customHeaders, body: body);

      log(
        response.statusCode.toString(),
        name: 'FETCH STATUS CODE',
        sequenceNumber: 2,
      );
      log(utf8.decode(response.bodyBytes),
          name: 'FETCH BODY', sequenceNumber: 3);
      final statusCode = response.statusCode;
      final dynamic json;
      if (response.body.isNotEmpty) {
        json = await compute(jsonDecode, utf8.decode(response.bodyBytes));
      } else {
        json = {'message': 'isEmpty'};
      }

      if (statusCode >= 200 && statusCode < 299) {
        return json;
      }
      if (statusCode >= 400 && statusCode < 500) {
        throw ClientErrorException(code: statusCode, message: jsonEncode(json));
      }
      if (statusCode >= 500 && statusCode < 600) {
        throw ServerErrorException(code: statusCode, message: jsonEncode(json));
      }
      throw const UnknownException();
    } on SocketException catch (e) {
      log('Erro ao realizar o post $body', name: 'ERRO', error: e);
      throw const ConnectionException();
    }
  }

  Future<http.Response> _makeRequest(
      {required TypeRequest type,
      required Uri uri,
      Map<String, String>? headers,
      String? body}) async {
    switch (type) {
      case TypeRequest.get:
        return await _httpClient.get(uri, headers: headers);
      default:
        return await _httpClient.post(uri, headers: headers, body: body);
    }
  }
}
