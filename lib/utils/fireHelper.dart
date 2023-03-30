import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireHelper {
  FireHelper._();

  static FireHelper fireHelper = FireHelper._();
  String? Uid;

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
    bool isLogin = false;
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

  // add data
  Future<bool> insertdata(String bname, String bimage, String authorname,
      String aboutAuthor, String addbook, String Rating, String Pyear) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    bool isbook = false;
    await firebaseFirestore.collection("Book").doc(Uid).collection("Bk").add({
      "bname": bname,
      "bimage": bimage,
      "authorname": authorname,
      "aboutauthor": aboutAuthor,
      "addook": addbook,
      "Rating": Rating,
      "Publish_Year": Pyear
    }).then((value) {
      isbook = true;
    }).catchError((error) {
      isbook = false;
    });
    return isbook;
  }

  // get data
  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore.collection("Book").doc(Uid).collection("Bk").snapshots();
  }

// Delete data
  void deleteData(String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Book").doc(Uid).collection("Bk").doc(id).delete();
  }

  // update data
  void UpdateData(String id, String name) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Book")
        .doc(Uid)
        .collection("Bk")
        .doc(id)
        .update({"name": name});
  }

  // Uri Id
  void UserData() {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User? user = firebaseAuth.currentUser;
    Uid = user!.uid;
  }
}
