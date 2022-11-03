import 'package:bsmart/utilities/app_colors.dart';
import 'package:bsmart/utilities/font_utils.dart';
import 'package:bsmart/utilities/size_utils.dart';
import 'package:bsmart/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FooterButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Widget? trailing;
  final Color? color;

  const FooterButton(
      {Key? key,
      required this.label,
      required this.onTap,
      this.trailing,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(50)),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.primaryColor,
                AppColors.prim1,
              ])),
      child: SizedBox(
        height: SizeUtils.getHeight(50),
        width: SizeUtils.getScreenWidth(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: AppColors.transparent,
              foregroundColor: color ?? AppColors.white,
              elevation: 0,
              backgroundColor: AppColors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeUtils.getRadius(50)),
              ),
              padding: EdgeInsets.only(
                  left: SizeUtils.getWidth(24), right: SizeUtils.getWidth(24)),
            ),
            onPressed: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: FontUtils.getFont18Style(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                trailing ??
                    SvgPicture.asset(
                      Utils.getAssetSvg('footerarrow'),
                      height: SizeUtils.getHeight(30),
                    )
              ],
            )),
      ),
    );
  }
}
