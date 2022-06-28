import 'package:flutter/material.dart';

class UserModel{
  //each object will have its attributes final so it's couldn't be edited
  final int id;
  final String name;
  final String phone;
  UserModel({
    @required this.id,
    @required this.name,
    @required this.phone,
  });
}