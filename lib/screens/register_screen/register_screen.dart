import 'dart:io';

import 'package:bsmart/screens/register_screen/register_screen_vm.dart';
import 'package:bsmart/utilities/app_colors.dart';
import 'package:bsmart/utilities/common_navigate.dart';
import 'package:bsmart/utilities/font_utils.dart';
import 'package:bsmart/utilities/form_validators.dart';
import 'package:bsmart/utilities/no_glow_scroll_behaviour.dart';
import 'package:bsmart/utilities/size_utils.dart';
import 'package:bsmart/utilities/utils.dart';
import 'package:bsmart/widgets/card_clipper.dart';
import 'package:bsmart/widgets/custom_back_button.dart';
import 'package:bsmart/widgets/custom_circular_loader.dart';
import 'package:bsmart/widgets/custom_text_field.dart';
import 'package:bsmart/widgets/footer_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenVM viewModel = RegisterScreenVM();

  final _passwordController = TextEditingController();
  final _confPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confPasswordController.dispose();
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
                        Utils.getAssetJpg("img_reg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeUtils.getHeight(220)),
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
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: "Let's create an account",
                                    style: FontUtils.getFont18Style(
                                      color: AppColors.fontGrey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '.',
                                          style: FontUtils.getFont18Style(
                                              color: AppColors.primaryColor)),
                                    ],
                                  ),
                                ),
                                verticalSpace(25),
                                CustomTextField(
                                  label: "Email",
                                  controller: _emailController,
                                  textCapitalization: TextCapitalization.none,
                                  keyboardType: TextInputType.emailAddress,
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
                                verticalSpace(25),
                                CustomTextField(
                                  label: "Confirm Password",
                                  keyboardType: TextInputType.visiblePassword,
                                  passwordField: true,
                                  textCapitalization: TextCapitalization.none,
                                  controller: _confPasswordController,
                                  scrollpadding: SizeUtils.getHeight(150),
                                  validator: (value) {
                                    return TextFieldValidation
                                        .confirmPasswordValidate(
                                            value, _passwordController.text);
                                  },
                                ),
                                verticalSpace(30),
                                _footerButton(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeUtils.getWidth(24),
                        top: SizeUtils.getHeight(24),
                      ),
                      child: CustomBackButton(),
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
                  label: "Register",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      viewModel.registerEmailPassword(
                          _emailController.text, _passwordController.text);
                    }
                  },
                );
        });
  }
}
