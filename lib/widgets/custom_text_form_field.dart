import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.padding,
    this.shape,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.validator,
    this.errorColor,
    this.errorBorderColor,
    this.focusBordercolor,
    this.textCapitalization = TextCapitalization.words,
    // this.cursorColor,
  });

  TextFormFieldPadding? padding;

  TextFormFieldShape? shape;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? autofocus;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;
  Color? errorColor;
  Color? errorBorderColor;
  Color? focusBordercolor;
  TextCapitalization? textCapitalization;
  // TextFormcurser? cursorColor;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(errorColor, errorBorderColor,focusBordercolor),
          )
        : _buildTextFormFieldWidget(errorColor, errorBorderColor,focusBordercolor);
  }

  _buildTextFormFieldWidget(Color? errorColor, Color? errorBorderColor,Color? focusBordercolor) {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus!,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(errorColor, errorBorderColor,focusBordercolor),
        validator: validator,
        textCapitalization: textCapitalization!,
        // TextFormcurser:  cursorColor,
      ),
    );
  }

  _buildDecoration(Color? errorColor, Color? errorBorderColor,Color?  focusBordercolor) {
    return InputDecoration(
        hintText: hintText ?? "",
        hintStyle: _setFontStyle(),
        border: _setBorderStyle(),
        enabledBorder: _setBorderStyle(),
        focusedBorder: _setBorderStyle(),
        disabledBorder: _setBorderStyle(),
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        filled: _setFilled(),
        isDense: true,
        contentPadding: _setPadding(),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: errorBorderColor != null ? errorBorderColor : Colors.red),
        ),
        focusedErrorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: focusBordercolor != null ? focusBordercolor : Colors.red),
          ),
         errorStyle: TextStyle(color: errorColor));
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.DMSansRegular18:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.DMSansRegular16:
        return TextStyle(
          color: ColorConstant.gray80002,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.DMSansRegular19:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            24,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.DMSansMedium10:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.gray80001,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.OutlineWhiteA700:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.whiteA700,
            width: 3,
          ),
        );
      case TextFormFieldVariant.OutlineBlackA700:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 3,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.gray300,
          ),
        );
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.UnderLineGray300:
        return false;
      case TextFormFieldVariant.OutlineBlack9003f:
        return true;
      case TextFormFieldVariant.OutlineWhiteA700:
        return false;
      case TextFormFieldVariant.None:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingAll13:
        return getPadding(
          all: 13,
        );
      case TextFormFieldPadding.PaddingT1:
        return getPadding(
          top: 1,
          bottom: 1,
        );
      default:
        return getPadding(
          all: 17,
        );
    }
  }
}

enum TextFormFieldPadding {
  PaddingAll13,
  PaddingAll17,
  PaddingT1,
}

enum TextFormFieldShape {
  RoundedBorder21,
  RoundedBorder24,
}

enum TextFormFieldVariant {
  None,
  UnderLineGray300,
  OutlineWhiteA700,
  OutlineBlack9003f,
  OutlineBlackA700,
}

enum TextFormFieldFontStyle {
  DMSansMedium10,
  MontserratRomanMedium16,
  DMSansRegular18,
  DMSansRegular16,
  DMSansRegular19,
}
