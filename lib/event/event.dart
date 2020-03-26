import 'package:event_bus/event_bus.dart';

class EventBusExt extends EventBus {
  static final EventBusExt _instance = EventBusExt._internal();

  factory EventBusExt() => _instance;

  EventBusExt._internal();
}
