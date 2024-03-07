import 'package:daily_account/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonAppBarWithCallBack extends StatelessWidget
    implements PreferredSizeWidget {
  final BuildContext context;
  final String? appBarTitle;
  bool? canRefresh, showBackButton, isCloseApp;
  List<Widget>? appBarActions;
  Function? onBackCallBack;

  @override
  final Size preferredSize = const Size.fromHeight(60.0);

  CommonAppBarWithCallBack(
      {super.key,
      required this.context,
      required this.appBarTitle,
      this.isCloseApp = false,
      this.appBarActions,
      this.canRefresh,
      this.onBackCallBack,
      this.showBackButton = true});

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        leadingWidth: !showBackButton! ? 12.0 : 56.0,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          appBarTitle!,
          softWrap: true,
          style: const TextStyle(
              color: ColorsConstants.white,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        backgroundColor: ColorsConstants.primaryDark,
        titleSpacing: 0.0,
        centerTitle: false,
        leading: Visibility(
          visible: showBackButton ?? false,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: ColorsConstants.white),
            onPressed: () async {
              if (onBackCallBack != null) {
                onBackCallBack!();
              } else {
                if (isCloseApp!) {
                  SystemNavigator.pop();
                } else {
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        ),
        actions: appBarActions ?? [],
        systemOverlayStyle: SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    return buildAppBar(context);
  }
}
