import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
            'First App'
        ),
        actions: [
          IconButton( //requires 2 params icon which is a widget
            icon: Icon(
              Icons.notification_important, //icon takes a widget which is Icon which is required icon data
            ),
            onPressed: (){
              print("0: Notification");
            },
          ),
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: (){
            print("There is nothing to search about");
          })
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 200.0,
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'images/flower.jpg',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.3),
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: Text(
                      'Flower',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}