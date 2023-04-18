import 'package:flutter/material.dart';
import 'package:thetale/Screens/register.dart';

import 'login.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/audio.gif"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              Image.asset("images/logo.png"),
              const SizedBox(
                height: 190,
              ),
              const Text("Listen to any kind of stories from anywhere",
                  style: TextStyle(
                    fontSize: 18,
                  )),
              const SizedBox(height: 30),
              const Text("New to this app?",
                  style: TextStyle(
                    fontSize: 28,
                  )),
              const SizedBox(height: 10),
              SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      child: const Text("Join now"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff8B0000))))),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("or already a member? ",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  InkWell(
                    child: const Text("Login now",
                        style: TextStyle(fontSize: 15, color: Color(0xff8B0000))),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
