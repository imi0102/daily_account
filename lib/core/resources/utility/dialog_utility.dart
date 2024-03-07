/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 11/01/24
 */

import 'package:daily_account/core/constants/colors_constants.dart';
import 'package:daily_account/core/constants/icons_constants.dart';
import 'package:daily_account/core/constants/size_constants.dart';
import 'package:daily_account/core/resources/utility/style_utility.dart';
import 'package:daily_account/core/resources/utility/utils.dart';
import 'package:daily_account/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogUtility {
  static errorDialog({
    String? errorText,
    Function? onPressed,
  }) {
    showDialog(
      context: navKey.currentState!.context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.6),
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 14.0, bottom: 8.0),
                          child: SvgPicture.asset(
                            IconsConstants.errorIcon,
                            width: 48,
                            height: 48,
                            color: ColorsConstants.primary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                          child: Text(
                            "Error",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: StyleUtility.cardHeadingTextStyle(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text("$errorText",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: StyleUtility.contentTextStyle(),
                              softWrap: true),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Adjust the value as needed
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    if (onPressed != null) {
                                      onPressed();
                                    }
                                  },
                                  child: Text(
                                    Utils.getString('okay'),
                                    style: const TextStyle(
                                        fontSize: SizeConstants.fontSize_14),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Adjust the value as needed
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    Utils.getString('cancel'),
                                    style: const TextStyle(
                                        fontSize: SizeConstants.fontSize_14),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
