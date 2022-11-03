import 'dart:io';

import 'package:bsmart/provider/email_password_provider.dart';
import 'package:bsmart/screens/login_screen/login_screen_vm.dart';
import 'package:bsmart/utilities/app_colors.dart';
import 'package:bsmart/utilities/form_validators.dart';
import 'package:bsmart/utilities/no_glow_scroll_behaviour.dart';
import 'package:bsmart/utilities/size_utils.dart';
import 'package:bsmart/utilities/utils.dart';
import 'package:bsmart/widgets/card_clipper.dart';
import 'package:bsmart/widgets/custom_circular_loader.dart';
import 'package:bsmart/widgets/custom_text_field.dart';
import 'package:bsmart/widgets/footer_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenVM viewModel = LoginScreenVM();

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: Platform.isIOS ? false : true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ScrollConfiguration(
            behavior: NoGlowScrollBehaviour(),
            child: Container(
              color: AppColors.white,
              height: SizeUtils.getScreenHeight(),
              width: SizeUtils.getScreenWidth(),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    SizedBox(
                      height: SizeUtils.getHeight(420),
                      width: SizeUtils.getScreenWidth(),
                      child: Image.asset(
                        Utils.getAssetJpg("img_login"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeUtils.getHeight(380)),
                      child: ClipPath(
                        clipper: CardClipper(),
                        child: Container(
                          color: AppColors.white,
                          width: SizeUtils.getScreenWidth(),
                          padding: EdgeInsets.only(
                            left: SizeUtils.getWidth(24),
                            right: SizeUtils.getWidth(24),
                            top: SizeUtils.getHeight(24),
                            bottom: SizeUtils.getHeight(24),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Image.asset(
                                  Utils.getAssetPng("logo_splash"),
                                  height: SizeUtils.getHeight(90),
                                ),
                                verticalSpace(30),
                                CustomTextField(
                                  label: "Email",
                                  controller: _emailController,
                                  textCapitalization: TextCapitalization.none,
                                  keyboardType: TextInputType.name,
                                  scrollpadding: SizeUtils.getHeight(150),
                                  validator: (value) {
                                    return TextFieldValidation.emailValidate(
                                        value);
                                  },
                                ),
                                verticalSpace(25),
                                CustomTextField(
                                  label: "Password",
                                  keyboardType: TextInputType.visiblePassword,
                                  passwordField: true,
                                  textCapitalization: TextCapitalization.none,
                                  controller: _passwordController,
                                  scrollpadding: SizeUtils.getHeight(150),
                                  validator: (value) {
                                    return TextFieldValidation.emptyValidate(
                                        value);
                                  },
                                ),
                                verticalSpace(30),
                                _footerButton(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _footerButton() {
    return StreamBuilder<bool>(
        initialData: false,
        stream: viewModel.getLoaderStream,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return snapshot.data!
              ? Center(
                  child: CustomCircularLoader(),
                )
              : FooterButton(
                  label: "Login",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      viewModel.authFirebaseEmailPassword(
                          _emailController.text, _passwordController.text);
                    }
                  },
                );
        });
  }
}
