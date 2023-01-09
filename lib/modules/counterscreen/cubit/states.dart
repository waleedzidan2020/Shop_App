abstract  class CounterStates {}

class CounterInitState extends CounterStates{}
class CounterMinusState extends CounterStates{}
class CounterPlusState extends CounterStates{
  final int Counter;
  CounterPlusState(this.Counter);
}
class CounterResetState extends CounterStates{}


