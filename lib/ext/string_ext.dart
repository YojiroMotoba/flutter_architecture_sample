import 'package:flutterarchitecturesample/util/intl/localized.dart';

extension StringExt on String {
  String localized() => Localized.get(this);
}
