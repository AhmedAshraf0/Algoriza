import 'package:bloc/bloc.dart';
import 'package:first_app/modules/counter/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitailState());
  //this line to save code so i could use object of this class anywhere so i could
  //use its attributes
  //its static so i could use the method without creating object
  //it's from type of the class so i could return object of me through block provide
  static CounterCubit get(context) => BlocProvider.of(context);
  int ctr = 1;
  void minus(){
    ctr--;
    emit(CounterMinusState(ctr));
  }
  void plus(){
    ctr++;
    emit(CounterPlusState(ctr));
  }
}