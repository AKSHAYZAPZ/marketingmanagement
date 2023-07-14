import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/widgets/custom_button.dart';

// ignore: must_be_immutable
class ListordernumberItemWidget extends StatelessWidget {
  const ListordernumberItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(
        384,
      ),
      padding: getPadding(
        left: 25,
        top: 14,
        right: 25,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder16,
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgGroup455,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              bottom: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "ORDR00123",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtDMSansBold18,
                ),
                Padding(
                  padding: getPadding(
                    top: 1,
                  ),
                  child: Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtDMSansRegular16Black900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: getVerticalSize(
              52,
            ),
            width: getHorizontalSize(
              122,
            ),
            margin: getMargin(
              top: 7,
              bottom: 2,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Estimated Amount",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtDMSansRegular14Black900,
                  ),
                ),
                CustomButton(
                  height: getVerticalSize(
                    34,
                  ),
                  width: getHorizontalSize(
                    122,
                  ),
                  text: "₹12000",
                  variant: ButtonVariant.FillOrange600,
                  padding: ButtonPadding.PaddingAll5,
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
