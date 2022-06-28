import 'package:first_app/models/users/users_modet.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: 'Ahmed Ashraf', phone: '01204114144'),
    UserModel(id: 2, name: 'Mahmoud Khalid', phone: '01204114144'),
    UserModel(id: 3, name: 'Mahmoud Mash3al', phone: '01204114144'),
    UserModel(id: 4, name: 'Youssef Ali', phone: '01204114144'),
    UserModel(id: 5, name: 'Dr. Shreif sheifo', phone: '01204114144'),
    UserModel(id: 6, name: 'Ahmed Ashraf', phone: '01204114144'),
    UserModel(id: 7, name: 'Mahmoud Khalid', phone: '01204114144'),
    UserModel(id: 8, name: 'Mahmoud Mash3al', phone: '01204114144'),
    UserModel(id: 9, name: 'Youssef Ali', phone: '01204114144'),
    UserModel(id: 10, name: 'Dr. Shreif sheifo', phone: '01204114144'),
    UserModel(id: 11, name: 'Dr. Shreif sheifo', phone: '01204114144'),
    UserModel(id: 12, name: 'Dr. Shreif sheifo', phone: '01204114144'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context , index) => buildUserItem(users[index]),
          separatorBuilder: (context , index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.black,
          ),
          itemCount: users.length,
      ),
    );
  }
  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 23.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
        SizedBox(
          width: 20.0 ,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
