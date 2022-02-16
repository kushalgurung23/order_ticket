class OpenTicket {
  final String openTicketId, userId, userName;
  final List<Map> itemOrderedList;
  final int totalAmount;

  OpenTicket(
      {required this.openTicketId,
      required this.userId,
      required this.userName,
      required this.itemOrderedList,
      required this.totalAmount});
}
