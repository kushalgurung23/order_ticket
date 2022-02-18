import 'package:flutter/material.dart';
import 'package:order_ticket/models/user_model.dart';
import 'package:order_ticket/repositories/user_repository.dart';

class UserController extends ChangeNotifier {
  List<User> _user = [];
  List<User> get user => List.from(_user);

  void fetchUserData() {
    List<User> userList = UserRepository.getUserData();
    _user = userList;
  }

  void navigateScreen({required BuildContext context, required Widget screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void navigateBack({required BuildContext context}) {
    Navigator.pop(context);
  }

  void navigatedNamed({required BuildContext context, required String name}) {
    Navigator.pushNamed(context, name);
  }

}
