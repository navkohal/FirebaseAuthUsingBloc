import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_bloc_demo/bloc/auth_bloc.dart';
import 'package:firebase_authentication_bloc_demo/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to fetch the details of current user session
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(top: 60, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Email: ${user?.email}',
                style: TextStyle(color: Colors.blue),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 30,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(SignoutRequest());
                  },
                  child: const Text('Logout'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
