import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'API/UserAuth.dart';
import 'Screens/Welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) =>
                  context.read<AuthenticationService>().authStateChanges,
              initialData: null)
        ],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(primary: Color(0xff8B0000), secondary: Color(0xff8B0000)),
          ),
          title: 'The tale',
          home: FutureBuilder(
            future: Firebase.initializeApp(),
            builder:
                (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
              return Welcome();
            },
          ),
        ));
  }
}
