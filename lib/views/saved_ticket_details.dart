import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_ticket/constants/path_location.dart';
import 'package:order_ticket/controllers/ticket_controller.dart';
import 'package:order_ticket/helpers/size_configuration.dart';
import 'package:order_ticket/models/open_ticket_model.dart';
import 'package:order_ticket/widgets/top_app_bar.dart';
import 'package:provider/provider.dart';

class SavedTicketDetails extends StatelessWidget {
  static const String id = '/saved_ticket_details';
  final OpenTicket? openTicket;
  const SavedTicketDetails({Key? key, this.openTicket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TicketController>(
      builder: (context, data, child) {
        return Scaffold(
            appBar: topAppBar(
                context: context,
                useTrailingGesture: false,
                leadingFirstIcon: const Icon(CupertinoIcons.back),
                leadingFirstOnPress: () {
                  Navigator.of(context).pop();
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
                        openTicket!.totalItem.toString(),
                        style: const TextStyle(color: Colors.white),
                      )),
                    ),
                    SizedBox(width: SizeConfig.defaultSize),
                    Text(
                      openTicket!.userName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.defaultSize * 1.6,
                      ),
                    ),
                  ],
                ),
                trailingWidget: []),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize * 2.5),
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: openTicket!.itemOrderedList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.defaultSize),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(openTicket!.itemOrderedList[index].name +
                                  ' x ' +
                                  openTicket!
                                      .itemOrderedList[index].orderedCount
                                      .toString()),
                              Text("Rs. " +
                                  (openTicket!.itemOrderedList[index].price *
                                          openTicket!.itemOrderedList[index]
                                              .orderedCount)
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
                    padding: EdgeInsets.only(
                        top: SizeConfig.defaultSize * 1.5,
                        bottom: SizeConfig.defaultSize * 3.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total'),
                        Text(
                          'Rs. ${openTicket!.totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
