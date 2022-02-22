import 'package:flutter/cupertino.dart';
import 'package:order_ticket/controllers/product_controller.dart';
import 'package:order_ticket/models/open_ticket_model.dart';
import 'package:order_ticket/models/product_model.dart';
import 'package:order_ticket/views/product_screen.dart';
import 'package:provider/provider.dart';

class TicketController extends ChangeNotifier {
  void navigateBack({required BuildContext context}) {
    Navigator.pop(context);
  }

  List<OpenTicket> openTicketList = [];

  void saveOrder(
      {required BuildContext context,
      required String userId,
      required String userName,
      required List<ProductElement> itemOrderedList,
      required double totalAmount,
      required int totalItem}) {
    try {
      int newTicket;
      if (openTicketList.isEmpty) {
        newTicket = 1;
      } else {
        newTicket = openTicketList.length + 1;
      }

      OpenTicket openTicket = OpenTicket(
        openTicketId: newTicket.toString(),
        userId: userId,
        userName: userName,
        itemOrderedList: itemOrderedList,
        totalAmount: totalAmount,
        totalItem: totalItem,
      );
      openTicketList.add(openTicket);
      ProductController productController =
          Provider.of<ProductController>(context, listen: false);
      productController.productElementList = [];
      productController.totalItemCount = 0;
      productController.showSnackBar(
          context: context, text: "Order saved successfully");
      Navigator.pushNamedAndRemoveUntil(
          context, ProductScreen.id, (route) => false);
    } on Exception {
      throw Exception("Error while saving order.");
    } finally {
      notifyListeners();
    }
  }
}
