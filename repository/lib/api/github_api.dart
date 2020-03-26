import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:repository/constant/const_url.dart';

class GithubApi {
  Future<Response> searchRepositories(String query) async {
    final queryParameters = {
      'q': query,
    };
    var uri = Uri.https(
        ConstUrl.githubDomain, ConstUrl.searchRepositories, queryParameters);
    return await http.get(uri);
  }
}
