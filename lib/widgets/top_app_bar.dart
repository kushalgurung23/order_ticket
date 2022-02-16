import 'package:flutter/material.dart';
import 'package:order_ticket/helpers/size_configuration.dart';

AppBar topAppBar({
  required BuildContext context,
  Widget? firstIcon, secondIcon,
  VoidCallback? firstOnPress, secondOnPress,
  Widget? titleWidget,
  Widget? secondGestureWidget,
  VoidCallback? secondGestureOnPress,
  required bool useTrailingGesture,
}) {
  SizeConfig.init(context);
  return AppBar(
    titleSpacing: 10,
    backgroundColor: Colors.white,
    elevation: 10,
    shadowColor: const Color(0x00000000).withOpacity(0.25),
    title: titleWidget,
    leading: Center(
      child: IconButton(
        splashRadius: SizeConfig.defaultSize * 2.5,
        onPressed: firstOnPress,
        icon: firstIcon!,
        color: Colors.black,
      ),
    ),
    actions: useTrailingGesture
        ? [
            Center(
              child: Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize * 2),
                child: GestureDetector(
                  child: secondGestureWidget,
                  onTap: secondGestureOnPress,
                ),
              ),
            ),
          ]
        : [
            Center(
              child: IconButton(
                splashRadius: SizeConfig.defaultSize * 2.5,
                onPressed: secondOnPress,
                icon: secondIcon!,
                color: Colors.black,
              ),
            )
          ],
  );
}
