import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_ticket/helpers/size_configuration.dart';
import 'package:order_ticket/models/user_model.dart';
import 'package:order_ticket/widgets/rectangular_button.dart';
import 'package:order_ticket/widgets/user_detail.dart';

class ProfileComponent extends StatelessWidget {
  final User? user;
  const ProfileComponent({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2.5),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.defaultSize * 2.5,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.defaultSize * 5.5,
                    width: SizeConfig.defaultSize * 5.5,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(user!.imageLocation.toString()),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: SizeConfig.defaultSize * 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: SizeConfig.defaultSize * 4.5,
                        ),
                        Text(user!.name),
                        IconButton(
                            splashRadius: SizeConfig.defaultSize * 2.5,
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/svg/edit.svg")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.defaultSize,
                    ),
                    UserDetail(
                        itemImage: "assets/images/email.png",
                        itemName: user!.email),
                    UserDetail(
                        itemImage: "assets/images/smart_phone.png",
                        itemName: user!.phoneNumber),
                    UserDetail(
                        itemImage: "assets/images/location.png",
                        itemName: user!.location),
                    UserDetail(
                        itemImage: "assets/images/comment.png",
                        itemName: user!.comment),
                    const Divider(
                      color: Color(0xFFE0E0E0),
                      thickness: 1,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize * 2,
                    ),
                    UserDetail(
                        itemImage: "assets/images/badge.png",
                        itemName: user!.badge.toString()),
                    UserDetail(
                        itemImage: "assets/images/shopping_basket.png",
                        itemName: user!.shoppingBasket.toString()),
                    UserDetail(
                        itemImage: "assets/images/calendar.png",
                        itemName: user!.date),
                    UserDetail(
                        itemImage: "assets/images/credit.png",
                        itemName: user!.paymentMethod),
                    UserDetail(
                        itemImage: "assets/images/bill.png",
                        itemName: ("Due Amt. (${user!.dueAmount})")),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.defaultSize,
                        bottom: SizeConfig.defaultSize * 7,
                      ),
                      child: RectangularButton(
                        onPress: () {},
                        text: 'Redeem Points',
                        textColor: Colors.white,
                        buttonColor: const Color(0xFF30B700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
