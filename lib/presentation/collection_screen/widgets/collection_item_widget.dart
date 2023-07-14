import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class CollectionItemWidget extends StatelessWidget {
  const CollectionItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: getPadding(
          left: 9,
          top: 5,
          right: 9,
          bottom: 5,
        ),
        decoration: AppDecoration.outlineBlack9003f,
        child: Row(
          children: [
            Padding(
              padding: getPadding(
                top: 1,
                bottom: 3,
              ),
              child: Text(
                "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtDMSansBold10,
              ),
            ),
            Spacer(
              flex: 20,
            ),
            Padding(
              padding: getPadding(
                top: 4,
              ),
              child: Text(
                "10-06-23",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtDMSansBold10,
              ),
            ),
            Spacer(
              flex: 79,
            ),
            Padding(
              padding: getPadding(
                right: 18,
                bottom: 3,
              ),
              child: Text(
                "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtDMSansBold10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
