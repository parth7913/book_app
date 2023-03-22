import 'package:firebase_auth/firebase_auth.dart';

class FireHelper {
  FireHelper._();

  static FireHelper fireHelper = FireHelper._();

  Future<bool> signUpUser(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    bool isRegister = false;

    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      isRegister = true;
      print("Success");
    }).catchError((error) {
      isRegister = false;
      print(error);
    });
    return isRegister;
  }

  Future<bool> signInUser(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    bool isLogin = false;

    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      isLogin = true;
    }).catchError((error) {
      isLogin = false;
    });
    return isLogin;
  }

  Future<bool> checkUser() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    if(await firebaseAuth.currentUser!=null){
      return true;
    }
    return false;
  }
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
