import 'dart:async';

import 'package:flutter/widgets.dart';

mixin AutoDispose on ChangeNotifier {
  final _changeNotifiers = <ChangeNotifier>[];
  final _streamSubscriptions = <StreamSubscription>[];

  void addDisposer(ChangeNotifier dispose) {
    _changeNotifiers.add(dispose);
  }

  void addStreamSubscription(StreamSubscription streamSubscription) {
    _streamSubscriptions.add(streamSubscription);
  }

  @override
  void dispose() {
    debugPrint(
        'AutoDispose#dispose _changeNotifiers:${_changeNotifiers.length}');
    debugPrint(
        'AutoDispose#dispose _streamSubscriptions:${_streamSubscriptions.length}');
    for (final streamSubscription in _streamSubscriptions) {
      streamSubscription?.cancel();
    }
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

extension AutoCancelStreamSubscription on StreamSubscription {
  void addDispose(AutoDispose autoDispose) {
    autoDispose.addStreamSubscription(this);
  }
}
