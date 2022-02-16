import 'package:flutter/material.dart';
import 'package:order_ticket/helpers/size_configuration.dart';

class UserDetail extends StatelessWidget {
  final String itemImage, itemName;
  const UserDetail({Key? key, required this.itemImage, required this.itemName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.defaultSize * 2.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            itemImage,
            height: SizeConfig.defaultSize * 2.2,
            width: SizeConfig.defaultSize * 2.2,
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.defaultSize * 2.2),
            child: Text(itemName),
          )
        ],
      ),
    );
  }
}
