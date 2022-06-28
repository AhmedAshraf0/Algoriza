import 'package:first_app/modules/counter/cubit.dart';
import 'package:first_app/modules/counter/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InteractiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if(state is CounterPlusState) print('that is plus state: ${state.counter}');
          if(state is CounterMinusState) print('that is minus state: ${state.counter}');
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(
                'Interactive'
            ),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    CounterCubit.get(context).minus();
                    print('Counter is : ${CounterCubit.get(context).ctr}');
                  },
                  child: Text("MINUS"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0
                  ),
                  child: Text(
                    '${CounterCubit.get(context).ctr}',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    CounterCubit.get(context).plus();
                    print('Counter is : ${CounterCubit.get(context).ctr}');
                  },
                  child: Text("PLUS"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


