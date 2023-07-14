import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  double height;

  Style? styleType;

  double? leadingWidth;

  Widget? leading;

  Widget? title;

  bool? centerTitle;

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        size.width,
        height,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgStyle_1:
        return Container(
          height: getVerticalSize(
            122,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgGroup44,
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      case Style.bgStyle_2:
        return Container(
          height: getVerticalSize(
            122,
          ),
          width: getHorizontalSize(
            428,
          ),
          margin: getMargin(
            left: 2,
            bottom: 1,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgGroup44,
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      case Style.bgStyle:
        return Container(
          height: getVerticalSize(
            128,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgGroup44,
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      case Style.bgStyle_3:
        return Container(
          height: getVerticalSize(
            129,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgGroup44,
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      case Style.bgStyle_4:
        return Container(
          height: getVerticalSize(
            129,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgGroup44,
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgStyle_1,
  bgStyle_2,
  bgStyle,
  bgStyle_3,
  bgStyle_4,
}
