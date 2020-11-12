import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:repository/constant/const_api.dart';

class AppHttpClient extends http.BaseClient {
  static final http.Client _client = http.Client();

  final String userAgent;

  AppHttpClient(this.userAgent);

  @override
  Future<http.StreamedResponse> send(BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _client.send(request);
  }

  @override
  Future<Response> get(dynamic url, {Map<String, String> headers}) {
    return _client.get(url, headers: headers)..timeout(ConstApi.apiTimeout);
  }
}
