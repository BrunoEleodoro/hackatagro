import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackatagro/services/safety/change_notifier_safety.dart';

class FirebaseAuthProvider extends ChangeNotifierSafety {
  final FirebaseAuth _firebaseAuth;

  User? user;
  bool isAuthenticated = false;

  FirebaseAuthProvider(this._firebaseAuth) {
    checkUserChanges();
    user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('User is currently signed out!');
      isAuthenticated = false;
    } else {
      print('User is signed in!');
      isAuthenticated = true;
    }
    notifyListeners();
  }

  void checkUserChanges() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      this.user = user;
      if (user == null) {
        print('User is currently signed out!');
        isAuthenticated = false;
      } else {
        print('User is signed in!');
        isAuthenticated = true;
      }
      notifyListeners();
    });
  }

  Future<void> signOut() async {
    this.isAuthenticated = false;
    this.user = null;
    await _firebaseAuth.signOut();
    notifyListeners();
  }

  Future<String?> signIn(String name, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: name, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      // await _firebaseAuth.currentUser!.sendEmailVerification();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> recover(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return "Enviado com sucesso!";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  @override
  void resetState() {}
}
