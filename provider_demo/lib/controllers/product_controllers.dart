import 'package:flutter/material.dart';
import 'package:provider_demo/models/product_model.dart';
class ProductController with ChangeNotifier {
ProductModel? productModelObj;
/// ADD PRODUCT DATA
void addProductData({required ProductModel pObj}) {
productModelObj = pObj;
}
/// ADD TO FAVORITE
void addToFavorite() {
productModelObj!.isFavorite = !productModelObj!.isFavorite!;
notifyListeners();
}
/// ADD QUANTITY
void addQuantity() {
///
productModelObj!.quantity = productModelObj!.quantity! + 1;
notifyListeners();
}
/// REMOVE QUANTITY
void removeQuantity() {
///
productModelObj!.quantity = productModelObj!.quantity! - 1;
notifyListeners();
}
}