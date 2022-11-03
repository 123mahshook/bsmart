import 'package:bsmart/utilities/app_colors.dart';
import 'package:bsmart/utilities/font_utils.dart';
import 'package:bsmart/utilities/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {required this.label,
      this.controller,
      this.errorMessage,
      this.keyboardType,
      this.obscureText,
      this.textCapitalization,
      this.onTap,
      this.readOnly,
      this.maxLines,
      this.textInputAction,
      this.hint,
      this.autoFocus,
      this.enabled,
      this.maxLength,
      this.suffix,
      this.prefix,
      this.validator,
      this.scrollpadding,
      this.passwordField = false,
      this.onChanged});
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function? validator;
  final bool? obscureText;
  final String? errorMessage;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final Function? onTap;
  final int? maxLines;
  final bool? autoFocus;
  final String? hint;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final double? scrollpadding;
  final bool passwordField;
  final Function(String)? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final double _iconSize = 24;

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeUtils.getHeight(10)),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeUtils.getHeight(8)),
            child: TextFormField(
              readOnly: widget.readOnly ?? false,
              enabled: widget.enabled ?? true,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.words,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: widget.onChanged,
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
              validator: (value) {
                if (widget.validator != null && !widget.validator!(value)) {
                  return widget.errorMessage ??
                      "Please enter a valid ${widget.label.toLowerCase()}";
                }
                return null;
              },
              style: FontUtils.getFont16Style(
                  color: AppColors.fontGrey, fontWeight: FontWeight.w600),
              obscureText: widget.passwordField ? obscureText : false,
              controller: widget.controller,
              maxLines: widget.maxLines ?? 1,
              maxLength: widget.maxLength,
              obscuringCharacter: '*',
              keyboardType: widget.keyboardType,
              cursorColor: AppColors.primaryColor,
              scrollPadding: widget.scrollpadding != null
                  ? EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom +
                          widget.scrollpadding!)
                  : const EdgeInsets.all(0),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  counter: const SizedBox(),
                  fillColor: AppColors.white,
                  suffixIcon:
                      widget.passwordField ? passwordIcon() : widget.suffix,
                  prefixIcon: widget.prefix,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SizeUtils.getHeight(15),
                      horizontal: SizeUtils.getWidth(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: AppColors.primaryColor.withOpacity(0.3)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: AppColors.measureBorder),
                  ),
                  errorStyle: FontUtils.getFont12Style(color: Colors.red),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: AppColors.grey.withOpacity(0.3))),
                  hintText: widget.hint,
                  // labelText: label,
                  //labelStyle: TextStyle(color: AppColors.ONBORDING_TXT_COLOR),
                  //floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: FontUtils.getFont16Style(
                      fontWeight: FontWeight.w500, color: AppColors.lightGrey)),
            ),
          ),
          Container(
            color: AppColors.white,
            padding: EdgeInsets.only(bottom: SizeUtils.getHeight(1)),
            child: Text(
              "${widget.label}  ",
              style: FontUtils.getFont10Style(
                  fontWeight: FontWeight.w500, color: AppColors.grey),
            ),
          )
        ],
      ),
    );
  }

  Widget passwordIcon() {
    return IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: obscureText ? AppColors.fontGrey : AppColors.fontGrey,
        ));
  }
}
