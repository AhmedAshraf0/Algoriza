abstract class CounterStates {

}
class CounterInitailState extends CounterStates {//this isn't considered a state, i goes to it
  //i'm already on it
}
class CounterMinusState extends CounterStates {
  //i'm sending value with the state so i could use it later
  int counter;
  CounterMinusState(this.counter);
}
class CounterPlusState extends CounterStates {
  int counter;
  CounterPlusState(this.counter);
}
