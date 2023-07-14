import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/presentation/shop_details_one_page/shop_details_one_page.dart';
import 'package:jibin_s_application1/presentation/shop_details_page/shop_details_page.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:jibin_s_application1/widgets/custom_button.dart';

class ShopDetailsTabContainerScreen extends StatefulWidget {
  const ShopDetailsTabContainerScreen({Key? key}) : super(key: key);

  @override
  ShopDetailsTabContainerScreenState createState() =>
      ShopDetailsTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class ShopDetailsTabContainerScreenState
    extends State<ShopDetailsTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: getVerticalSize(131),
                          width: double.maxFinite,
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgOverlay128x430,
                                height: getVerticalSize(128),
                                width: getHorizontalSize(430),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(16)),
                                alignment: Alignment.center),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin: getMargin(right: 1),
                                    padding: getPadding(top: 46, bottom: 46),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusStyle.customBorderBL12,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                ImageConstant.imgGroup44),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomAppBar(
                                              height: getVerticalSize(38),
                                              leadingWidth: 95,
                                              leading: AppbarImage(
                                                  height: getVerticalSize(17),
                                                  width: getHorizontalSize(21),
                                                  svgPath: ImageConstant
                                                      .imgArrowleft,
                                                  margin: getMargin(
                                                      left: 74,
                                                      top: 3,
                                                      bottom: 7),
                                                  onTap: () {
                                                    onTapArrowleft2(context);
                                                  }),
                                              centerTitle: true,
                                              title: AppbarTitle(
                                                  text: "Tradly Store"))
                                        ])))
                          ])),
                      Expanded(
                          child: SingleChildScrollView(
                              padding: getPadding(top: 19),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(left: 7, right: 26),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: getVerticalSize(1),
                                                  width: getHorizontalSize(8),
                                                  margin: getMargin(top: 449),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .blueGray100)),
                                              Expanded(
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 5, bottom: 162),
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Card(
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                elevation: 0,
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(0),
                                                                color:
                                                                    ColorConstant
                                                                        .blue600,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder16),
                                                                child:
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            215),
                                                                        width: getHorizontalSize(
                                                                            381),
                                                                        padding: getPadding(
                                                                            left:
                                                                                13,
                                                                            top:
                                                                                11,
                                                                            right:
                                                                                13,
                                                                            bottom:
                                                                                11),
                                                                        decoration: AppDecoration
                                                                            .fillBlue600
                                                                            .copyWith(
                                                                                borderRadius: BorderRadiusStyle
                                                                                    .roundedBorder16),
                                                                        child: Stack(
                                                                            alignment:
                                                                                Alignment.bottomRight,
                                                                            children: [
                                                                              Align(
                                                                                  alignment: Alignment.center,
                                                                                  child: Padding(
                                                                                      padding: getPadding(left: 6),
                                                                                      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                          CustomImageView(svgPath: ImageConstant.imgRewind, height: getSize(32), width: getSize(32), margin: getMargin(bottom: 57)),
                                                                                          Container(
                                                                                              height: getVerticalSize(90),
                                                                                              width: getHorizontalSize(140),
                                                                                              margin: getMargin(left: 9),
                                                                                              child: Stack(alignment: Alignment.topCenter, children: [
                                                                                                Align(alignment: Alignment.bottomLeft, child: SizedBox(width: getHorizontalSize(121), child: Text("NAP Junction,\nkathrikadavu, Kaloor - 683545", maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtDMSansRegular16))),
                                                                                                Align(alignment: Alignment.topCenter, child: Text("TRADLY STORE", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansMedium20))
                                                                                              ])),
                                                                                          Card(
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              elevation: 0,
                                                                                              margin: getMargin(left: 37, bottom: 47),
                                                                                              color: ColorConstant.whiteA700,
                                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.roundedBorder12),
                                                                                              child: Container(
                                                                                                  height: getVerticalSize(42),
                                                                                                  width: getHorizontalSize(61),
                                                                                                  padding: getPadding(left: 17, top: 8, right: 17, bottom: 8),
                                                                                                  decoration: AppDecoration.outlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                                                                                                  child: Stack(children: [
                                                                                                    CustomImageView(imagePath: ImageConstant.imgWhatsapp31, height: getSize(25), width: getSize(25), alignment: Alignment.topCenter)
                                                                                                  ]))),
                                                                                          Card(
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              elevation: 0,
                                                                                              margin: getMargin(left: 5, bottom: 47),
                                                                                              color: ColorConstant.whiteA700,
                                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.roundedBorder12),
                                                                                              child: Container(
                                                                                                  height: getVerticalSize(42),
                                                                                                  width: getHorizontalSize(61),
                                                                                                  padding: getPadding(left: 18, top: 9, right: 18, bottom: 9),
                                                                                                  decoration: AppDecoration.outlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                                                                                                  child: Stack(children: [
                                                                                                    CustomImageView(imagePath: ImageConstant.imgRectangle23x23, height: getSize(23), width: getSize(23), alignment: Alignment.topCenter)
                                                                                                  ])))
                                                                                        ]),
                                                                                        Padding(
                                                                                            padding: getPadding(left: 43, top: 4),
                                                                                            child: Row(children: [
                                                                                              Padding(padding: getPadding(bottom: 1), child: Text("GST NO :", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansRegular16)),
                                                                                              Padding(padding: getPadding(left: 2, top: 1), child: Text(" 22AAAAA0000A1Z5", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansBold16))
                                                                                            ])),
                                                                                        Padding(
                                                                                            padding: getPadding(left: 1, top: 37),
                                                                                            child: Row(children: [
                                                                                              CustomImageView(svgPath: ImageConstant.imgCalendar, height: getVerticalSize(18), width: getHorizontalSize(16), margin: getMargin(bottom: 2)),
                                                                                              Padding(padding: getPadding(left: 6, top: 1), child: Text("13-06-2023", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansBold14))
                                                                                            ]))
                                                                                      ]))),
                                                                              CustomImageView(svgPath: ImageConstant.imgComputer, height: getSize(51), width: getSize(51), alignment: Alignment.bottomRight, margin: getMargin(right: 10))
                                                                            ]))),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 36,
                                                                        right:
                                                                            4),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                          height: getVerticalSize(
                                                                              32),
                                                                          width: getHorizontalSize(
                                                                              247),
                                                                          margin: getMargin(
                                                                              top:
                                                                                  4),
                                                                          child: TabBar(
                                                                              controller: tabviewController,
                                                                              labelColor: ColorConstant.indigoA700,
                                                                              labelStyle: TextStyle(fontSize: getFontSize(14), fontFamily: 'DM Sans', fontWeight: FontWeight.w700),
                                                                              unselectedLabelColor: ColorConstant.gray700,
                                                                              unselectedLabelStyle: TextStyle(fontSize: getFontSize(14), fontFamily: 'DM Sans', fontWeight: FontWeight.w700),
                                                                              indicatorColor: ColorConstant.indigoA700,
                                                                              tabs: [
                                                                                Tab(child: Text("Order Details", overflow: TextOverflow.ellipsis)),
                                                                                Tab(child: Text("Payment Details", overflow: TextOverflow.ellipsis))
                                                                              ])),
                                                                      CustomButton(
                                                                          height: getVerticalSize(
                                                                              33),
                                                                          width: getHorizontalSize(
                                                                              98),
                                                                          text:
                                                                              "Take Orders\n ",
                                                                          margin: getMargin(
                                                                              left:
                                                                                  34,
                                                                              bottom:
                                                                                  4),
                                                                          variant: ButtonVariant
                                                                              .FillLightblueA200,
                                                                          shape: ButtonShape
                                                                              .RoundedBorder16,
                                                                          padding: ButtonPadding
                                                                              .PaddingAll8,
                                                                          fontStyle: ButtonFontStyle
                                                                              .DMSansBold12,
                                                                          onTap:
                                                                              () {
                                                                            onTapTakeorders(context);
                                                                          })
                                                                    ]))
                                                          ])))
                                            ])),
                                    SizedBox(
                                        height: getVerticalSize(963),
                                        child: TabBarView(
                                            controller: tabviewController,
                                            children: [
                                              ShopDetailsOnePage(),
                                              ShopDetailsPage()
                                            ]))
                                  ])))
                    ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the takeOrderScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the takeOrderScreen.
  onTapTakeorders(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.takeOrderScreen);
  }
}
