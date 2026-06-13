import 'dart:convert';

import 'package:api_call_bloc/home/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<List<ProductModel>> getProducts() async {
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http
        .get(url)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final decodedBody =
          jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> data = decodedBody['products'] as List<dynamic>;
      return data
          .map(
            (item) => ProductModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    }

    throw Exception('Status Code: ${response.statusCode}');
  }
}
