

import 'package:flutter/material.dart';
import 'package:multi_provider_demo/models/product_model.dart';
class ProductController with ChangeNotifier {
List<ProductModel> listOfProducts = [];
/// ADD PRODUCT DATA
 void addProductData({required ProductModel pObj}) {
listOfProducts.add(pObj);
}
/// ADD TO FAVORITE
void addToFavorite({required int index}) {
// int index = listOfProducts.indexWhere((element) {
// return element == productModelObj;
// });
listOfProducts[index].isFavorite = !listOfProducts[index].isFavorite;
notifyListeners();
}
/// ADD QUANTITY
void addQuantity(int index) {
///
listOfProducts[index].quantity = listOfProducts[index].quantity + 1;
notifyListeners();
}
/// REMOVE QUANTITY
void removeQuantity(int index) {
///
listOfProducts[index].quantity = listOfProducts[index].quantity - 1;
notifyListeners();
}
}

