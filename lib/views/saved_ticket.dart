import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_ticket/controllers/ticket_controller.dart';
import 'package:order_ticket/helpers/size_configuration.dart';
import 'package:order_ticket/views/saved_ticket_details.dart';
import 'package:order_ticket/widgets/top_app_bar.dart';
import 'package:provider/provider.dart';

class SavedTicket extends StatelessWidget {
  static const String id = "/saved_ticket";
  const SavedTicket({Key? key}) : super(key: key);

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
                data.navigateBack(context: context);
              },
              trailingWidget: []),
          body: data.openTicketList.isEmpty
              ? const Center(
                  child: Text("No saved order"),
                )
              : Padding(
                  padding: EdgeInsets.only(top: SizeConfig.defaultSize),
                  child: ListView.builder(
                      itemCount: data.openTicketList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: SizeConfig.defaultSize,
                              left: SizeConfig.defaultSize,
                              right: SizeConfig.defaultSize),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [Colors.green, Colors.greenAccent]),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              onTap: () {
                                print(data.openTicketList[index].itemOrderedList
                                    .length);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SavedTicketDetails(
                                                openTicket: data
                                                    .openTicketList[index])));
                              },
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.defaultSize,
                                  horizontal: SizeConfig.defaultSize),
                              leading: const Icon(CupertinoIcons.ticket_fill),
                              title: Text(data.openTicketList[index].userName),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("User ID: " +
                                      data.openTicketList[index].userId),
                                  Text("Order ID: " +
                                      data.openTicketList[index].openTicketId),
                                  Text("Total item: " +
                                      data.openTicketList[index].totalItem
                                          .toString()),
                                ],
                              ),
                              trailing: Text(
                                  "Rs. " +
                                      data.openTicketList[index].totalAmount
                                          .toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        );
                      }),
                ),
        );
      },
    );
  }
}
