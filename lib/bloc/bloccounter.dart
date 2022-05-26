import 'dart:async';

import 'package:bloc/bloc/blocevent.dart';

class CounterBloc {
  int _counter = 0;
  final StreamController<int> _counterStatestController =
      StreamController<int>();
  StreamSink<int> get _intCounter => _counterStatestController.sink;
  Stream<int> get counter => _counterStatestController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;
}
