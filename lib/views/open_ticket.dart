import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_ticket/controllers/user_controller.dart';
import 'package:order_ticket/helpers/size_configuration.dart';
import 'package:order_ticket/widgets/open_ticket_list.dart';
import 'package:order_ticket/widgets/top_app_bar.dart';
import 'package:provider/provider.dart';

class OpenTicket extends StatelessWidget {
  static const String id = "/open_ticket";
  const OpenTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Consumer<UserController>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: topAppBar(
              context: context,
              useTrailingGesture: false,
              firstIcon: const Icon(
                CupertinoIcons.back,
                color: Colors.black,
              ),
              firstOnPress: () {
                data.navigateBack(context: context);
              },
              secondIcon: SvgPicture.asset("assets/svg/edit.svg"),
              secondOnPress: () {}),
          body: OpenTicketList(data: data),
        );
      },
    );
  }
}
