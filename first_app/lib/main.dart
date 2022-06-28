import 'package:bloc/bloc.dart';
import 'package:first_app/layout/home_layout.dart';
import 'package:first_app/modules/bmi/bmi_screen.dart';
import 'package:first_app/modules/counter/cubit.dart';
import 'package:first_app/modules/counter/interactive-screen.dart';
import 'package:first_app/modules/login/login_page.dart';
import 'package:first_app/modules/messenger/messenger.dart';
import 'package:first_app/modules/users/users_screen.dart';
import 'package:first_app/shared/MyBlocObserver.dart';
import 'package:flutter/material.dart';

import 'modules/bmi_result/bmi_result_screen.dart';
import 'modules/home/home_screen.dart';

void main() {
  BlocOverrides.runZoned(
        () {
          runApp(MyApp());
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }

}