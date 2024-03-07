/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 11/01/24
 */
import 'package:daily_account/core/resources/utility/utils.dart';
import 'package:daily_account/features/presentation/widgets/progress_widget.dart';
import 'package:flutter/material.dart';

class ProgressErrorWidget extends StatelessWidget {
  final Widget child;
  final Widget? progressWidget;
  final bool? isProgressRunning;
  final String? progressText;
  final double progressWidgetOpacity;

  const ProgressErrorWidget({
    super.key,
    required this.child,
    required this.isProgressRunning,
    this.progressText,
    this.progressWidgetOpacity = 0.6,
    this.progressWidget,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(!isProgressRunning!),
      child: Stack(
        children: <Widget>[
          child,
          Visibility(
            visible: isProgressRunning ?? false,
            child: Container(
              color: Colors.grey.withOpacity(progressWidgetOpacity),
              child: progressWidget ??
                  ProgressWidget(
                    progressText ?? Utils.getString('please_wait'),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
