import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonChildWidget(),
      ),
    );
  }

  _buildButtonChildWidget() {
    if (checkGradient()) {
      return Container(
        width: width ?? double.maxFinite,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: _buildButtonWithOrWithoutIcon(),
      );
    } else {
      return _buildButtonWithOrWithoutIcon();
    }
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildDecoration() {
    return BoxDecoration(
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _buildTextButtonStyle() {
    if (checkGradient()) {
      return TextButton.styleFrom(
        padding: EdgeInsets.zero,
      );
    } else {
      return TextButton.styleFrom(
        fixedSize: Size(
          width ?? double.maxFinite,
          height ?? getVerticalSize(40),
        ),
        padding: _setPadding(),
        backgroundColor: _setColor(),
        shadowColor: _setTextButtonShadowColor(),
        shape: RoundedRectangleBorder(
          borderRadius: _setBorderRadius(),
        ),
      );
    }
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll5:
        return getPadding(
          all: 5,
        );
      case ButtonPadding.PaddingAll8:
        return getPadding(
          all: 8,
        );
      case ButtonPadding.PaddingAll13:
        return getPadding(
          all: 13,
        );
      default:
        return getPadding(
          all: 16,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillBlue600:
        return ColorConstant.blue600;
      case ButtonVariant.OutlineBlack9003f:
        return ColorConstant.gray50;
      case ButtonVariant.FillOrange600:
        return ColorConstant.orange600;
      case ButtonVariant.FillLightgreenA700:
        return ColorConstant.lightGreenA700;
      case ButtonVariant.FillLightblueA200:
        return ColorConstant.lightBlueA200;
      case ButtonVariant.FillLightblue700:
        return ColorConstant.lightBlue700;
      case ButtonVariant.GradientTeal300Lightblue700:
        return null;
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9003f:
        return ColorConstant.black9003f;
      case ButtonVariant.GradientTeal300Lightblue700:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillOrange600:
      case ButtonVariant.FillLightgreenA700:
      case ButtonVariant.FillLightblueA200:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder24:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
      case ButtonShape.RoundedBorder21:
        return BorderRadius.circular(
          getHorizontalSize(
            21.00,
          ),
        );
      case ButtonShape.RoundedBorder16:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.DMSansMedium20WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.DMSansMedium20:
        return TextStyle(
          color: ColorConstant.blueA700,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.DMSansMedium10:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.DMSansBold12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.DMSansMedium22:
        return TextStyle(
          color: ColorConstant.blue600,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w700,
        );
    }
  }

  checkGradient() {
    switch (variant) {
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.OutlineBlack9003f:
      case ButtonVariant.FillOrange600:
      case ButtonVariant.FillLightgreenA700:
      case ButtonVariant.FillLightblueA200:
        return false;
      default:
        return true;
    }
  }

  _setGradient() {
    switch (variant) {
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.OutlineBlack9003f:
      case ButtonVariant.FillOrange600:
      case ButtonVariant.FillLightgreenA700:
      case ButtonVariant.FillLightblueA200:
        return null;
      default:
        return LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            ColorConstant.lightBlue700,
            ColorConstant.lightBlue700,
          ],
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9003f:
        return [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ];
      case ButtonVariant.GradientTeal300Lightblue700:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillOrange600:
      case ButtonVariant.FillLightgreenA700:
      case ButtonVariant.FillLightblueA200:
        return null;
      default:
        return null;
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder24,
  RoundedBorder21,
  RoundedBorder4,
  RoundedBorder16,
}

enum ButtonPadding {
  PaddingAll16,
  PaddingAll5,
  PaddingAll8,
  PaddingAll13,
}

enum ButtonVariant {
  GradientTeal300Lightblue700,
  FillWhiteA700,
  OutlineBlack9003f,
  FillOrange600,
  FillLightgreenA700,
  FillLightblueA200,
  FillLightblue700,
  FillBlue600,
}

enum ButtonFontStyle {
  DMSansMedium20WhiteA700,
  DMSansMedium20,
  DMSansMedium10,
  DMSansBold18,
  DMSansBold12,
  DMSansMedium22,
}
