import 'package:first_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController =  TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextFormField(
                    controller: emailController,
                      labelText: 'Email Address',
                      inputBorder: OutlineInputBorder(),
                      prefixIcon: Icons.email_outlined,
                      suffixIcon: null,
                      check: false,
                      textInputType: TextInputType.emailAddress,
                      function1: (value){
                        print(value);
                      },
                      function2: (value){
                        print(value);
                      },
                      validateFunction: (value){
                        if(value.isEmpty){
                          return 'Where is the fucken email!!';
                        }
                        return null;
                      },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextFormField(
                    controller: passwordController,
                      labelText: 'Password',
                      inputBorder: OutlineInputBorder(),
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.remove_red_eye,
                      check: true,
                      textInputType: TextInputType.visiblePassword,
                      function1: null,
                      function2: null,
                      validateFunction: (value){
                        if(value.isEmpty){
                          return 'motherfucker just enter more than 8 characters!!';
                        }
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultButton(
                      function: (){
                        if(formKey.currentState.validate()){
                          print(emailController);
                          print(passwordController);
                        }
                      },
                      text: 'LOGIN',
                    radius: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: (){},
                          child: Text(
                            'Register Now'
                          )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
