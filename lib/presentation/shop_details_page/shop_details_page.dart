import 'package:get/get.dart';

import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../shop_details_page/widgets/listordernumber1_item_widget.dart';
import '../shop_details_page/widgets/listslno1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/widgets/custom_button.dart';


class ShopDetailsPage extends StatefulWidget {
  const ShopDetailsPage({Key? key})
      : super(
          key: key,
        );

  @override
  ShopDetailsPageState createState() => ShopDetailsPageState();
}

class ShopDetailsPageState extends State<ShopDetailsPage>
    with AutomaticKeepAliveClientMixin<ShopDetailsPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    var imgHeaderBlue600;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.whiteA700,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.maxFinite,
                  child: Container(
                      width: double.maxFinite,
                      padding: getPadding(
                          left: 20, top: 46, right: 20, bottom: 46),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                              AssetImage(ImageConstant.imgHeaderBlue600),
                              fit: BoxFit.cover)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                                text: "lbl_tradly_store2".tr,
                                margin: getMargin(top: 5, right: 100),
                                shape: ButtonShape.Square,
                                prefixWidget: Container(
                                    margin: getMargin(right: 30),
                                    child: CustomImageView(
                                        ),
                               )
                            ),],))),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: getPadding(top: 15, right: 26),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                width: getHorizontalSize(55),
                                margin: getMargin(top: 12, bottom: 5),
                                child: Text("lbl_mark_visit".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.txtDMSansRegular12)),
                          ]))),
              Container(
                  margin: getMargin(left: 26, top: 16, right: 26),
                  padding:
                  getPadding(left: 20, top: 21, right: 20, bottom: 21),
                  decoration: AppDecoration.fillBlue600.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(right: 2),
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomIconButton(
                                      height: 44,
                                      width: 44,
                                      margin: getMargin(bottom: 25),
                                      child: CustomImageView(
                                          svgPath:
                                          ImageConstant.imgArrowdown)),
                                  Padding(
                                      padding: getPadding(left: 7),
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          top: 1, bottom: 6),
                                                      child: Text(
                                                          "lbl_tradly_store"
                                                              .tr,
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: AppStyle
                                                              .txtDMSansMedium16WhiteA700)),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgStar,
                                                      height:
                                                      getVerticalSize(10),
                                                      width:
                                                      getHorizontalSize(
                                                          15),
                                                      margin: getMargin(
                                                          left: 12,
                                                          top: 6,
                                                          bottom: 12)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 4,
                                                          top: 6,
                                                          bottom: 7),
                                                      child: Text(
                                                          "lbl_5_8".tr,
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: AppStyle
                                                              .txtMontserratRomanBold12)),
                                                  Card(
                                                      clipBehavior:
                                                      Clip.antiAlias,
                                                      elevation: 0,
                                                      margin:
                                                      getMargin(left: 29),
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder10),
                                                      child: Container(
                                                          height:
                                                          getVerticalSize(
                                                              29),
                                                          width:
                                                          getHorizontalSize(
                                                              43),
                                                          padding: getPadding(
                                                              left: 12,
                                                              top: 5,
                                                              right: 12,
                                                              bottom: 5),
                                                          decoration: AppDecoration
                                                              .outlineBlack9003f
                                                              .copyWith(
                                                              borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder10),
                                                          child: Stack(
                                                              children: [
                                                                CustomImageView(
                                                                    imagePath:
                                                                    ImageConstant
                                                                        .imgWhatsapp31,
                                                                    height:
                                                                    getSize(
                                                                        17),
                                                                    width:
                                                                    getSize(
                                                                        17),
                                                                    alignment:
                                                                    Alignment
                                                                        .topCenter)
                                                              ]))),
                                                  Card(
                                                      clipBehavior:
                                                      Clip.antiAlias,
                                                      elevation: 0,
                                                      margin:
                                                      getMargin(left: 3),
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder10),
                                                      child: Container(
                                                          height:
                                                          getVerticalSize(
                                                              29),
                                                          width:
                                                          getHorizontalSize(
                                                              43),
                                                          padding: getPadding(
                                                              left: 13,
                                                              top: 6,
                                                              right: 13,
                                                              bottom: 6),
                                                          decoration: AppDecoration
                                                              .outlineBlack9003f
                                                              .copyWith(
                                                              borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder10),
                                                          child: Stack(
                                                              children: [
                                                                CustomImageView(
                                                                    imagePath:
                                                                    ImageConstant
                                                                        .imgRectangle,
                                                                    height:
                                                                    getSize(
                                                                        16),
                                                                    width:
                                                                    getSize(
                                                                        16),
                                                                    alignment:
                                                                    Alignment
                                                                        .topCenter)
                                                              ])))
                                                ]),
                                            Container(
                                                width: getHorizontalSize(90),
                                                margin: getMargin(left: 4),
                                                child: Text(
                                                    "msg_nap_junction_kathrikadavu"
                                                        .tr,
                                                    maxLines: null,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtDMSansRegular14WhiteA700))
                                          ]))
                                ])),
                        Padding(
                            padding: getPadding(top: 19),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("lbl_gst_no".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtDMSansRegular16),
                                  Padding(
                                      padding: getPadding(left: 3),
                                      child: Text("lbl_22aaaaa0000a1z5".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtDMSansBold16))
                                ])),
                        Padding(
                            padding: getPadding(left: 2, top: 28),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCalendar,
                                      height: getVerticalSize(18),
                                      width: getHorizontalSize(16),
                                      margin: getMargin(top: 15, bottom: 17)),
                                  Padding(
                                      padding: getPadding(
                                          left: 6, top: 17, bottom: 14),
                                      child: Text("lbl_13_06_2023".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtDMSansBold14)),
                                  Spacer(),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgComputer,
                                      height: getSize(51),
                                      width: getSize(51))
                                ]))
                      ])),
              Padding(
                  padding: getPadding(left: 35, top: 24, right: 32),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: getPadding(top: 5, bottom: 1),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("lbl_order_details".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtDMSansBold14IndigoA700
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.14))),
                                  Padding(
                                      padding: getPadding(top: 5),
                                      child: SizedBox(
                                          width: getHorizontalSize(90),
                                          child: Divider(
                                              height: getVerticalSize(2),
                                              thickness: getVerticalSize(2),
                                              color:
                                              ColorConstant.indigoA700)))
                                ])),
                        Padding(
                            padding: getPadding(left: 30, top: 10, bottom: 3),
                            child: Text("lbl_payment_details".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtDMSansBold14Gray700
                                    .copyWith(
                                    letterSpacing:
                                    getHorizontalSize(0.14)))),
                        CustomButton(
                            height: getVerticalSize(33),
                            width: getHorizontalSize(98),
                            text: "lbl_take_orders".tr,
                            margin: getMargin(left: 28),
                            variant: ButtonVariant.FillLightblueA200,
                            shape: ButtonShape.RoundedBorder16,
                            fontStyle: ButtonFontStyle.DMSansBold12)
                      ])),
              Padding(
                  padding: getPadding(left: 26, top: 17, right: 26),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                            width: getHorizontalSize(179),
                            focusNode: FocusNode(),
                            autofocus: true,

                            hintText: "msg_product_name_or".tr,
                            variant: TextFormFieldVariant.OutlineBlack9003f,
                            shape: TextFormFieldShape.RoundedBorder21,
                            padding: TextFormFieldPadding.PaddingAll13,
                            fontStyle: TextFormFieldFontStyle.DMSansMedium10,
                            textInputAction: TextInputAction.done,
                            validator: (value) {

                            }),
                        CustomButton(
                            height: getVerticalSize(43),
                            width: getHorizontalSize(107),
                            text: "lbl_quantity".tr,
                            margin: getMargin(left: 10),
                            variant: ButtonVariant.OutlineBlack9003f,
                            shape: ButtonShape.RoundedBorder21,
                            padding: ButtonPadding.PaddingAll13,
                            fontStyle: ButtonFontStyle.DMSansMedium10),
                        Container(
                            width: getHorizontalSize(69),
                            margin: getMargin(left: 10),
                            padding: getPadding(
                                left: 25, top: 1, right: 25, bottom: 1),
                            decoration: AppDecoration.txtFillLightblue700
                                .copyWith(
                                borderRadius:
                                BorderRadiusStyle.txtRoundedBorder21),
                            child: Text("lbl".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtDMSansBold30))
                      ])),
              CustomButton(
                  height: getVerticalSize(47),
                  width: getHorizontalSize(220),
                  text: "lbl_generate_bill".tr,
                  margin: getMargin(top: 272, right: 27),
                  variant: ButtonVariant.FillBlue600,
                  alignment: Alignment.centerRight),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: getPadding(left: 23, top: 18),
                      child: Text("lbl_recent_orders".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtDMSansBold18.copyWith(
                              letterSpacing: getHorizontalSize(0.18))))),
              Padding(
                padding: getPadding(left: 23, top: 8, right: 23),
                child: Obx(
                      () => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(20));
                    },
                    itemCount: controller.shopDetailsModelObj.value
                        .shopDetailsItemList.value.length,
                    itemBuilder: (context, index) {
                      ShopDetailsItemModel model = controller
                          .shopDetailsModelObj
                          .value
                          .shopDetailsItemList
                          .value[index];
                      return ShopDetailsItemWidget(model);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  }
}
