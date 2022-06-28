import 'package:conditional_builder/conditional_builder.dart';
import 'package:first_app/modules/archieved/archieved.dart';
import 'package:first_app/modules/done_tasks/done_tasks.dart';
import 'package:first_app/modules/tasks_screen/tasks_screen.dart';
import 'package:first_app/shared/components/components.dart';
import 'package:first_app/shared/components/constants.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(//create database when creating the state
      create: (BuildContext context) => AppCubit()..createDatebase(),
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (BuildContext context , AppStates state) {
          if(state is AppInsertDatabaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if(cubit.isBottomSheetOpen){ // if it's open and i press, close it
                  if(formKey.currentState.validate()){
                    cubit.insertDatabase(title: titleController.text, time: timeController.text, date: dateController.text);
                    // insertDatabase(
                    //   title: titleController.text,
                    //   time: timeController.text,
                    //   date: dateController.text,
                    // ).then((value) {
                    //   getDataFromDatabase(database).then((value) {
                    //
                    //     // setState(() {
                    //     //   tasks = value;
                    //     //   floatIcon = Icons.edit;
                    //     //   isBottomSheetOpen = false;
                    //     // });
                    //   });
                    // });
                  }
                }else{//if it's closed open it and change the value to true
                  scaffoldKey.currentState.showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefaultTextFormField(
                              controller: titleController,
                              labelText: 'Task title',
                              inputBorder: OutlineInputBorder(),
                              textInputType: TextInputType.text,
                              validateFunction: (String value){
                                if(value.isEmpty){
                                  return 'title shouldn\'t be empty';
                                }
                                return null;//if it's not empty
                              },
                              prefixIcon: Icons.title,
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            DefaultTextFormField(
                              controller: timeController,
                              labelText: 'Task Time',
                              inputBorder: OutlineInputBorder(),
                              prefixIcon: Icons.access_time_outlined,
                              validateFunction: (String value){
                                if(value.isEmpty){
                                  return 'time shouldn\'t be empty' ;
                                }
                                return null;
                              },
                              textInputType: TextInputType.datetime,
                              onTapFunction: (){
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  print(value.format(context));
                                  timeController.text = value.format(context).toString();
                                });
                              },
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            DefaultTextFormField(
                              controller: dateController,
                              labelText: 'Task Date',
                              inputBorder: OutlineInputBorder(),
                              prefixIcon: Icons.calendar_today,
                              validateFunction: (String value){
                                if(value.isEmpty){
                                  return 'date shouldn\'t be empty' ;
                                }
                                return null;
                              },
                              textInputType: TextInputType.datetime,
                              onTapFunction: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2022-02-22'),
                                ).then((value) {
                                  print(DateFormat.yMMMd().format(value));
                                  dateController.text = DateFormat.yMMMd().format(value);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  ).closed.then((value) {
                    //i don't need navigator with pop because i close it with my hand not using back button
                    cubit.changeBottomSheetState(isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(
                cubit.floatIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              elevation: 10.0,
              type: BottomNavigationBarType.fixed,
              onTap: (index){
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Menu',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archive',
                ),
              ],
            ),
          );
        }
      ),
    );
  }

}

