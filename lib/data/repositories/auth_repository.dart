import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{

  // establishing instance of firebase auth
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> Signup({required String email , required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        throw Exception('The password provided is too weak');
      }else if(e.code == 'email-already-in-use'){
        throw Exception('Account already exist for that email.');
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }



  Future<void> Signin({required String email , required String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        throw Exception('User not found');
      }else if(e.code == 'wrong-password'){
        throw Exception('Wrong Password given');
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }



  Future<void> Signout() async{
    try{
      await _firebaseAuth.signOut();
    }catch(e){
      throw Exception(e.toString());
    }
  }
}