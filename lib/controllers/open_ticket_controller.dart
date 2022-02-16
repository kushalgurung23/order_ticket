import 'package:flutter/cupertino.dart';

class OpenTicketController extends ChangeNotifier {

  void navigateBack({required BuildContext context}) {
    Navigator.pop(context);
  }

}
