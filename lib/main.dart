import 'package:firebase_authentication_bloc_demo/bloc/auth_bloc.dart';
import 'package:firebase_authentication_bloc_demo/data/repositories/auth_repository.dart';
import 'package:firebase_authentication_bloc_demo/presentation/home_screen.dart';
import 'package:firebase_authentication_bloc_demo/presentation/login_screen.dart';
import 'package:firebase_authentication_bloc_demo/presentation/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';


// THIS IS TO INTILIZE THE FIREBASE IN APP THROUGH MAIN FUNCTION
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

          /**  here user is imported
           *  from Firebase auth package  **/
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return HomeScreen();
              }

              return LoginScreen();
            }
          ),
        ),
      ),
    );

    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: LoginScreen(),
    // );
  }
}

