import 'package:bsmart/utilities/common_navigate.dart';
import 'package:bsmart/utilities/show_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailPasswordSignInProvider extends ChangeNotifier {
  User? _user;
  User get user => _user!;

  Future emailPassworLogin(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userDtCr = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      _user = FirebaseAuth.instance.currentUser!;

      if (userDtCr.user != null) {
        CommonNavigate(parentContext: context).navigateSuccessScreen();
      } else {
        ShowToast(
                title: "Sorry",
                message: "No user record Found",
                parentContext: context)
            .show();
      }
    } catch (e) {
      // TODO
      print(e);
      ShowToast(
              title: "Sorry",
              message: "No user record Found",
              parentContext: context)
          .show();
    }
    notifyListeners();
  }

  Future logout(BuildContext context) async {
    FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    CommonNavigate(parentContext: context).navigateSplashScreen();
  }
}
