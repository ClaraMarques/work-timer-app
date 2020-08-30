import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/user_model.dart';

import 'auth_interface.dart';

class AuthService implements AuthInterface {
  @override
  User get loggedUser {
    return fb.FirebaseAuth.instance.currentUser?.toUser() ?? User.empty;
  }

  @override
  Future<User> loginWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

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

    return userCredential.user?.toUser() ?? User.empty;
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
