import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_ticket/controllers/product_controller.dart';
import 'package:order_ticket/controllers/user_controller.dart';
import 'package:order_ticket/helpers/size_configuration.dart';
import 'package:order_ticket/models/user_model.dart';
import 'package:order_ticket/views/open_ticket_details.dart';
import 'package:order_ticket/widgets/profile_component.dart';
import 'package:order_ticket/widgets/top_app_bar.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  static const String id = "/user_profile";
  final User? user;
  const UserProfile({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Consumer<UserController>(
      builder: (context, data, child) {
        return Consumer<ProductController>(
          builder: (context, productControllerData, child) {
            return Scaffold(
              appBar: topAppBar(
                  context: context,
                  useTrailingGesture: true,
                  leadingFirstIcon: const Icon(CupertinoIcons.back),
                  leadingFirstOnPress: () {
                    data.navigateBack(context: context);
                  },
                  titleWidget: const Text('Profile'),
                  secondGestureWidget: Text(
                    'Add To Ticket',
                    style: TextStyle(
                        color: const Color(0xFF30B700),
                        fontSize: SizeConfig.defaultSize * 1.5,
                        fontWeight: FontWeight.w600),
                  ),
                  secondGestureOnPress: () {
                    if(productControllerData.totalItemCount > 0) {
                      data.navigateScreen(
                          context: context,
                          screen: OpenTicketDetails(
                            userId: user!.id,
                            userName: user!.name,
                            productElementList:
                            productControllerData.productElementList,
                            totalItem: productControllerData.totalItemCount,
                            totalAmount: productControllerData.getTotalAmount(
                                productElementList:
                                productControllerData.productElementList),
                          ));
                    }
                    else {
                      productControllerData.showSnackBar(context: context, text: "No products to add to ticket");
                    }
                  }),
              body: user == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ProfileComponent(user: user),
            );
          },
        );
      },
    );
  }
}
