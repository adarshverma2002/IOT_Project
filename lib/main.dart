import 'package:blue/screens/homePage.dart';
import 'package:blue/screens/loginPage.dart';
import 'package:blue/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider<FirebaseAuthMethods>(
        create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
      ),
      StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null)
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthWrapper(),
    );
  }
}

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder<User?>(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return powerUnitScreen();
//               } else {
//                 return loginPage();
//               }
//             }));
//   }
// }

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      return const powerUnitScreen();
    }
    return const loginPage();
  }
}
