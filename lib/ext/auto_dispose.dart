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
        '[AutoDispose]_changeNotifiers:${_changeNotifiers.length}');
    debugPrint(
        '[AutoDispose]_streamSubscriptions:${_streamSubscriptions.length}');
    for (final streamSubscription in _streamSubscriptions) {
      debugPrint('[AutoDispose]cancel [$streamSubscription]');
      streamSubscription?.cancel();
    }
    for (final notifier in _changeNotifiers) {
      debugPrint('[AutoDispose]dispose [$notifier]');
      notifier?.dispose();
    }
    super.dispose();
  }
}

extension AutoDisposeChangeNotifier on ChangeNotifier {
  ChangeNotifier addDispose(AutoDispose autoDispose) {
    autoDispose.addDisposer(this);
    return this;
  }
}

extension AutoCancelStreamSubscription on StreamSubscription {
  StreamSubscription addDispose(AutoDispose autoDispose) {
    autoDispose.addStreamSubscription(this);
    return this;
  }
}
