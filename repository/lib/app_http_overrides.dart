import 'dart:io';

import 'package:repository/constant/const_api.dart';

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    final client = super.createHttpClient(context)
      ..connectionTimeout = ConstApi.apiConnectionTimeout;
    return client;
  }
}
