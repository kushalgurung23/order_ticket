import 'package:order_ticket/models/product_model.dart';

class OpenTicket {
  final String openTicketId, userId, userName;
  final List<ProductElement> itemOrderedList;
  final double totalAmount;
  final int totalItem;

  OpenTicket(
      {required this.openTicketId,
      required this.userId,
      required this.userName,
      required this.itemOrderedList,
      required this.totalAmount,
      required this.totalItem,
      });
}
