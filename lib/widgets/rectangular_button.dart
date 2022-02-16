import 'package:flutter/material.dart';
import 'package:order_ticket/helpers/size_configuration.dart';

class RectangularButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color textColor, buttonColor;

  const RectangularButton(
      {Key? key,
      required this.onPress,
      required this.text,
      required this.textColor,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 1.5),
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: SizeConfig.defaultSize * 1.5,
              fontWeight: FontWeight.w600),
        ),
      ),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: buttonColor,
      ),
    );
  }
}
