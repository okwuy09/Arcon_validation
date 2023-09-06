import 'package:arcon_app/component/style.dart';
import 'package:arcon_app/constant.dart';
import 'package:arcon_app/model/user.dart';
import 'package:arcon_app/view/authentication/signin.dart';
import 'package:arcon_app/view/homepage/print_screen.dart';
import 'package:arcon_app/view/homepage/validation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserController with ChangeNotifier {
  Users userName = Users(
    name: '',
    email: '',
    id: '',
  );

  /// fetch user current profile
  Future<Users> fetchUser(
      {required String userID, required BuildContext context}) async {
    try {
      var userDoc = await firebaseStore.collection('users').doc(userID).get();
      if (userDoc.exists) {
        userName = Users.fromJson(userDoc.data()!);
        notifyListeners();
        if (userName.hasBeenValidated) {
          // ignore: use_build_context_synchronously
          validatedDialog(context, userName.name);
          userName = Users(name: '', email: '', id: '');
          notifyListeners();
        } else {
          var status =
              userName.details['speaker'] == 'Yes' ? 'Speaker' : 'Member';
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => PrintScreen(userName.name, status),
            ),
          );
        }
      } else {
        // ignore: use_build_context_synchronously
        inValidUserDialog(context);
        userName = Users(name: '', email: '', id: '');
        notifyListeners();
      }
      return userName;
    } on FirebaseException catch (e) {
      // ignore: use_build_context_synchronously
      return failedOperation(
        context: context,
        message: e.message!,
      );
    }
  }

  // signIn function with firebase
  bool isSignIn = false;
  Future<String?> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isSignIn = true;
      notifyListeners();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) => {
                isSignIn = false,
                notifyListeners(),
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ValidationScreen(),
                  ),
                ),
              });

      return 'Success';
    } on FirebaseAuthException catch (e) {
      isSignIn = false;
      notifyListeners();
      // ignore: use_build_context_synchronously
      return failedOperation(
        context: context,
        message: e.message!,
      );
    }
  }

  // signUp function with firebase
  bool isSignUp = false;
  Future signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isSignUp = true;
      notifyListeners();
      var userdata = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          )
          .then(
            (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const ValidationScreen(),
              ),
            ),
          );

      isSignUp = false;
      notifyListeners();
      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(userdata.credential!);
    } on FirebaseAuthException catch (e) {
      isSignUp = false;
      notifyListeners();
      // ignore: use_build_context_synchronously
      return failedOperation(
        context: context,
        message: e.message!,
      );
    }
  }

  // update user profile for validation
  Future<void> updateValidatedUser({
    required BuildContext context,
  }) async {
    try {
      firebaseStore.collection('users').doc(userName.id).update({
        'hasBeenValidated': true,
      });
    } on FirebaseAuthException catch (e) {
      return failedOperation(
        context: context,
        message: e.message!,
      );
    }
  }

  // Reset password
  bool isResetPassword = false;
  Future resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      isResetPassword = true;
      notifyListeners();
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.trim())
          .then(
            (value) => Navigator.pop(context),
          );
      isResetPassword = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      isResetPassword = false;
      notifyListeners();
      // ignore: use_build_context_synchronously
      return failedOperation(
        context: context,
        message: e.message!,
      );
    }
  }

  // signOut fuction with firebase
  Future<void> signOut({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut().then(
          (value) => Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(pageBuilder: (BuildContext context,
                  Animation animation, Animation secondaryAnimation) {
                return const SignIn();
              }, transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              }),
              (Route route) => false),
        );
  }
}
