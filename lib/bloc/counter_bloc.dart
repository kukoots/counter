import 'dart:async';

import '../couter_repository.dart';

class IncrementCunter extends CounterBase {}
class ClearCounter extends CounterBase {}
class FetchCounter extends CounterBase{}

class CounterBloc{

  CounterRepository _counterRepository = CounterRepository();
  StreamController <CounterBase>_input = new StreamController();
  StreamController <int> _output       = StreamController();

  Stream<int> get counterStream => _output.stream;
  StreamSink <CounterBase> get sendEvent => _input.sink;



  CounterBloc () {

    _input.stream.listen(_onEvent) ;
  }
  void dispose () {
    _input.close();
    _output.close();

  }

  void _onEvent(CounterBase event) {
    if (event is IncrementCunter) {
     _counterRepository.increment();
    }
    if (event is ClearCounter)
      _counterRepository.clear();
   
    _output.add(_counterRepository.count);
  }
}

class CounterBase {}

