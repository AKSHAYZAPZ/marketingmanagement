import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:jibin_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProductDScreen extends StatelessWidget {
  ProductDScreen({Key? key}) : super(key: key);

  TextEditingController groupeightyeighController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(123),
                centerTitle: true,
                title: SizedBox(
                    height: getVerticalSize(123),
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.center, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgOverlay123x430,
                          height: getVerticalSize(123),
                          width: getHorizontalSize(430),
                          radius: BorderRadius.circular(getHorizontalSize(16)),
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: getHorizontalSize(428),
                              margin: getMargin(left: 2, bottom: 1),
                              padding: getPadding(
                                  left: 72, top: 42, right: 72, bottom: 42),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(ImageConstant.imgGroup44),
                                      fit: BoxFit.cover)),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppbarImage(
                                        height: getVerticalSize(16),
                                        width: getHorizontalSize(21),
                                        svgPath: ImageConstant.imgArrowleft,
                                        margin: getMargin(top: 6, bottom: 15),
                                        onTap: () {
                                          onTapArrowleft4(context);
                                        }),
                                    AppbarTitle(
                                        text: "Products",
                                        margin: getMargin(
                                            left: 59, right: 106, bottom: 8))
                                  ])))
                    ])),
                styleType: Style.bgStyle_2),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 23),
                    child: Padding(
                        padding: getPadding(left: 7, bottom: 6),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(left: 16),
                                  child: Text("Categories",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtDMSansBold16Bluegray900)),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      padding: getPadding(left: 16, top: 4),
                                      child: IntrinsicWidth(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgOverlay75x74,
                                                height: getVerticalSize(75),
                                                width: getHorizontalSize(74),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(16))),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgOverlay1,
                                                height: getVerticalSize(75),
                                                width: getHorizontalSize(74),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(16)),
                                                margin: getMargin(left: 11)),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgOverlay2,
                                                height: getVerticalSize(75),
                                                width: getHorizontalSize(74),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(16)),
                                                margin: getMargin(left: 11)),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgOverlay3,
                                                height: getVerticalSize(75),
                                                width: getHorizontalSize(74),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(16)),
                                                margin: getMargin(left: 11)),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgOverlay4,
                                                height: getVerticalSize(75),
                                                width: getHorizontalSize(74),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(16)),
                                                margin: getMargin(left: 11))
                                          ])))),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 34, top: 5, right: 9),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(bottom: 14),
                                                child: Text("Monitor",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansMedium10)),
                                            Container(
                                                width: getHorizontalSize(37),
                                                margin: getMargin(
                                                    left: 48, bottom: 3),
                                                child: Text("Testing Devices",
                                                    maxLines: null,
                                                    textAlign: TextAlign.center,
                                                    style: AppStyle
                                                        .txtDMSansMedium10)),
                                            Container(
                                                width: getHorizontalSize(54),
                                                margin: getMargin(
                                                    left: 40,
                                                    top: 1,
                                                    bottom: 1),
                                                child: Text("Semi-\nconductors",
                                                    maxLines: null,
                                                    textAlign: TextAlign.center,
                                                    style: AppStyle
                                                        .txtDMSansMedium10)),
                                            Padding(
                                                padding: getPadding(
                                                    left: 32, bottom: 14),
                                                child: Text("Hand Tools",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansMedium10)),
                                            Container(
                                                width: getHorizontalSize(33),
                                                margin:
                                                    getMargin(left: 43, top: 1),
                                                child: Text("Water\npumps",
                                                    maxLines: null,
                                                    textAlign: TextAlign.center,
                                                    style: AppStyle
                                                        .txtDMSansMedium10))
                                          ]))),
                              Padding(
                                  padding: getPadding(top: 16, right: 25),
                                  child: Row(children: [
                                    Container(
                                        height: getVerticalSize(1),
                                        width: getHorizontalSize(8),
                                        margin: getMargin(top: 276, bottom: 83),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.blueGray100)),
                                    Expanded(
                                        child: Padding(
                                            padding: getPadding(left: 9),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      padding: getPadding(
                                                          left: 30,
                                                          top: 15,
                                                          right: 30,
                                                          bottom: 15),
                                                      decoration: AppDecoration
                                                          .outlineBluegray5001
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder12),
                                                      child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        24),
                                                                width:
                                                                    getHorizontalSize(
                                                                        26),
                                                                padding:
                                                                    getPadding(
                                                                        left: 2,
                                                                        top: 1,
                                                                        right:
                                                                            2,
                                                                        bottom:
                                                                            1),
                                                                decoration:
                                                                    AppDecoration
                                                                        .fillBluegray50,
                                                                child: Stack(
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgSearch,
                                                                          height: getVerticalSize(
                                                                              20),
                                                                          width: getHorizontalSize(
                                                                              22),
                                                                          alignment:
                                                                              Alignment.center)
                                                                    ])),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            24,
                                                                        top: 3,
                                                                        right:
                                                                            212,
                                                                        bottom:
                                                                            1),
                                                                child: Text(
                                                                    "Search ...",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtDMSansRegular14))
                                                          ])),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle5943,
                                                      height:
                                                          getVerticalSize(176),
                                                      width: getHorizontalSize(
                                                          381),
                                                      radius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  14)),
                                                      margin:
                                                          getMargin(top: 54)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 9,
                                                          top: 13,
                                                          right: 8),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgRectangle5944,
                                                                height:
                                                                    getVerticalSize(
                                                                        64),
                                                                width:
                                                                    getHorizontalSize(
                                                                        88),
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        getHorizontalSize(
                                                                            14))),
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgRectangle5945,
                                                                height:
                                                                    getVerticalSize(
                                                                        64),
                                                                width:
                                                                    getHorizontalSize(
                                                                        88),
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        getHorizontalSize(
                                                                            14)),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            4)),
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgRectangle5946,
                                                                height:
                                                                    getVerticalSize(
                                                                        64),
                                                                width:
                                                                    getHorizontalSize(
                                                                        88),
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        getHorizontalSize(
                                                                            14)),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            4)),
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgRectangle5947,
                                                                height:
                                                                    getVerticalSize(
                                                                        64),
                                                                width:
                                                                    getHorizontalSize(
                                                                        88),
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        getHorizontalSize(
                                                                            14)),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            4))
                                                          ]))
                                                ])))
                                  ])),
                              Padding(
                                  padding: getPadding(left: 36, top: 34),
                                  child: Text("Crompton 0.5HP SP ",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtMontserratRomanMedium16)),
                              Padding(
                                  padding: getPadding(left: 36, top: 3),
                                  child: Text("Water Pumps",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtDMSansRegular16Gray80087)),
                              Padding(
                                  padding: getPadding(left: 34, top: 11),
                                  child: Row(children: [
                                    Text("₹2500",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtDMSansRegular16Gray80087),
                                    Padding(
                                        padding: getPadding(left: 115),
                                        child: Text("Offer ₹2000",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtDMSansRegular16Gray80087))
                                  ])),
                              Padding(
                                  padding: getPadding(left: 36, top: 29),
                                  child: Text("Product Description",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtDMSansMedium14)),
                              Container(
                                  width: getHorizontalSize(311),
                                  margin:
                                      getMargin(left: 36, top: 4, right: 74),
                                  child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Risus placerat sit fringilla at facilisis. Quam vivamus non orci elit platea id sed est.",
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtDMSansRegular16Gray80002)),
                              Padding(
                                  padding: getPadding(left: 34, top: 20),
                                  child: Text("Location Details",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtDMSansRegular14Gray80087)),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  autofocus: true,
                                  controller: groupeightyeighController,
                                  hintText: "Kathrikadavu, Kaloor",
                                  margin:
                                      getMargin(left: 34, top: 4, right: 48),
                                  padding: TextFormFieldPadding.PaddingT1,
                                  fontStyle:
                                      TextFormFieldFontStyle.DMSansRegular16,
                                  textInputAction: TextInputAction.done,
                                  suffix: Container(
                                      margin: getMargin(
                                          left: 30, right: 8, bottom: 6),
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgIconUiPickLocation)),
                                  suffixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(30))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(top: 69),
                                      child: Divider(
                                          height: getVerticalSize(1),
                                          thickness: getVerticalSize(1),
                                          color: ColorConstant.gray100,
                                          indent: getHorizontalSize(13),
                                          endIndent: getHorizontalSize(21)))),
                              Container(
                                  height: getVerticalSize(63),
                                  width: getHorizontalSize(410),
                                  margin: getMargin(left: 13),
                                  child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                                margin: getMargin(right: 22),
                                                padding: getPadding(
                                                    left: 64, right: 64),
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Row(children: [
                                                  Container(
                                                      height:
                                                          getVerticalSize(63),
                                                      width:
                                                          getHorizontalSize(77),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .whiteA700)),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgClock,
                                                      height:
                                                          getVerticalSize(63),
                                                      width:
                                                          getHorizontalSize(77),
                                                      margin:
                                                          getMargin(left: 13)),
                                                  Container(
                                                      height:
                                                          getVerticalSize(63),
                                                      width:
                                                          getHorizontalSize(77),
                                                      margin:
                                                          getMargin(left: 13),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .whiteA700))
                                                ]))),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                padding: getPadding(left: 89),
                                                child: IntrinsicWidth(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  63),
                                                          width:
                                                              getHorizontalSize(
                                                                  77),
                                                          padding: getPadding(
                                                              left: 27,
                                                              top: 21,
                                                              right: 27,
                                                              bottom: 21),
                                                          decoration:
                                                              AppDecoration
                                                                  .fillWhiteA700,
                                                          child:
                                                              Stack(children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgHome,
                                                                height:
                                                                    getSize(21),
                                                                width:
                                                                    getSize(21),
                                                                alignment:
                                                                    Alignment
                                                                        .center)
                                                          ])),
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgTicket,
                                                          height:
                                                              getVerticalSize(
                                                                  18),
                                                          width:
                                                              getHorizontalSize(
                                                                  22),
                                                          margin: getMargin(
                                                              left: 34,
                                                              top: 22,
                                                              bottom: 22)),
                                                      Spacer(),
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMenu,
                                                          height:
                                                              getVerticalSize(
                                                                  20),
                                                          width:
                                                              getHorizontalSize(
                                                                  16),
                                                          margin: getMargin(
                                                              top: 21,
                                                              bottom: 21)),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  63),
                                                          width:
                                                              getHorizontalSize(
                                                                  77),
                                                          margin: getMargin(
                                                              left: 42),
                                                          padding: getPadding(
                                                              left: 25,
                                                              top: 19,
                                                              right: 25,
                                                              bottom: 19),
                                                          decoration:
                                                              AppDecoration
                                                                  .fillWhiteA700,
                                                          child:
                                                              Stack(children: [
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgPlaceholder,
                                                                height:
                                                                    getSize(24),
                                                                width:
                                                                    getSize(24),
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        getHorizontalSize(
                                                                            12)),
                                                                alignment:
                                                                    Alignment
                                                                        .center)
                                                          ]))
                                                    ]))))
                                      ]))
                            ]))))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft4(BuildContext context) {
    Navigator.pop(context);
  }
}
