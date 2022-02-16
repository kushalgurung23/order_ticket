import 'package:flutter/material.dart';
import 'package:order_ticket/controllers/user_controller.dart';
import 'package:order_ticket/helpers/size_configuration.dart';
import 'package:order_ticket/views/user_profile.dart';

class OpenTicketList extends StatelessWidget {
  final UserController data;
  const OpenTicketList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.user.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              data.navigateScreen(
                  context: context,
                  screen: UserProfile(
                    user: data.user[index],
                  ));
            },
            leading: Container(
              height: SizeConfig.defaultSize * 2.7,
              width: SizeConfig.defaultSize * 2.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(data.user[index].imageLocation),
                  )),
            ),
            title: Text(data.user[index].name),
            subtitle: Text(data.user[index].time),
            trailing: Text("Rs. " + data.user[index].totalAmount.toString()),
          );
        });
  }
}
