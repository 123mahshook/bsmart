import 'package:bsmart/utilities/app_colors.dart';
import 'package:bsmart/utilities/common_navigate.dart';
import 'package:bsmart/utilities/font_utils.dart';
import 'package:bsmart/utilities/size_utils.dart';
import 'package:bsmart/utilities/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  void initState() {
    super.initState();
    navigatetoLogin();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    SizeUtils.setSize(screenHeight, screenWidth);

    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: Container(
              height: screenHeight,
              width: screenWidth,
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.getWidthonSplash(24, screenWidth),
                vertical: SizeUtils.getHeightonSplash(24, screenHeight),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    Utils.getAssetPng("logo_splash"),
                    height: SizeUtils.getHeightonSplash(280, screenHeight),
                  ),
                  const Spacer(),
                  Text(
                    "Empowering the Future.",
                    style: FontUtils.getFont12Style(
                        color: AppColors.black, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )));
  }

  Future<void> navigatetoLogin() async {
    await Future.delayed(const Duration(seconds: 5));
    CommonNavigate(parentContext: context).navigateLoginScreen();
  }
}
