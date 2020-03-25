import 'package:event_bus/event_bus.dart';

EventBus _eventBus;

EventBus get eventBus => _eventBus ??= EventBus();
