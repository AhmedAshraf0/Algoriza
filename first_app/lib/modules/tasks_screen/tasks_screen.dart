import 'package:first_app/shared/components/components.dart';
import 'package:first_app/shared/components/constants.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tasks_Screen extends StatelessWidget {
  Tasks_Screen();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state) {

      },
      builder: (context , state) {
        var tasks = AppCubit.get(context).newTasks;
        return ListView.separated( //when i pass index of list that's a map value
          itemBuilder: (context , index) => BuildTaskItem(tasks[index] , context),
          separatorBuilder: (context , index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: tasks.length,
        );
      },
    );
  }
}
