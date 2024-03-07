import 'package:daily_account/core/constants/size_constants.dart';
import 'package:daily_account/core/resources/utility/style_utility.dart';
import 'package:daily_account/core/resources/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pf_moneyonapp/constants/size_constants.dart';
import 'package:pf_moneyonapp/utils/style_utility.dart';
import 'package:pf_moneyonapp/utils/utils.dart';

class TextRowWidgetLabelAndValue extends StatelessWidget {
  final String mTitle;
  final dynamic mValue;
  final String mTitle1;
  final dynamic mValue1;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;

  const TextRowWidgetLabelAndValue(
    this.mTitle,
    this.mValue,
    this.mTitle1,
    this.mValue1, {
    Key? key,
    this.topPadding = 0.0,
    this.bottomPadding = SizeConstants.size_15,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
        left: leftPadding,
        right: rightPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: SizeConstants.size_8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Utils.isNotEmptyOrNotNull(mTitle) ? mTitle : "",
                    style: StyleUtility.labelTextStyle(),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: SizeConstants.size_4),
                  Text(
                    Utils.isNotEmptyOrNotNull(mValue) ? mValue : "-",
                    style: StyleUtility.contentTextStyle(),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mTitle1 ?? "",
                  style: StyleUtility.labelTextStyle(),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: SizeConstants.size_4),
                Text(
                  Utils.isNotEmptyOrNotNull(mValue1) ? mValue1 : "-",
                  style: StyleUtility.contentTextStyle(),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
