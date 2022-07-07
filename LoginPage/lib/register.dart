import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class RegisterScreen extends StatefulWidget {

  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool secure = true;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/desk.jpg',
                height: 100.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Text(
                      'Welcome to Fashion Daily',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 34.0,
                          ),
                        ),
                        TextButton(
                          child: Row(
                            children: const [
                              Text(
                                'Help',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Icon(
                                Icons.help,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          debugPrint("Error!!");
                          return "Email isn't registered.";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Eg: example@email.com',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        debugPrint(value.toString());
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          debugPrint("Error!!");
                          return "Phone number isn't registered.";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Eg: 0111-111-1111',
                        border: const OutlineInputBorder(),
                        prefixIcon: CountryCodePicker(
                          initialSelection: 'EG',
                          favorite: const ['+20', 'EG'],
                          showFlagMain: false,
                          alignLeft: false,
                          showDropDownButton: true,
                          textStyle: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                          padding: const EdgeInsets.all(0),
                        ),
                      ),
                      onChanged: (value) {
                        debugPrint(value.toString());
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          debugPrint("Error!!");
                          return "You must enter password!";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: secure,
                      decoration: InputDecoration(
                        hintText: 'password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: () {
                            setState(() {
                              (secure)? secure = false: secure = true;
                            });
                            debugPrint("$secure");
                          },
                        ),
                      ),
                      onChanged: (value) {
                        debugPrint(value.toString());
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            debugPrint("available");
                          }
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        color: const Color(0xFF3586FF),
                        minWidth: double.infinity,
                        height: 50.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        const Text('Or'),
                        const SizedBox(
                          width: 30.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SignInButton(
                        Buttons.GoogleDark,
                        elevation: 0.0,
                        text: "Sign up with Google",
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Doesn't have any account?",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {  },
                          child: const Text(
                            "Register Here",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Text(
                      "Use the application according to policy rules. Any kinds of violations will be subject to sanctions.",
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
