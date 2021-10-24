import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:todo/data/models/user.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  late UserModel _user;

  UserRepository(firebaseAuth)
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp(String email, String password, String userName) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    _user = UserModel(name: userName, email: email);

    FirebaseFirestore.instance
        .collection('Users')
        .doc(_firebaseAuth.currentUser!.uid)
        .set(_user.toJson());
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<UserModel> getUser() async {
    print(_firebaseAuth.currentUser!.uid);
    final DocumentSnapshot document = await FirebaseFirestore.instance
        .collection('Users')
        .doc(_firebaseAuth.currentUser!.uid)
        .get();

    return UserModel.fromJson(document);
  }
}
