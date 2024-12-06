import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> regis(
    String email,
    String password,
    String username,
  ) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set(
        {
          'email': email,
          'username': username,
        },
      );
    }
  }

  Future<void> login(String email, String password) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
