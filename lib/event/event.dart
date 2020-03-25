import 'package:event_bus/event_bus.dart';

EventBus _eventBus = EventBus();

EventBus get eventBus {
  return _eventBus ??= EventBus();
}
