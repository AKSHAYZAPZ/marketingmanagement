import '../product_screen/widgets/listone_item_widget.dart';
import '../product_screen/widgets/listsix_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  // GetProductDetails)()async{
  //
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
            height: getVerticalSize(122),
            leadingWidth: 95,
            leading: AppbarImage(
                height: getVerticalSize(16),
                width: getHorizontalSize(21),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 74, top: 48, bottom: 57),
                onTap: () {
                  onTapArrowleft3(context);
                }),
            title: AppbarTitle(text: "Products", margin: getMargin(left: 59)),
            styleType: Style.bgStyle_1),
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
                          style: AppStyle.txtDMSansBold16Bluegray900)),
                  Align(
                      alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: getPadding(left: 16, top: 4),
                          child: IntrinsicWidth(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgOverlay75x74,
                                    height: getVerticalSize(75),
                                    width: getHorizontalSize(74),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(16))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgOverlay1,
                                    height: getVerticalSize(75),
                                    width: getHorizontalSize(74),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(16)),
                                    margin: getMargin(left: 11)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgOverlay2,
                                    height: getVerticalSize(75),
                                    width: getHorizontalSize(74),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(16)),
                                    margin: getMargin(left: 11)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgOverlay3,
                                    height: getVerticalSize(75),
                                    width: getHorizontalSize(74),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(16)),
                                    margin: getMargin(left: 11)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgOverlay4,
                                    height: getVerticalSize(75),
                                    width: getHorizontalSize(74),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(16)),
                                    margin: getMargin(left: 11))
                              ])))),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: getPadding(left: 34, top: 5, right: 9),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(bottom: 14),
                                    child: Text("Monitor",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtDMSansMedium10)),
                                Container(
                                    width: getHorizontalSize(37),
                                    margin: getMargin(left: 48, bottom: 3),
                                    child: Text("Testing Devices",
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.txtDMSansMedium10)),
                                Container(
                                    width: getHorizontalSize(54),
                                    margin:
                                        getMargin(left: 40, top: 1, bottom: 1),
                                    child: Text("Semi-\nconductors",
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.txtDMSansMedium10)),
                                Padding(
                                    padding: getPadding(left: 32, bottom: 14),
                                    child: Text("Hand Tools",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtDMSansMedium10)),
                                Container(
                                    width: getHorizontalSize(33),
                                    margin: getMargin(left: 43, top: 1),
                                    child: Text("Water\npumps",
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.txtDMSansMedium10))
                              ]))),
                  Padding(
                    padding: getPadding(top: 16, right: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: getVerticalSize(1),
                            width: getHorizontalSize(8),
                            margin: getMargin(top: 276, bottom: 380),
                            decoration: BoxDecoration(
                                color: ColorConstant.blueGray100)),
                        Container(
                          height: getVerticalSize(658),
                          width: getHorizontalSize(383),
                          margin: getMargin(left: 8),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(right: 1),
                                      child: SingleChildScrollView(
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: getMargin(left: 1),
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
                                                            padding: getPadding(
                                                                left: 2,
                                                                top: 1,
                                                                right: 2,
                                                                bottom: 1),
                                                            decoration:
                                                                AppDecoration
                                                                    .fillBluegray50,
                                                            child:
                                                                Stack(children: [
                                                              CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgSearch,
                                                                  height:
                                                                      getVerticalSize(
                                                                          20),
                                                                  width:
                                                                      getHorizontalSize(
                                                                          22),
                                                                  alignment:
                                                                      Alignment
                                                                          .center)
                                                            ])),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 24,
                                                                top: 3,
                                                                right: 212,
                                                                bottom: 1),
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
                                              Container(
                                                  height: getVerticalSize(29),
                                                  width: getHorizontalSize(381),
                                                  margin: getMargin(top: 31),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant.gray50,
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
                                                            offset: Offset(0, 4))
                                                      ])),
                                              Container(
                                                  height: getVerticalSize(173),
                                                  width: getHorizontalSize(381),
                                                  margin: getMargin(top: 371),
                                                  child: Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        29),
                                                                width:
                                                                    getHorizontalSize(
                                                                        381),
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .whiteA700,
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
                                                                          offset: Offset(
                                                                              0,
                                                                              4))
                                                                    ]))),
                                                        Align(
                                                            alignment:
                                                                Alignment.center,
                                                            child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                      height:
                                                                          getVerticalSize(
                                                                              29),
                                                                      width:
                                                                          getHorizontalSize(
                                                                              381),
                                                                      decoration: BoxDecoration(
                                                                          color: ColorConstant
                                                                              .gray50,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                color: ColorConstant.black9003f,
                                                                                spreadRadius: getHorizontalSize(2),
                                                                                blurRadius: getHorizontalSize(2),
                                                                                offset: Offset(0, 4))
                                                                          ])),
                                                                  Container(
                                                                      height:
                                                                          getVerticalSize(
                                                                              29),
                                                                      width:
                                                                          getHorizontalSize(
                                                                              381),
                                                                      margin:
                                                                          getMargin(
                                                                              top:
                                                                                  7),
                                                                      decoration: BoxDecoration(
                                                                          color: ColorConstant
                                                                              .whiteA700,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                color: ColorConstant.black9003f,
                                                                                spreadRadius: getHorizontalSize(2),
                                                                                blurRadius: getHorizontalSize(2),
                                                                                offset: Offset(0, 4))
                                                                          ])),
                                                                  Container(
                                                                      height:
                                                                          getVerticalSize(
                                                                              29),
                                                                      width:
                                                                          getHorizontalSize(
                                                                              381),
                                                                      margin:
                                                                          getMargin(
                                                                              top:
                                                                                  7),
                                                                      decoration: BoxDecoration(
                                                                          color: ColorConstant
                                                                              .gray50,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                color: ColorConstant.black9003f,
                                                                                spreadRadius: getHorizontalSize(2),
                                                                                blurRadius: getHorizontalSize(2),
                                                                                offset: Offset(0, 4))
                                                                          ]))
                                                                ])),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        29),
                                                                width:
                                                                    getHorizontalSize(
                                                                        381),
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .whiteA700,
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
                                                                          offset: Offset(
                                                                              0,
                                                                              4))
                                                                    ]))),
                                                        Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        right:
                                                                            40),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomImageView(
                                                                          imagePath:
                                                                              ImageConstant
                                                                                  .imgRectangle19x19,
                                                                          height: getSize(
                                                                              19),
                                                                          width: getSize(
                                                                              19)),
                                                                      CustomImageView(
                                                                          imagePath:
                                                                              ImageConstant
                                                                                  .imgRectangle19x19,
                                                                          height: getSize(
                                                                              19),
                                                                          width: getSize(
                                                                              19),
                                                                          margin: getMargin(
                                                                              top:
                                                                                  18)),
                                                                      CustomImageView(
                                                                          imagePath:
                                                                              ImageConstant
                                                                                  .imgRectangle19x19,
                                                                          height: getSize(
                                                                              19),
                                                                          width: getSize(
                                                                              19),
                                                                          margin: getMargin(
                                                                              top:
                                                                                  17)),
                                                                      CustomImageView(
                                                                          imagePath:
                                                                              ImageConstant
                                                                                  .imgRectangle19x19,
                                                                          height: getVerticalSize(
                                                                              20),
                                                                          width: getHorizontalSize(
                                                                              19),
                                                                          margin: getMargin(
                                                                              top:
                                                                                  16)),
                                                                      CustomImageView(
                                                                          imagePath:
                                                                              ImageConstant
                                                                                  .imgRectangle19x19,
                                                                          height: getSize(
                                                                              19),
                                                                          width: getSize(
                                                                              19),
                                                                          margin: getMargin(
                                                                              top:
                                                                                  17))
                                                                    ]))),
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            153),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "54820",
                                                                          overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                          textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                          style: AppStyle
                                                                              .txtDMSansBold10),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  22),
                                                                          child: Text(
                                                                              "54820",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  22),
                                                                          child: Text(
                                                                              "54820",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  20),
                                                                          child: Text(
                                                                              "54820",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  24),
                                                                          child: Text(
                                                                              "54820",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10))
                                                                    ]))),
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left: 58),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "Shower",
                                                                          overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                          textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                          style: AppStyle
                                                                              .txtDMSansBold10),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  19),
                                                                          child: Text(
                                                                              "Water Motor",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  22),
                                                                          child: Text(
                                                                              "PVC Pipe",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  18),
                                                                          child: Text(
                                                                              "Induction",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  25),
                                                                          child: Text(
                                                                              "Pipe",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10))
                                                                    ]))),
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left: 5),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                          alignment:
                                                                              Alignment
                                                                                  .centerRight,
                                                                          child: Padding(
                                                                              padding:
                                                                                  getPadding(right: 1),
                                                                              child: Text("11", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansBold10))),
                                                                      Align(
                                                                          alignment:
                                                                              Alignment
                                                                                  .center,
                                                                          child: Padding(
                                                                              padding:
                                                                                  getPadding(top: 21),
                                                                              child: Text("12", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansBold10))),
                                                                      Align(
                                                                          alignment:
                                                                              Alignment
                                                                                  .center,
                                                                          child: Padding(
                                                                              padding:
                                                                                  getPadding(top: 22),
                                                                              child: Text("13", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansBold10))),
                                                                      Align(
                                                                          alignment:
                                                                              Alignment
                                                                                  .center,
                                                                          child: Padding(
                                                                              padding:
                                                                                  getPadding(top: 20),
                                                                              child: Text("14", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansBold10))),
                                                                      Align(
                                                                          alignment:
                                                                              Alignment
                                                                                  .center,
                                                                          child: Padding(
                                                                              padding:
                                                                                  getPadding(top: 24),
                                                                              child: Text("15", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansBold10)))
                                                                    ]))),
                                                        Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        right:
                                                                            97),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "₹5000",
                                                                          overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                          textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                          style: AppStyle
                                                                              .txtDMSansBold10),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  22),
                                                                          child: Text(
                                                                              "₹6000",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  22),
                                                                          child: Text(
                                                                              "₹7000",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  20),
                                                                          child: Text(
                                                                              "₹8000",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  24),
                                                                          child: Text(
                                                                              "₹2500",
                                                                              overflow:
                                                                                  TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtDMSansBold10))
                                                                    ])))
                                                      ]))
                                            ]),
                                      ))),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: getPadding(top: 88),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(left: 10, right: 38),
                                          child: Row(children: [
                                            Text("SL No",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    AppStyle.txtDMSansBold10),
                                            Padding(
                                                padding: getPadding(left: 18),
                                                child: Text("Product  Name",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansBold10)),
                                            Padding(
                                                padding: getPadding(left: 25),
                                                child: Text("Product Code",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansBold10)),
                                            Padding(
                                                padding: getPadding(left: 28),
                                                child: Text("Price",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansBold10)),
                                            Padding(
                                                padding: getPadding(left: 47),
                                                child: Text("View",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansBold10))
                                          ])),
                                      Container(
                                        height: getVerticalSize(354),
                                        width: getHorizontalSize(383),
                                        margin: getMargin(top: 15),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Container(
                                                    height: getVerticalSize(29),
                                                    width:
                                                        getHorizontalSize(381),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .whiteA700,
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
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  29),
                                                          width:
                                                              getHorizontalSize(
                                                                  381),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .gray50,
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
                                                                        Offset(
                                                                            0,
                                                                            4))
                                                              ])),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  29),
                                                          width:
                                                              getHorizontalSize(
                                                                  381),
                                                          margin:
                                                              getMargin(top: 7),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .whiteA700,
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
                                                                        Offset(
                                                                            0,
                                                                            4))
                                                              ])),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  29),
                                                          width:
                                                              getHorizontalSize(
                                                                  381),
                                                          margin:
                                                              getMargin(top: 7),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .gray50,
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
                                                                        Offset(
                                                                            0,
                                                                            4))
                                                              ])),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  29),
                                                          width:
                                                              getHorizontalSize(
                                                                  381),
                                                          margin:
                                                              getMargin(top: 7),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .whiteA700,
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
                                                                        Offset(
                                                                            0,
                                                                            4))
                                                              ])),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  29),
                                                          width:
                                                              getHorizontalSize(
                                                                  381),
                                                          margin:
                                                              getMargin(top: 8),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .whiteA700,
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
                                                                        Offset(
                                                                            0,
                                                                            4))
                                                              ])),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  29),
                                                          width:
                                                              getHorizontalSize(
                                                                  381),
                                                          margin:
                                                              getMargin(top: 7),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .gray50,
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
                                                                        Offset(
                                                                            0,
                                                                            4))
                                                              ])),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  29),
                                                          width:
                                                              getHorizontalSize(
                                                                  381),
                                                          margin:
                                                              getMargin(top: 7),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .whiteA700,
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
                                                                        Offset(
                                                                            0,
                                                                            4))
                                                              ])),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  29),
                                                          width:
                                                              getHorizontalSize(
                                                                  381),
                                                          margin:
                                                              getMargin(top: 7),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .gray50,
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
                                                                        Offset(
                                                                            0,
                                                                            4))
                                                              ]))
                                                    ])),
                                            Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                    height: getVerticalSize(29),
                                                    width:
                                                        getHorizontalSize(381),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .whiteA700,
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
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                    padding:
                                                        getPadding(right: 41),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 1,
                                                                      bottom:
                                                                          1),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child: Text(
                                                                            "54820",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtDMSansBold10)),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child: Padding(
                                                                            padding:
                                                                                getPadding(top: 22),
                                                                            child: Text("54820", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansBold10))),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                22),
                                                                        child: Text(
                                                                            "54820",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtDMSansBold10)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                20),
                                                                        child: Text(
                                                                            "54820",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtDMSansBold10)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                24),
                                                                        child: Text(
                                                                            "54820",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtDMSansBold10)),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child: Padding(
                                                                            padding:
                                                                                getPadding(top: 25),
                                                                            child: Text("54820", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansBold10))),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        child: Padding(
                                                                            padding:
                                                                                getPadding(top: 22),
                                                                            child: Text("54820", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtDMSansBold10))),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                22),
                                                                        child: Text(
                                                                            "54820",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtDMSansBold10)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                20),
                                                                        child: Text(
                                                                            "54820",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtDMSansBold10)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                24),
                                                                        child: Text(
                                                                            "54820",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtDMSansBold10))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left:
                                                                          136),
                                                              child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle19x19,
                                                                        height: getSize(
                                                                            19),
                                                                        width: getSize(
                                                                            19),
                                                                        onTap:
                                                                            () {
                                                                          onTapImgRectanglefive(
                                                                              context);
                                                                        }),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle19x19,
                                                                        height: getSize(
                                                                            19),
                                                                        width: getSize(
                                                                            19),
                                                                        margin: getMargin(
                                                                            top:
                                                                                17)),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle19x19,
                                                                        height: getVerticalSize(
                                                                            20),
                                                                        width: getHorizontalSize(
                                                                            19),
                                                                        margin: getMargin(
                                                                            top:
                                                                                16)),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle19x19,
                                                                        height: getSize(
                                                                            19),
                                                                        width: getSize(
                                                                            19),
                                                                        margin: getMargin(
                                                                            top:
                                                                                17)),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle19x19,
                                                                        height: getSize(
                                                                            19),
                                                                        width: getSize(
                                                                            19),
                                                                        margin: getMargin(
                                                                            top:
                                                                                17)),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle19x19,
                                                                        height: getSize(
                                                                            19),
                                                                        width: getSize(
                                                                            19),
                                                                        margin: getMargin(
                                                                            top:
                                                                                18)),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle19x19,
                                                                        height: getSize(
                                                                            19),
                                                                        width: getSize(
                                                                            19),
                                                                        margin: getMargin(
                                                                            top:
                                                                                17)),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle19x19,
                                                                        height: getVerticalSize(
                                                                            20),
                                                                        width: getHorizontalSize(
                                                                            19),
                                                                        margin: getMargin(
                                                                            top:
                                                                                16)),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle19x19,
                                                                        height: getSize(
                                                                            19),
                                                                        width: getSize(
                                                                            19),
                                                                        margin: getMargin(
                                                                            top:
                                                                                17)),
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle19x19,
                                                                        height: getSize(
                                                                            19),
                                                                        width: getSize(
                                                                            19),
                                                                        margin: getMargin(
                                                                            top:
                                                                                17))
                                                                  ]))
                                                        ]))),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: getPadding(left: 6),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          getVerticalSize(159),
                                                      child: ListView.separated(
                                                        padding: getPadding(
                                                            left: 2, right: 1),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return SizedBox(
                                                              height:
                                                                  getVerticalSize(
                                                                      41));
                                                        },
                                                        itemCount: 3,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return ListoneItemWidget();
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getVerticalSize(183),
                                                      child: ListView.separated(
                                                        padding:
                                                            getPadding(top: 24),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return SizedBox(
                                                              height:
                                                                  getVerticalSize(
                                                                      39));
                                                        },
                                                        itemCount: 3,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return ListsixItemWidget();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(top: 102),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: ColorConstant.gray100,
                        indent: getHorizontalSize(13),
                        endIndent: getHorizontalSize(21),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the productDScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the productDScreen.
  onTapImgRectanglefive(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productDScreen);
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}
