import 'package:flutter/material.dart';
import 'package:jibin_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class Listslno1ItemWidget extends StatelessWidget {
  const Listslno1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 10,
        top: 6,
        right: 10,
        bottom: 6,
      ),
      decoration: AppDecoration.outlineBlack9003f1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(
              bottom: 2,
            ),
            child: Text(
              "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtDMSansBold10,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 30,
              bottom: 2,
            ),
            child: Text(
              "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtDMSansBold10,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 45,
              bottom: 1,
            ),
            child: Text(
              "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtDMSansBold10,
            ),
          ),
          Spacer(
            flex: 53,
          ),
          Padding(
            padding: getPadding(
              top: 1,
              bottom: 1,
            ),
            child: Text(
              "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtDMSansBold10,
            ),
          ),
          Spacer(
            flex: 46,
          ),
          Padding(
            padding: getPadding(
              right: 2,
              bottom: 2,
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
    );
  }
}
