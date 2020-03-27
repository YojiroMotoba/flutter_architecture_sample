import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient {
  static final http.Client _client = http.Client();

  final String userAgent;

  HttpClient(this.userAgent);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _client.send(request);
  }

  @override
  Future<Response> get(dynamic url, {Map<String, String> headers}) async {
    return _client.get(url, headers: headers);
  }
}
