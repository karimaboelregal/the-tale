import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../API/UserAuth.dart';

class Register extends StatelessWidget {
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController pass1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Image.asset("images/logo.png"),
                  const Text(
                    "Register",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: user,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.supervised_user_circle,color: Color(0xff8B0000),),
                          iconColor: Color(0xff8B0000),
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Color(0xff8B0000)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff8B0000)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff8B0000)),
                          ),
                          focusColor: Color(0xff8B0000)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.mail,color: Color(0xff8B0000),),
                          iconColor: Color(0xff8B0000),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xff8B0000)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff8B0000)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff8B0000)),
                          ),
                          focusColor: Color(0xff8B0000)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: pass,
                      obscureText: true,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.password,color: Color(0xff8B0000),),
                          iconColor: Color(0xff8B0000),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Color(0xff8B0000)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff8B0000)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff8B0000)),
                          ),
                          focusColor: Color(0xff8B0000)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: pass1,
                      obscureText: true,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.password_rounded,color: Color(0xff8B0000),),
                          iconColor: Color(0xff8B0000),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Color(0xff8B0000)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff8B0000)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff8B0000)),
                          ),
                          focusColor: Color(0xff8B0000)),
                    ),
                  ),

                  SizedBox(height: 40,),
                  SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                          child: const Text("Register"),
                          onPressed: () async {
                            if (pass1.value.text != pass.value.text) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text("Passwords dont match")));
                            } else {
                              await context
                                  .read<AuthenticationService>()
                                  .signUp(
                                  email: email.value.text.trim(),
                                  password: pass.value.text.trim(), name: user.value.text.trim());
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xff8B0000))))),

                ],
              ),
            ),
          ),
        ));
  }
}
