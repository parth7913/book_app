import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

    if (await firebaseAuth.currentUser != null) {
      return true;
    }
    return false;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> signInWithGoogle() async {
    bool isLogin=false;
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      isLogin = true;
    }).catchError((error) {
      isLogin = false;
    });
    return isLogin;
  }
}
