import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient {
  static final _inner = http.Client();
  static final HttpClient _instance = HttpClient._internal();

  factory HttpClient() => _instance;

  HttpClient._internal();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers['User-Agent'] = 'flutter app';
    debugPrint('----- API REQUEST ------');
    debugPrint(request.toString());
    if (request is http.Request && request.body.isNotEmpty) {
      debugPrint(request.body);
    }
    return _inner.send(request);
  }

  /// APIコール
  Future<http.Response> getPosts() async {
    // APIサーバアクセス
    const url = 'https://jsonplaceholder.typicode.com/posts';
    return get(url);
  }
}
