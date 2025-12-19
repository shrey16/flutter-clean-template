import 'package:injectable/injectable.dart';

import '../models/counter_model.dart';

abstract class CounterLocalDataSource {
  Future<CounterModel> getCounter();
  Future<CounterModel> incrementCounter();
}

@LazySingleton(as: CounterLocalDataSource)
class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  int _value = 0;

  @override
  Future<CounterModel> getCounter() async {
    return CounterModel(value: _value);
  }

  @override
  Future<CounterModel> incrementCounter() async {
    _value += 1;
    return CounterModel(value: _value);
  }
}
