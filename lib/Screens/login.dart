import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../API/UserAuth.dart';
import 'home.dart';

class login extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
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
                "Login",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.supervised_user_circle,color: Color(0xff8B0000),),
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
              SizedBox(height: 40,),
              SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      child: const Text("Login"),
                      onPressed: () async {
                        await context
                            .read<AuthenticationService>()

                            .signIn(
                            email: email.value.text.trim(),
                            password: pass.value.text.trim());
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),(Route<dynamic> route) => false
                        );

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
