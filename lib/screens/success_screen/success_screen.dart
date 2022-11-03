import 'package:bsmart/provider/email_password_provider.dart';
import 'package:bsmart/utilities/app_colors.dart';
import 'package:bsmart/utilities/font_utils.dart';
import 'package:bsmart/utilities/size_utils.dart';
import 'package:bsmart/utilities/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  User? userData;
  @override
  Widget build(BuildContext context) {
    userData =
        Provider.of<EmailPasswordSignInProvider>(context, listen: false).user;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: Container(
              height: SizeUtils.getScreenHeight(),
              width: SizeUtils.getScreenWidth(),
              child: Column(children: [
                titleCard(),
                streamDt(userData!),
                Spacer(),
              ]),
            )));
  }

  Widget titleCard() {
    return SizedBox(
      width: SizeUtils.getScreenWidth(),
      child: Container(
        color: AppColors.prim1,
        width: SizeUtils.getScreenWidth(),
        child: Column(
          children: [
            verticalSpace(50),
            Text(
              "Account Opened Succefully",
              style: FontUtils.getFont10Style(
                  color: AppColors.white, fontWeight: FontWeight.w700),
            ),
            verticalSpace(20),
            Text(
              "SUCCESS",
              style: FontUtils.getFont32Style(
                  color: AppColors.brownishGreen, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  Widget streamDt(User user) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text(
              "Somthing Went Wrong",
              style: FontUtils.getFont10Style(
                  color: AppColors.red, fontWeight: FontWeight.w700),
            );
          } else if (snapshot.hasData) {
            return profileCard(
                user.displayName == null ? "" : user.displayName!, user.email!);
          } else {
            return profileCard(
              "",
              "",
            );
          }
        });
  }

  Widget profileCard(
    String name,
    String mail,
  ) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeUtils.getHeight(24),
          left: SizeUtils.getWidth(24),
          right: SizeUtils.getWidth(24)),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(24),
          Text(
            "PROFILE",
            style: FontUtils.getFont24Style(
                color: AppColors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w600),
          ),
          verticalSpace(24),
          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
            width: SizeUtils.getScreenWidth(),
            alignment: Alignment.center,
            child: Text(
              name,
              maxLines: 1,
              style: FontUtils.getFont16Style(
                  color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          ),
          verticalSpace(4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(24)),
            width: SizeUtils.getScreenWidth(),
            alignment: Alignment.center,
            child: Text(
              //"(208) 555-0112",
              mail,
              maxLines: 1,
              style: FontUtils.getFont12Style(
                  color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          ),
          verticalSpace(12),
          Center(
            child: SizedBox(
              height: SizeUtils.getHeight(24),
              width: SizeUtils.getHeight(100),
              child: TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  foregroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    //side: BorderSide(color: AppColors.BORDER_GREY),
                    borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
                  ),
                  padding: const EdgeInsets.all(0),
                  backgroundColor: AppColors.transparent,
                ),
                onPressed: () {
                  final provider = Provider.of<EmailPasswordSignInProvider>(
                      context,
                      listen: false);
                  provider.logout(context);
                },
                child: Text(
                  "Logout",
                  style: FontUtils.getFont12Style(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          verticalSpace(12),
          verticalSpace(24),
        ],
      ),
    );
  }
}
