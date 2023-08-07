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
     this.balance,
     this.route,
     this.token
  ) ;

  final String shopName;
  final String address;
  final int id;
  final String createdAt;
  final String whatsappNo;
  final String phoneNo;
  final int balance;
   final String route;
  final String token;

  String whatsappurl = "https://wa.me/91";

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () async {
        // print('Clicked');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ShopDetailsPage(
                  id: token,
                  shopId: id.toString(),
                ),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: getMargin(top: 8),
        color: ColorConstant.blue600,
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadiusStyle
                .roundedBorder16),
        child: Container(
          height:
          getVerticalSize(138),
          width:
          getHorizontalSize(378),
          padding: getPadding(
              left: 13,
              top: 24,
              right: 13,
              bottom: 24),
          decoration: AppDecoration
              .fillBlue600
              .copyWith(
              borderRadius:
              BorderRadiusStyle
                  .roundedBorder16),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .start,
                crossAxisAlignment:
                CrossAxisAlignment
                    .end,
                children: [
                  CustomIconButton(
                      height: 40,
                      width: 40,
                      margin:
                      getMargin(
                          bottom:
                          54),
                      shape: IconButtonShape
                          .CircleBorder16,
                      padding:
                      IconButtonPadding
                          .PaddingAll8,
                      child: Text(shopName[0].toUpperCase())),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    mainAxisAlignment:
                    MainAxisAlignment
                        .start,
                    children: [
                      Text(
                          shopName,
                          overflow:
                          TextOverflow
                              .ellipsis,
                          textAlign:
                          TextAlign
                              .left,
                          style: AppStyle
                              .txtDMSansMedium20),
                      Text(
                          address,
                          overflow:
                          TextOverflow
                              .ellipsis,
                          textAlign:
                          TextAlign
                              .left,
                          style: AppStyle
                              .txtDMSansRegular18WhiteA700),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment
                    .bottomRight,
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .center,
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets
                          .only(
                          left:
                          8),
                      child: Row(
                        children: [
                          Text(
                            'Balance : ',
                            style: TextStyle(
                                color:
                                Colors.white),
                          ),
                          Text(
                            balance
                                .toString(),
                            style: TextStyle(
                                color:
                                Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text('Route : ',
                        style: TextStyle(
                          color: Colors.white
                        ),),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                         route,
                          overflow:
                          TextOverflow
                              .ellipsis,
                          textAlign:
                          TextAlign
                              .left,
                          style: AppStyle
                              .txtDMSansBold16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment
                    .topRight,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .end,
                  mainAxisSize:
                  MainAxisSize
                      .min,
                  children: [
                    Card(
                      clipBehavior: Clip
                          .antiAlias,
                      elevation: 0,
                      margin:
                      EdgeInsets
                          .all(0),
                      color: ColorConstant
                          .whiteA700,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadiusStyle
                              .roundedBorder12),
                      child:
                      GestureDetector(
                        onTap:
                            () async {

                          // https://wa.me/91" + whatsapp
                          await launch(
                              whatsappurl +
                                  whatsappNo);
                        },
                        child:
                        Container(
                          height:
                          getVerticalSize(
                              42),
                          width:
                          getHorizontalSize(
                              61),
                          padding: getPadding(
                              left:
                              18,
                              top: 8,
                              right:
                              18,
                              bottom:
                              8),
                          decoration: AppDecoration
                              .outlineBlack9003f
                              .copyWith(
                              borderRadius:
                              BorderRadiusStyle.roundedBorder12),
                          child:
                          Stack(
                            children: [
                              CustomImageView(
                                  imagePath:
                                  ImageConstant.imgWhatsapp31,
                                  height: getSize(25),
                                  width: getSize(25),
                                  alignment: Alignment.topCenter)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                        clipBehavior: Clip
                            .antiAlias,
                        elevation: 0,
                        margin:
                        getMargin(
                            left:
                            5),
                        color: ColorConstant
                            .whiteA700,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadiusStyle
                                .roundedBorder12),
                        child:
                        GestureDetector(
                          onTap:
                              () async {
                            await launch(
                                "tel:/${phoneNo}");
                          },
                          child: Container(
                              height: getVerticalSize(42),
                              width: getHorizontalSize(61),
                              padding: getPadding(left: 19, top: 9, right: 19, bottom: 9),
                              decoration: AppDecoration.outlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                              child: Stack(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgRectangle23x23,
                                    height: getSize(23),
                                    width: getSize(23),
                                    alignment: Alignment.topCenter)
                              ])),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
