import 'package:dartist_app/model/category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseCurrentUser {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  static User user;

  User get currentUser {
    if (user != null) {
      return user;
    }

    final User currentUser = _auth.currentUser;
    user = currentUser;
    return currentUser;
  }

  Future<void> signOut() async {
    return _auth.signOut().then((value) {
      user = null;
    });
  }

  void updateUserData(User user) async {
    if (user == null) return;
    DocumentReference ref = _firestore.collection('users').doc(user.uid);

    return ref.set({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoURL,
      'displayName': user.displayName,
      'lastSeen': DateTime.now(),
    });
  }

  Future<void> addCategory(Category category) async {
    List<String> selectedCategories = [];
    for (int i = 0; i < category.categoryList.length; i++) {
      if (category.categoryBool[i]) {
        selectedCategories.add(category.categoryList[i]);
      }
    }
    DocumentReference ref = _firestore.collection('users').doc(user.uid);
    DocumentSnapshot doc = await ref.get();

    ref.update({
      'categories': selectedCategories,
    });
  }
}
