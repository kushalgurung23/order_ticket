import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_ticket/constants/path_location.dart';
import 'package:order_ticket/controllers/ticket_controller.dart';
import 'package:order_ticket/helpers/size_configuration.dart';
import 'package:order_ticket/models/product_model.dart';
import 'package:order_ticket/widgets/rectangular_button.dart';
import 'package:order_ticket/widgets/top_app_bar.dart';
import 'package:provider/provider.dart';

class OpenTicketDetails extends StatelessWidget {
  static const String id = "/open_ticket_details";
  final int? userId, totalItem;
  final String? userName;
  final List<ProductElement>? productElementList;
  final double? totalAmount;

  const OpenTicketDetails(
      {Key? key,
      this.productElementList,
      this.userId,
      this.userName,
      this.totalAmount,
      this.totalItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TicketController>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: topAppBar(
            context: context,
            useTrailingGesture: false,
            leadingFirstIcon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
            leadingFirstOnPress: () {
              data.navigateBack(context: context);
            },
            titleWidget: Row(
              children: [
                Container(
                  height: SizeConfig.defaultSize * 3.6,
                  width: SizeConfig.defaultSize * 3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          kProductDisplayLocation,
                        ),
                        fit: BoxFit.fill),
                  ),
                  child: Center(
                      child: Text(
                    totalItem.toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
                SizedBox(width: SizeConfig.defaultSize),
                Text(
                  userName!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.defaultSize * 1.6,
                  ),
                ),
              ],
            ),
            trailingWidget: [
              Center(
                child: IconButton(
                  splashRadius: SizeConfig.defaultSize * 2.5,
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/svg/edit.svg"),
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: SizeConfig.defaultSize),
                  child: const Text("Items Ordered"),
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: productElementList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.defaultSize),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(productElementList![index].name +
                                ' x ' +
                                productElementList![index]
                                    .orderedCount
                                    .toString()),
                            Text("Rs. " +
                                (productElementList![index].price *
                                        productElementList![index].orderedCount)
                                    .toString()),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  color: const Color(0xFF707070).withOpacity(0.1),
                  thickness: 1,
                  //height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.defaultSize * 1.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text('Total'), Text('Rs. $totalAmount')],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.defaultSize * 2),
                  child: Row(
                    children: [
                      Expanded(
                          child: RectangularButton(
                              onPress: () {
                                data.saveOrder(
                                    context: context,
                                    userId: userId!.toString(),
                                    userName: userName!.toString(),
                                    totalAmount: totalAmount!,
                                    itemOrderedList: productElementList!,
                                    totalItem: totalItem!);
                              },
                              text: 'Save Order',
                              textColor: Colors.white,
                              buttonColor: const Color(0xFF30B700),
                              height: SizeConfig.defaultSize * 6.3)),
                      Expanded(
                          child: RectangularButton(
                              onPress: () {},
                              text: 'Proceed to Pay',
                              textColor: Colors.white,
                              buttonColor: const Color(0xFF30B700),
                              height: SizeConfig.defaultSize * 6.3)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
