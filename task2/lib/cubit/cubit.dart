import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitialState());
  static CounterCubit get(BuildContext context) => BlocProvider.of(context);

  int counter = 0;

  void minus(){
    --counter;
    emit(CounterDecrementState());
  }

  void plus(){
    ++counter;
    emit(CounterIncrementState());
  }
}