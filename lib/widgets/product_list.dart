import 'package:flutter/material.dart';
import 'package:order_ticket/constants/path_location.dart';
import 'package:order_ticket/controllers/product_controller.dart';
import 'package:order_ticket/helpers/size_configuration.dart';
import 'package:order_ticket/models/product_model.dart';

class ProductList extends StatelessWidget {
  final ProductController data;
  const ProductList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.product!.data.products.length,
        itemBuilder: (context, index) {
          List<ProductElement> productList = data.product!.data.products;
          return InkWell(
            onTap: () {
              data.addItem(productElement: productList[index]);
            },
            child: ListTile(
              leading: productList[index].image != null
                  ? Container(
                      height: SizeConfig.defaultSize * 4.5,
                      width: SizeConfig.defaultSize * 4.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                productList[index].image.toString())),
                      ),
                    )
                  : Container(
                      height: SizeConfig.defaultSize * 4.5,
                      width: SizeConfig.defaultSize * 4.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(kNoImageLocation)),
                      ),
                    ),
              title: Text(productList[index].name.toString()),
              subtitle: Text("Price: Rs.${productList[index].price}"),
            ),
          );
        });
  }
}
