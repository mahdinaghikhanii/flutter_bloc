import 'dart:async';

import 'blocevent.dart';

class CounterBloc {
  int _counter = 0;
  final StreamController<int> _counterStatestController =
      StreamController<int>();
  StreamSink<int> get _inCounter => _counterStatestController.sink;
  Stream<int> get counter => _counterStatestController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }
  void _mapEventToState(CounterEvent event) {
    if (event == CounterEvent.incerment) {
      _counter++;
    } else {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStatestController.close();
    _counterEventController.close();
  }
}
