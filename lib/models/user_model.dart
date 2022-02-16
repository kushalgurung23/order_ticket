class User {
  final String name,
      imageLocation,
      email,
      phoneNumber,
      location,
      comment,
      time,
      paymentMethod,
      date;
  final int id, totalAmount, shoppingBasket, dueAmount;
  final double badge;

  User(
      {required this.email,
      required this.phoneNumber,
      required this.location,
      required this.comment,
      required this.paymentMethod,
      required this.date,
      required this.id,
      required this.shoppingBasket,
      required this.dueAmount,
      required this.badge,
      required this.name,
      required this.imageLocation,
      required this.totalAmount,
      required this.time});
}
