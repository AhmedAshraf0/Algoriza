import 'package:bloc/bloc.dart';
import 'package:first_app/modules/archieved/archieved.dart';
import 'package:first_app/modules/done_tasks/done_tasks.dart';
import 'package:first_app/modules/tasks_screen/tasks_screen.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  //why because we are going to listen on them
  int currentIndex = 0;
  Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  bool isBottomSheetOpen = false;
  IconData floatIcon = Icons.edit;

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archieved'
  ];
  List<Widget> screens = [
    Tasks_Screen(),
    Done_Tasks(),
    Archieved(),
  ];

  void changeIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatebase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database , version){
        print("database is created");
        database.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, data TEXT, time TEXT, status TEXT)',
        ).then((value){
          print('table is created');
        }).catchError((error){
          print('Error is here ${error.toString()}');
        });
      },
      onOpen: (database){
        getDataFromDatabase(database);
        print("database is opened");
      },
    ).then((value) {//i want to make sure that it's opened then change the state
      database = value;
      emit(AppCreateDatabaseState());
    });
  }
  insertDatabase({
    @required String title,
    @required String time,
    @required String date,
  }) async{
     await database.transaction((txn){
      txn.rawInsert('INSERT INTO tasks(title, data, time, status)VALUES("$title", "$date", "$time", "New")').
      then((value) {
        print("$value Inserted successfully");
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).
      catchError((error){
        print("Error in insertion ${error.toString()}");
      });
      return null;
    });
  }
  void getDataFromDatabase(database){
    emit(AppGetDatabaseLoadingState());

    //i want to take the list and work with it so i returned it directly
    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element) {
        if(element['status'] == 'New')
          newTasks.add(element);
        else if(element['status'] == 'done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);
      });
      emit(AppGetDatabaseState());
    });
  }

  void updateData({
    @required String status,
    @required int id,
}) async
  {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id],//list of values of the states and the id
    ).then((value) {
      emit(AppUpdateDatabaseState());
    });

  }
  
  void changeBottomSheetState({
  @required bool isShow, @required IconData icon,
})
  {
    isBottomSheetOpen = isShow;
    floatIcon = icon;

    emit(AppChangeBottomSheetState());
  }
}
