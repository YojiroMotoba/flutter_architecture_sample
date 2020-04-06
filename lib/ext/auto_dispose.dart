import 'package:flutter/widgets.dart';

mixin AutoDispose<T extends StatefulWidget> on State<T> {
  final _changeNotifiers = <ChangeNotifier>[];

  void addDisposer(ChangeNotifier dispose) {
    _changeNotifiers.add(dispose);
  }

  @override
  void dispose() {
    debugPrint('AutoDispose#dispose ${_changeNotifiers.length}');
    for (final notifier in _changeNotifiers) {
      notifier?.dispose();
    }
    super.dispose();
  }
}

extension AutoDisposeChangeNotifier on ChangeNotifier {
  void addDispose(AutoDispose autoDispose) {
    autoDispose.addDisposer(this);
  }
}
