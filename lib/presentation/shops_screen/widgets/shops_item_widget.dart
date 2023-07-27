import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/presentation/shop_details_page/shop_details_page.dart';
import 'package:jibin_s_application1/widgets/custom_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ShopsItemWidget extends StatelessWidget {
   ShopsItemWidget(
     this.shopName,
     this.address,
     this.id,
     this.createdAt,
     this.whatsappNo,
     this.phoneNo,
       this.token
  ) ;

  final String shopName;
  final String address;
  final int id;
  final DateTime createdAt;
  final String whatsappNo;
  final String phoneNo;
  final String token;

  String whatsappurl = "https://wa.me/91";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String shopId = id.toString();
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShopDetailsPage(id: token, shopId: shopId),));
      },
      child: Container(
        padding: getPadding(
          all: 18,
        ),
        decoration: AppDecoration.fillBlue600.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: CustomIconButton(
                height: 44,
                width: 44,
                margin: getMargin(
                  bottom: 48,
                ),
                child: CustomImageView(
                  svgPath: ImageConstant.imgArrowdown,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 3,
                        bottom: 4,
                      ),
                      child: Text(
                        shopName,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtDMSansMedium16WhiteA700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: getHorizontalSize(
                    90,
                  ),
                  child: Text(
                    address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtDMSansRegular14WhiteA700,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      top: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgCalendar,
                          height: getVerticalSize(
                            18,
                          ),
                          width: getHorizontalSize(
                            16,
                          ),
                          margin: getMargin(
                            bottom: 2,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 6,
                            top: 1,
                          ),
                          child: Text(createdAt.toString(),

                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtDMSansBold14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: GestureDetector(
                onTap: ()async {
                  var whatsapp = whatsappNo;
                  await launch(
                      whatsappurl +
                          whatsapp);
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: getMargin(
                    left: 20,
                  ),
                  color: ColorConstant.whiteA700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Container(
                    height: getVerticalSize(
                      29,
                    ),
                    width: getHorizontalSize(
                      43,
                    ),
                    padding: getPadding(
                      left: 12,
                      top: 5,
                      right: 12,
                      bottom: 5,
                    ),
                    decoration: AppDecoration.outlineBlack9003f.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Stack(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgWhatsapp31,
                          height: getSize(
                            17,
                          ),
                          width: getSize(
                            17,
                          ),
                          alignment: Alignment.topCenter,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap:  () async{
                await launch(
                    "tel:/${phoneNo}");
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: getMargin(
                  left: 3,
                ),
                color: ColorConstant.whiteA700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: Container(
                  height: getVerticalSize(
                    29,
                  ),
                  width: getHorizontalSize(
                    43,
                  ),
                  padding: getPadding(
                    left: 13,
                    top: 6,
                    right: 13,
                    bottom: 6,
                  ),
                  decoration: AppDecoration.outlineBlack9003f.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Stack(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle23x23,
                        height: getSize(
                          16,
                        ),
                        width: getSize(
                          16,
                        ),
                        alignment: Alignment.topCenter,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
