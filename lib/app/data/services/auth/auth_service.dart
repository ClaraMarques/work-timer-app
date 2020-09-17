import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/user_model.dart';
import '../database/firestore_service.dart';
import 'auth_interface.dart';

class AuthService implements AuthInterface {
  GoogleSignIn _googleSignIn;
  FirestoreService _firestoreService;

  AuthService(FirestoreService firestoreService, {GoogleSignIn googleSignIn}) {
    assert(firestoreService != null);
    _firestoreService = firestoreService;
    _googleSignIn = googleSignIn ?? GoogleSignIn.standard();
  }

  @override
  User get loggedUser {
    final user = fb.FirebaseAuth.instance.currentUser;
    if (user != null) {
      final response = _firestoreService.getUser(user.uid);
      return response is User ? response : User.empty;
    }
    return User.empty;
  }

  @override
  Future<User> loginWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      return User.empty;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final fb.GoogleAuthCredential credential = fb.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await fb.FirebaseAuth.instance.signInWithCredential(credential);

    final user = userCredential.user?.toUser() ?? User.empty;
    final userCreated = await _firestoreService.createUser(user);

    if (!userCreated) {
      logOut();
      return User.empty;
    } else {
      return user;
    }
  }

  Future<void> logOut() async {
    await _googleSignIn.signOut();
    await fb.FirebaseAuth.instance.signOut();
  }
}

extension on fb.User {
  User toUser() {
    return User(
      id: this.uid,
      email: this.email,
      name: this.displayName,
      photo: this.photoURL,
    );
  }
}
