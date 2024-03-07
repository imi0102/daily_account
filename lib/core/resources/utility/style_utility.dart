/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 11/01/24
 */

import 'dart:ui';
import 'package:daily_account/core/constants/colors_constants.dart';
import 'package:daily_account/core/constants/size_constants.dart';
import 'package:flutter/material.dart';

class StyleUtility {
  //Header Text
  TextStyle headerText() {
    return const TextStyle(fontSize: 27, fontWeight: FontWeight.bold);
  }

  //Title
  TextStyle titleText() {
    return const TextStyle();
  }

  //Item Title
  TextStyle itemTitleText() {
    return const TextStyle();
  }

  //Item Description
  TextStyle itemDescriptionText() {
    return const TextStyle();
  }

  //Button Text
  TextStyle buttonText() {
    return const TextStyle();
  }

  static TextStyle labelTextStyle(BuildContext context,
      {FontWeight fontWeight = FontWeight.w400,
      Color color = ColorsConstants.grey,
      double fontSize = SizeConstants.fontSizeSubTitle}) {
    return TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color);
  }

  static TextStyle contentTextStyle(
      {FontWeight fontWeight = FontWeight.w400,
      Color color = ColorsConstants.black,
      double fontSize = SizeConstants.fontSizeContent}) {
    return TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color,);
  }

  static TextStyle optionMenuTextStyle() {
    return const TextStyle(
      fontSize: SizeConstants.fontSizeSubTitle,
      color: ColorsConstants.black,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle cardHeadingTextStyle() {
    return const TextStyle(
      fontSize: SizeConstants.fontSizeTitle,
      color: ColorsConstants.black,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle dialogTitleStyle() {
    return const TextStyle(
      fontSize: SizeConstants.fontSizeTitle,
      color: ColorsConstants.black,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle cardItemLabelTextStyle() {
    return const TextStyle(
        fontSize: SizeConstants.fontSizeSubTitle,
        color: ColorsConstants.greyDark,
        fontWeight: FontWeight.w400 //w400 means normal font.
        );
  }

  static TextStyle cardItemValueStyle() {
    return const TextStyle(
      fontSize: SizeConstants.fontSizeContent,
      color: ColorsConstants.black,
      fontWeight: FontWeight.normal,
    );
  }

  static Text getCommonDropDownText({String? valueToBeDisplay}) {
    return Text(
      valueToBeDisplay ?? "",
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          color: Colors.black, fontSize: SizeConstants.fontSizeContent),
    );
  }

  static Text getCommonButtonTextStyle(String valueToBeDisplay) {
    return Text(valueToBeDisplay,
        style: const TextStyle(
            fontSize: SizeConstants.fontSizeButton,
            color: Colors.white,
            fontWeight: FontWeight.normal));
  }

  static InputDecoration getCommonSimpleTextFieldWidget(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return InputDecoration(
        fillColor: Colors.black,
        contentPadding: const EdgeInsets.only(top: SizeConstants.size_8),
        hintStyle: const TextStyle(
            color: ColorsConstants.grey,
            fontSize: SizeConstants.fontSizeContent),
        labelText: labelTextStr,
        labelStyle: const TextStyle(
            color: ColorsConstants.grey,
            fontSize: SizeConstants.fontSizeContent),
        hintText: hintTextStr,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsConstants.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsConstants.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsConstants.primary),
        ));
  }

  static TextStyle attachmentNameStyle() {
    return const TextStyle(
      fontSize: SizeConstants.fontSizeTitle,
      color: ColorsConstants.primary,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle actionBarActionTextStyle() {
    return const TextStyle(
        fontSize: SizeConstants.fontSize_14,
        fontWeight: FontWeight.w600,
        color: ColorsConstants.primaryDark);
  }

  static TextStyle actionBarTitleTextStyle() {
    return const TextStyle(
        fontWeight: FontWeight.bold, color: ColorsConstants.primaryDark);
  }

  static Text getRequiredFieldStarTextSymbol(BuildContext context) {
    return const Text(
      "*",
      style: TextStyle(
          color: ColorsConstants.black,
          fontWeight: FontWeight.bold,
          fontSize: SizeConstants.fontSize_18),
    );
  }
}
