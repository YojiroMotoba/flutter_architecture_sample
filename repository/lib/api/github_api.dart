import 'dart:async';

import 'package:http/http.dart';
import 'package:repository/api/http_client.dart';
import 'package:repository/constant/const_api.dart';
import 'package:repository/constant/const_url.dart';

class GithubApi {
  static final GithubApi _instance = GithubApi._internal();

  factory GithubApi() => _instance;

  GithubApi._internal();

  static Future<Response> searchRepositories(String query) async {
    final queryParameters = {
      'q': query,
    };
    var uri = Uri.https(
        ConstUrl.githubDomain, ConstUrl.searchRepositories, queryParameters);
    return await HttpClient(ConstApi.userAgent)
        .get(uri)
        .timeout(ConstApi.apiTimeout);
  }
}
