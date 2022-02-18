import 'package:flutter/material.dart';
import 'package:order_ticket/models/product_model.dart';
import 'package:order_ticket/repositories/product_repository.dart';

class ProductController extends ChangeNotifier {
  Product? product;

  Future<void> setProduct() async {
    try {
      Product product = await ProductRepository.getProductData();
      this.product = product;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }

  int totalItemCount = 0;

  List<ProductElement> productElementList = [];
  List<int> sameItemCount = [];

  void addItem({required ProductElement productElement}) {
    try {
      if (productElementList.isNotEmpty) {
        if (productElementList.contains(productElement)) {
          productElement.orderedCount++;
        } else {
          totalItemCount++;
          productElement.orderedCount = 1;
          productElementList.add(productElement);
        }
      }
      // At first, else statement will be run, because productElementList will be empty
      else {
        totalItemCount++;
        productElement.orderedCount = 1;
        productElementList.add(productElement);
      }
    } finally {
      notifyListeners();
    }
  }

  double getTotalAmount({required List<ProductElement> productElementList}) {
    try {
      double totalAmount = 0;
      for (int i = 0; i < productElementList.length; i++) {
        double lineTotal =
            productElementList[i].price * productElementList[i].orderedCount;
        totalAmount = totalAmount + lineTotal;
      }
      return totalAmount;
    } finally {
      notifyListeners();
    }
  }

  void navigatedNamed({required BuildContext context, required String name}) {
    Navigator.pushNamed(context, name);
  }

  void showSnackBar({required BuildContext context, required String text}) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
