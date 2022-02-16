import 'dart:convert';

import 'package:order_ticket/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static String urlAddress = "https://api.khajaghar.ml/api/dalle/products";

  static Future<Product> getProductData() async {
    final url = Uri.parse(urlAddress);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      Product result = Product.fromJson(decodedData);
      return result;
    } else {
      throw Exception("Unable to fetch product data from API.");
    }
  }
}
