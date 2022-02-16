import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_ticket/constants/path_location.dart';
import 'package:order_ticket/controllers/open_ticket_controller.dart';
import 'package:order_ticket/helpers/size_configuration.dart';
import 'package:order_ticket/widgets/top_app_bar.dart';
import 'package:provider/provider.dart';

class OpenTicketDetails extends StatelessWidget {
  static const String id = "/open_ticket_details";
  const OpenTicketDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OpenTicketController>(
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
                  child: const Center(child: Text('11', style: TextStyle(color: Colors.white),)),
                ),
                SizedBox(width: SizeConfig.defaultSize),
                Text(
                  'Amit Shrestha',
                  style: TextStyle(color: Colors.black,
                  fontSize: SizeConfig.defaultSize * 1.6,
                  ),
                ),
              ],
            ),
            secondIcon: SvgPicture.asset("assets/svg/edit.svg"),
            secondOnPress: () {},
          ),
          body: Container(
            height: 200,
            color: Colors.purple,
          ),
        );
      },
    );
  }
}
