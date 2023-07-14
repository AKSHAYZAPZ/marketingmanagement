import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get txtFillLightblue70001 => BoxDecoration(
        color: ColorConstant.lightBlue70001,
      );
  static BoxDecoration get txtFillLightblue700 => BoxDecoration(
    color: ColorConstant.lightBlue700,
  );
  static BoxDecoration get outlineBluegray5001 => BoxDecoration(
        color: ColorConstant.blueGray5001,
        border: Border.all(
          color: ColorConstant.blueGray5001,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillBlue600 => BoxDecoration(
        color: ColorConstant.blue600,
      );
  static BoxDecoration get fillBluegray5001 => BoxDecoration(
        color: ColorConstant.blueGray5001,
      );
  static BoxDecoration get outlineBlack9003f => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get gradientTeal300Lightblue700 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            ColorConstant.teal300,
            ColorConstant.lightBlue700,
          ],
        ),
      );
  static BoxDecoration get outlineBlack9003f1 => BoxDecoration(
        color: ColorConstant.gray50,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillBluegray50 => BoxDecoration(
        color: ColorConstant.blueGray50,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),
  );

  static BorderRadius customBorderBL12 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        12,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        12,
      ),
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );

  static BorderRadius roundedBorder30 = BorderRadius.circular(
    getHorizontalSize(
      30,
    ),
  );

  static BorderRadius txtRoundedBorder21 = BorderRadius.circular(
    getHorizontalSize(
      21,
    ),
  );

  static BorderRadius circleBorder39 = BorderRadius.circular(
    getHorizontalSize(
      39,
    ),
  );

  static BorderRadius roundedBorder19 = BorderRadius.circular(
    getHorizontalSize(
      19,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
