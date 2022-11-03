import 'package:bsmart/utilities/app_colors.dart';
import 'package:bsmart/utilities/size_utils.dart';
import 'package:bsmart/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? onTap;
  const CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getHeight(34),
      width: SizeUtils.getWidth(54),
      child: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(18)),
            ),
            padding: EdgeInsets.all(0),
            backgroundColor: AppColors.transparent,
          ),
          onPressed: onTap ??
              () {
                Navigator.pop(context);
              },
          child: SvgPicture.asset(Utils.getAssetSvg("back"))),
    );
  }
}
