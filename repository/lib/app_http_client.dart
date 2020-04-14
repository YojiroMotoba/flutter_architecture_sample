import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:repository/constant/const_api.dart';

class AppHttpClient extends IOClient {
  static final http.Client _client = http.Client();

  final String userAgent;

  AppHttpClient(this.userAgent);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _client.send(request);
  }

  @override
  Future<Response> get(dynamic url, {Map<String, String> headers}) {
    return _client.get(url, headers: headers)..timeout(ConstApi.apiTimeout);
  }
}
