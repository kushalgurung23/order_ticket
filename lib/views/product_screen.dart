import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_ticket/constants/path_location.dart';
import 'package:order_ticket/controllers/product_controller.dart';
import 'package:order_ticket/controllers/user_controller.dart';
import 'package:order_ticket/helpers/size_configuration.dart';
import 'package:order_ticket/helpers/stateful_wrapper.dart';
import 'package:order_ticket/views/open_ticket.dart';
import 'package:order_ticket/views/saved_ticket.dart';
import 'package:order_ticket/widgets/product_list.dart';
import 'package:order_ticket/widgets/top_app_bar.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  static const String id = '/';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () async {
        await Provider.of<ProductController>(context, listen: false)
            .setProduct();
        Provider.of<UserController>(context, listen: false).fetchUserData();
      },
      child: Consumer<ProductController>(
        builder: (context, data, child) {
          SizeConfig.init(context);
          return Scaffold(
            appBar: topAppBar(
              context: context,
              useTrailingGesture: false,
              leadingFirstIcon: const Icon(
                Icons.menu,
                color: CupertinoColors.black,
              ),
              leadingFirstOnPress: () {},
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
                    child: Center(
                        child: Text(
                      data.totalItemCount.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.defaultSize * 1.9),
                    )),
                  ),
                  SizedBox(width: SizeConfig.defaultSize),
                  Text(
                    data.totalItemCount == 0 || data.totalItemCount == 1
                        ? 'product'
                        : 'products',
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              trailingWidget: [
                Center(
                  child: IconButton(
                    splashRadius: SizeConfig.defaultSize * 2.5,
                    onPressed: () {
                      data.navigatedNamed(context: context, name: SavedTicket.id);
                    },
                    icon: const Icon(CupertinoIcons.tickets_fill),
                    color: Colors.black,
                  ),
                ),
                Center(
                  child: IconButton(
                    splashRadius: SizeConfig.defaultSize * 2.5,
                    onPressed: () {
                      data.navigatedNamed(
                          context: context, name: OpenTicket.id);
                    },
                    icon: const Icon(Icons.add_circle),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            body: data.product == null
                ? const Center(child: CircularProgressIndicator())
                : ProductList(data: data),
          );
        },
      ),
    );
  }
}
