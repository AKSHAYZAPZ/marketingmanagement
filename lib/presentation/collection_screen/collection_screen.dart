import '../collection_screen/widgets/collection_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:jibin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:jibin_s_application1/widgets/app_bar/custom_app_bar.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
          height: getVerticalSize(129),
          leadingWidth: 95,
          leading: AppbarImage(
              height: getVerticalSize(17),
              width: getHorizontalSize(21),
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 74, top: 50, bottom: 62),
              onTap: () {
                onTapArrowleft5(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Collection"),
          styleType: Style.bgStyle_3),
      body: Container(
        width: double.maxFinite,
        padding: getPadding(top: 5, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: getMargin(left: 69, right: 68),
              padding: getPadding(left: 26, top: 5, right: 26, bottom: 5),
              decoration: AppDecoration.gradientTeal300Lightblue700
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: getPadding(left: 5, top: 4),
                      child: Text("Opening Balance : ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtDMSansBoldItalic18)),
                  Padding(
                    padding: getPadding(left: 6, top: 2, bottom: 1),
                    child: Text("₹25400",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtDMSansBold18WhiteA700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstant.blueGray100,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('From Date'),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstant.lightBlue700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstant.blueGray100,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('To Date'),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstant.lightBlue700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Collection Amount',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Text('₹'),
                    ],
                  )
                ],
              ),
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorConstant.blueGray100,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft5(BuildContext context) {
    Navigator.pop(context);
  }
}
