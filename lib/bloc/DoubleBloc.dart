import 'dart:async';

import 'package:counter/couter_repository.dart';

class DoubleBase {}
class DoubleEvent extends DoubleBase{}
class ClearEvent extends DoubleBase{}
class FetchEvent extends DoubleBase{}

class DoubleBloc {
  CounterRepository _counterRepository = CounterRepository();
  StreamController <DoubleBase>_input = new StreamController();
  StreamController <int> _output       = StreamController();

  Stream<int> get counterStream => _output.stream;
  StreamSink <DoubleBase> get sendEvent => _input.sink;

  DoubleBloc () {
    _input.stream.listen(_onEvent) ;
  }
  void dispose () {
    _input.close();
    _output.close();

  }

  void _onEvent(DoubleBase event) {
    if (event is DoubleEvent) {
      _counterRepository.double();
    }
    if (event is ClearEvent)
      _counterRepository.clear();

    _output.add(_counterRepository.count);
  }

}