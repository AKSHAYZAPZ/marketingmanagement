import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:jibin_s_application1/widgets/custom_button.dart';

class TakeOrderScreen extends StatelessWidget {
  const TakeOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(129),
                leadingWidth: 95,
                leading: Container(
                    height: getVerticalSize(17),
                    width: getHorizontalSize(21),
                    margin: getMargin(left: 74, top: 50, bottom: 62),
                    child: Stack(alignment: Alignment.topCenter, children: [
                      AppbarImage(
                          height: getVerticalSize(17),
                          width: getHorizontalSize(21),
                          svgPath: ImageConstant.imgArrowleft,
                          onTap: () {
                            onTapArrowleft6(context);
                          }),
                      AppbarImage(
                          height: getVerticalSize(17),
                          width: getHorizontalSize(21),
                          svgPath: ImageConstant.imgArrowleft)
                    ])),
                centerTitle: true,
                title: SizedBox(
                    height: getVerticalSize(29),
                    width: getHorizontalSize(117),
                    child: Stack(alignment: Alignment.topCenter, children: [
                      AppbarTitle(text: "Take Order"),
                      AppbarTitle(
                          text: "Collection", margin: getMargin(right: 8))
                    ])),
                styleType: Style.bgStyle_4),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 5, bottom: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 23, top: 42, right: 26),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: getVerticalSize(50),
                                    width: getHorizontalSize(281),
                                    margin: getMargin(bottom: 2),
                                    child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  height: getVerticalSize(50),
                                                  width: getHorizontalSize(178),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.gray50,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  12)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: ColorConstant
                                                                .black9003f,
                                                            spreadRadius:
                                                                getHorizontalSize(
                                                                    2),
                                                            blurRadius:
                                                                getHorizontalSize(
                                                                    2),
                                                            offset:
                                                                Offset(0, 4))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                  height: getVerticalSize(50),
                                                  width: getHorizontalSize(90),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.gray50,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  12)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: ColorConstant
                                                                .black9003f,
                                                            spreadRadius:
                                                                getHorizontalSize(
                                                                    2),
                                                            blurRadius:
                                                                getHorizontalSize(
                                                                    2),
                                                            offset:
                                                                Offset(0, 4))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  width: getHorizontalSize(216),
                                                  margin: getMargin(
                                                      left: 31,
                                                      top: 16,
                                                      right: 34,
                                                      bottom: 15),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                            padding: getPadding(
                                                                bottom: 1),
                                                            child: Text(
                                                                "Product Name/Code",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtDMSansMedium12)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 1),
                                                            child: Text("Qty",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtDMSansMedium12))
                                                      ])))
                                        ])),
                                Container(
                                    height: getVerticalSize(40),
                                    width: getHorizontalSize(83),
                                    margin: getMargin(left: 17, top: 12),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: getVerticalSize(35),
                                                  width: getHorizontalSize(83),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .lightBlue70001,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  12))))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(
                                                            top: 9, bottom: 10),
                                                        child: Text("Add ",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtDMSansBold15)),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 14),
                                                        child: Text("+",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtDMSansBold30))
                                                  ]))
                                        ]))
                              ])),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 42, top: 34, right: 69),
                              child: Row(children: [
                                Padding(
                                    padding: getPadding(bottom: 1),
                                    child: Text("SL No",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtDMSansBold10)),
                                Padding(
                                    padding: getPadding(left: 18, bottom: 1),
                                    child: Text("Product  Name",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtDMSansBold10)),
                                Padding(
                                    padding: getPadding(left: 18, bottom: 1),
                                    child: Text("Product Code",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtDMSansBold10)),
                                Padding(
                                    padding: getPadding(left: 29, top: 1),
                                    child: Text("Qty",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtDMSansBold10)),
                                Padding(
                                    padding: getPadding(left: 42, bottom: 1),
                                    child: Text("Price",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtDMSansBold10))
                              ]))),
                      Container(
                          height: getVerticalSize(173),
                          width: getHorizontalSize(365),
                          margin: getMargin(top: 14),
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: getVerticalSize(29),
                                    width: getHorizontalSize(365),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorConstant.black9003f,
                                              spreadRadius:
                                                  getHorizontalSize(2),
                                              blurRadius: getHorizontalSize(2),
                                              offset: Offset(0, 4))
                                        ]))),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: getVerticalSize(29),
                                    width: getHorizontalSize(365),
                                    margin: getMargin(top: 36),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray50,
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorConstant.black9003f,
                                              spreadRadius:
                                                  getHorizontalSize(2),
                                              blurRadius: getHorizontalSize(2),
                                              offset: Offset(0, 4))
                                        ]))),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: getVerticalSize(29),
                                    width: getHorizontalSize(365),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorConstant.black9003f,
                                              spreadRadius:
                                                  getHorizontalSize(2),
                                              blurRadius: getHorizontalSize(2),
                                              offset: Offset(0, 4))
                                        ]))),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    height: getVerticalSize(29),
                                    width: getHorizontalSize(365),
                                    margin: getMargin(bottom: 36),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray50,
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorConstant.black9003f,
                                              spreadRadius:
                                                  getHorizontalSize(2),
                                              blurRadius: getHorizontalSize(2),
                                              offset: Offset(0, 4))
                                        ]))),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    height: getVerticalSize(29),
                                    width: getHorizontalSize(365),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorConstant.black9003f,
                                              spreadRadius:
                                                  getHorizontalSize(2),
                                              blurRadius: getHorizontalSize(2),
                                              offset: Offset(0, 4))
                                        ]))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(left: 9),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Padding(
                                                padding: getPadding(bottom: 2),
                                                child: Text("1",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansBold10)),
                                            Padding(
                                                padding: getPadding(
                                                    left: 43, top: 2),
                                                child: Text("Shower",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansBold10)),
                                            Padding(
                                                padding: getPadding(
                                                    left: 56, bottom: 2),
                                                child: Text("54820",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansBold10)),
                                            Padding(
                                                padding: getPadding(
                                                    left: 64, bottom: 2),
                                                child: Text("50",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansBold10)),
                                            Padding(
                                                padding: getPadding(
                                                    left: 46, bottom: 2),
                                                child: Text("₹5000",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansBold10))
                                          ]),
                                          Padding(
                                              padding: getPadding(
                                                  left: 139, top: 19),
                                              child: Text("54820",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtDMSansBold10)),
                                          Padding(
                                              padding: getPadding(
                                                  left: 137, top: 22),
                                              child: Text("54820",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtDMSansBold10)),
                                          Padding(
                                              padding: getPadding(
                                                  left: 137, top: 20),
                                              child: Text("54820",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtDMSansBold10)),
                                          Padding(
                                              padding: getPadding(
                                                  left: 137, top: 24),
                                              child: Text("54820",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      AppStyle.txtDMSansBold10))
                                        ]))),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: getPadding(
                                        left: 8,
                                        top: 42,
                                        right: 27,
                                        bottom: 116),
                                    child: Row(children: [
                                      Text("2",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtDMSansBold10),
                                      Padding(
                                          padding: getPadding(left: 42),
                                          child: Text("Water Motor",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtDMSansBold10)),
                                      Spacer(),
                                      Text("40",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtDMSansBold10),
                                      Padding(
                                          padding: getPadding(left: 46),
                                          child: Text("₹6000",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtDMSansBold10))
                                    ]))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(
                                        left: 8,
                                        top: 78,
                                        right: 27,
                                        bottom: 79),
                                    child: Row(children: [
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text("3",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtDMSansBold10)),
                                      Padding(
                                          padding: getPadding(left: 42, top: 1),
                                          child: Text("PVC Pipe",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtDMSansBold10)),
                                      Spacer(),
                                      Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text("30",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtDMSansBold10)),
                                      Padding(
                                          padding:
                                              getPadding(left: 47, bottom: 1),
                                          child: Text("₹7000",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtDMSansBold10))
                                    ]))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(
                                        left: 8,
                                        top: 112,
                                        right: 27,
                                        bottom: 46),
                                    child: Row(children: [
                                      Text("4",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtDMSansBold10),
                                      Padding(
                                          padding: getPadding(left: 41),
                                          child: Text("Induction",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtDMSansBold10)),
                                      Spacer(),
                                      Text("35",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtDMSansBold10),
                                      Padding(
                                          padding: getPadding(left: 46),
                                          child: Text("₹8000",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtDMSansBold10))
                                    ]))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(
                                        left: 8,
                                        top: 150,
                                        right: 28,
                                        bottom: 7),
                                    child: Row(children: [
                                      Text("5",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtDMSansBold10),
                                      Padding(
                                          padding: getPadding(left: 41, top: 1),
                                          child: Text("Pipe",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtDMSansBold10)),
                                      Spacer(),
                                      Text("15",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtDMSansBold10),
                                      Padding(
                                          padding:
                                              getPadding(left: 49, bottom: 1),
                                          child: Text("₹2500",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtDMSansBold10))
                                    ])))
                          ])),
                      CustomButton(
                          width: getHorizontalSize(219),
                          text: "Generate Bill",
                          margin: getMargin(top: 32, right: 40),
                          shape: ButtonShape.RoundedBorder24,
                          fontStyle: ButtonFontStyle.DMSansMedium20WhiteA700,
                          alignment: Alignment.centerRight),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              height: getVerticalSize(1),
                              width: getHorizontalSize(8),
                              margin: getMargin(left: 7, top: 42),
                              decoration: BoxDecoration(
                                  color: ColorConstant.blueGray100))),
                      Spacer(),
                      Divider(
                          height: getVerticalSize(1),
                          thickness: getVerticalSize(1),
                          color: ColorConstant.gray100,
                          indent: getHorizontalSize(21),
                          endIndent: getHorizontalSize(20)),
                      SizedBox(
                          height: getVerticalSize(63),
                          width: double.maxFinite,
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin: getMargin(left: 21, right: 20),
                                    padding: getPadding(left: 64, right: 64),
                                    decoration: AppDecoration.fillWhiteA700,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: getVerticalSize(63),
                                              width: getHorizontalSize(77),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700)),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgClock,
                                              height: getVerticalSize(63),
                                              width: getHorizontalSize(77),
                                              margin: getMargin(left: 13)),
                                          Container(
                                              height: getVerticalSize(63),
                                              width: getHorizontalSize(77),
                                              margin: getMargin(left: 13),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700))
                                        ]))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    height: getVerticalSize(63),
                                    width: getHorizontalSize(77),
                                    padding: getPadding(
                                        left: 27,
                                        top: 21,
                                        right: 27,
                                        bottom: 21),
                                    decoration: AppDecoration.fillWhiteA700,
                                    child: Stack(children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgHome,
                                          height: getSize(21),
                                          width: getSize(21),
                                          alignment: Alignment.center)
                                    ]))),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    margin: getMargin(left: 111),
                                    padding: getPadding(top: 21, bottom: 21),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgTicket,
                                              height: getVerticalSize(18),
                                              width: getHorizontalSize(22),
                                              margin:
                                                  getMargin(top: 2, bottom: 1)),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgMenu,
                                              height: getVerticalSize(20),
                                              width: getHorizontalSize(16),
                                              margin:
                                                  getMargin(top: 1, right: 119))
                                        ]))),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    height: getVerticalSize(63),
                                    width: getHorizontalSize(77),
                                    padding: getPadding(
                                        left: 25,
                                        top: 19,
                                        right: 25,
                                        bottom: 19),
                                    decoration: AppDecoration.fillWhiteA700,
                                    child: Stack(children: [
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgPlaceholder,
                                          height: getSize(24),
                                          width: getSize(24),
                                          radius: BorderRadius.circular(
                                              getHorizontalSize(12)),
                                          alignment: Alignment.center)
                                    ])))
                          ]))
                    ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft6(BuildContext context) {
    Navigator.pop(context);
  }
}
