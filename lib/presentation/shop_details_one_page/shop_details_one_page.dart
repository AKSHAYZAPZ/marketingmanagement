import '../shop_details_one_page/widgets/listordernumber_item_widget.dart';
import '../shop_details_one_page/widgets/listslno_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class ShopDetailsOnePage extends StatefulWidget {
  const ShopDetailsOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  ShopDetailsOnePageState createState() => ShopDetailsOnePageState();
}

class ShopDetailsOnePageState extends State<ShopDetailsOnePage>
    with AutomaticKeepAliveClientMixin<ShopDetailsOnePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 19,
                    top: 27,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          left: 2,
                          right: 21,
                        ),
                        child: Row(
                          children: [
                            CustomButton(
                              height: getVerticalSize(
                                43,
                              ),
                              width: getHorizontalSize(
                                183,
                              ),
                              text: "Product Name or Code",
                              margin: getMargin(
                                bottom: 1,
                              ),
                              variant: ButtonVariant.OutlineBlack9003f,
                              shape: ButtonShape.RoundedBorder21,
                              fontStyle: ButtonFontStyle.DMSansMedium10,
                            ),
                            CustomButton(
                              height: getVerticalSize(
                                43,
                              ),
                              width: getHorizontalSize(
                                110,
                              ),
                              text: "Quantity",
                              margin: getMargin(
                                left: 11,
                                bottom: 1,
                              ),
                              variant: ButtonVariant.OutlineBlack9003f,
                              shape: ButtonShape.RoundedBorder21,
                              fontStyle: ButtonFontStyle.DMSansMedium10,
                            ),
                            Container(
                              width: getHorizontalSize(
                                71,
                              ),
                              margin: getMargin(
                                left: 11,
                                top: 1,
                              ),
                              padding: getPadding(
                                left: 26,
                                top: 1,
                                right: 26,
                                bottom: 1,
                              ),
                              decoration:
                                  AppDecoration.txtFillLightblue70001.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.txtRoundedBorder21,
                              ),
                              child: Text(
                                "+",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtDMSansBold30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 11,
                          top: 16,
                          right: 33,
                        ),
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (
                            context,
                            index,
                          ) {
                            return SizedBox(
                              height: getVerticalSize(
                                7,
                              ),
                            );
                          },
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return ListslnoItemWidget();
                          },
                        ),
                      ),
                      CustomButton(
                        width: getHorizontalSize(
                          219,
                        ),
                        text: "Generate Bill",
                        margin: getMargin(
                          top: 26,
                          right: 20,
                        ),
                        shape: ButtonShape.RoundedBorder24,
                        fontStyle: ButtonFontStyle.DMSansMedium20WhiteA700,
                        alignment: Alignment.centerRight,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 2,
                          top: 14,
                        ),
                        child: Text(
                          "Recent Orders",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtDMSansBold18.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.18,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 1,
                          top: 7,
                          right: 22,
                        ),
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (
                            context,
                            index,
                          ) {
                            return SizedBox(
                              height: getVerticalSize(
                                20,
                              ),
                            );
                          },
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return ListordernumberItemWidget();
                          },
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 39,
                        ),
                        child: Divider(
                          height: getVerticalSize(
                            1,
                          ),
                          thickness: getVerticalSize(
                            1,
                          ),
                          color: ColorConstant.gray100,
                          endIndent: getHorizontalSize(
                            23,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(
                          63,
                        ),
                        width: getHorizontalSize(
                          410,
                        ),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: getMargin(
                                  right: 23,
                                ),
                                padding: getPadding(
                                  left: 64,
                                  right: 64,
                                ),
                                decoration: AppDecoration.fillWhiteA700,
                                child: Row(
                                  children: [
                                    Container(
                                      height: getVerticalSize(
                                        63,
                                      ),
                                      width: getHorizontalSize(
                                        77,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                      ),
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgClock,
                                      height: getVerticalSize(
                                        63,
                                      ),
                                      width: getHorizontalSize(
                                        77,
                                      ),
                                      margin: getMargin(
                                        left: 13,
                                      ),
                                    ),
                                    Container(
                                      height: getVerticalSize(
                                        63,
                                      ),
                                      width: getHorizontalSize(
                                        77,
                                      ),
                                      margin: getMargin(
                                        left: 13,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: getPadding(
                                  left: 89,
                                ),
                                child: IntrinsicWidth(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: getVerticalSize(
                                          63,
                                        ),
                                        width: getHorizontalSize(
                                          77,
                                        ),
                                        padding: getPadding(
                                          left: 27,
                                          top: 21,
                                          right: 27,
                                          bottom: 21,
                                        ),
                                        decoration: AppDecoration.fillWhiteA700,
                                        child: Stack(
                                          children: [
                                            CustomImageView(
                                              svgPath: ImageConstant.imgHome,
                                              height: getSize(
                                                21,
                                              ),
                                              width: getSize(
                                                21,
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgTicket,
                                        height: getVerticalSize(
                                          18,
                                        ),
                                        width: getHorizontalSize(
                                          22,
                                        ),
                                        margin: getMargin(
                                          left: 34,
                                          top: 23,
                                          bottom: 22,
                                        ),
                                      ),
                                      Spacer(),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgMenu,
                                        height: getVerticalSize(
                                          20,
                                        ),
                                        width: getHorizontalSize(
                                          16,
                                        ),
                                        margin: getMargin(
                                          top: 22,
                                          bottom: 21,
                                        ),
                                      ),
                                      Container(
                                        height: getVerticalSize(
                                          63,
                                        ),
                                        width: getHorizontalSize(
                                          77,
                                        ),
                                        margin: getMargin(
                                          left: 42,
                                        ),
                                        padding: getPadding(
                                          left: 26,
                                          top: 19,
                                          right: 26,
                                          bottom: 19,
                                        ),
                                        decoration: AppDecoration.fillWhiteA700,
                                        child: Stack(
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgPlaceholder,
                                              height: getSize(
                                                24,
                                              ),
                                              width: getSize(
                                                24,
                                              ),
                                              radius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  12,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
