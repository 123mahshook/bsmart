import 'package:bsmart/screens/login_screen/login_screen.dart';
import 'package:bsmart/screens/register_screen/register_screen.dart';
import 'package:bsmart/screens/splash_screen/splash_screen.dart';
import 'package:bsmart/screens/success_screen/success_screen.dart';
import 'package:flutter/material.dart';

class CommonNavigate {
  CommonNavigate({required this.parentContext});
  final BuildContext parentContext;

  navigateSplashScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const SplashScreen()));
  }

  navigateLoginScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  navigateRegisterScreen() {
    Navigator.push(parentContext,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  navigateSuccessScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const SuccessScreen()));
  }

  navigateServerError() {
    //ServerErrorDialog(parentContext: parentContext).show();
  }

  navigateNoInternet() {
    //NoInternetDialog(parentContext: parentContext).show();
  }
}
