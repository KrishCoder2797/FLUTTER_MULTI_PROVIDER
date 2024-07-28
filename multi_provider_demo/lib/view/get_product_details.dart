import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_provider_demo/models/product_model.dart';
import 'package:multi_provider_demo/view/products_list_screen.dart';
import '../controllers/product_controller.dart';


class GetProductDetails extends StatelessWidget {
GetProductDetails({super.key});
final TextEditingController _productNameTextEditingController =
TextEditingController();
final TextEditingController _productImageTextEditingController =
TextEditingController();
final TextEditingController _productPriceTextEditingController =
TextEditingController();
@override
Widget build(BuildContext context) {
log("IN PRODUCT DETAILS BUILD");
return Scaffold(
appBar: AppBar(
title: const Text("GET PRODUCT DETAILS"),
centerTitle: true,
),
body: Padding(
padding: const EdgeInsets.all(15.0),
child: Column(
children: [
const SizedBox(height: 20),
/// PRODUCT IMAGE
TextFormField(
controller: _productImageTextEditingController,
decoration: InputDecoration(
hintText: "Add Image",
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
),
),
),



const SizedBox(height: 20),
/// PRODUCT NAME
TextFormField(
controller: _productNameTextEditingController,
decoration: InputDecoration(
hintText: "Enter Name",
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
),
),
),
const SizedBox(height: 20),
/// PRODUCT PRICE
TextFormField(
controller: _productPriceTextEditingController,
decoration: InputDecoration(
hintText: "Enter Price",
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(20),
),
),
keyboardType: TextInputType.phone,
),
const SizedBox(height: 20),



ElevatedButton(
onPressed: () {
var obj = ProductModel(
isFavorite: false,
price: _productPriceTextEditingController.text.trim(),
productImage:

_productImageTextEditingController.text.trim(),

productName:

_productNameTextEditingController.text.trim(),

quantity: 0,
);
Provider.of<ProductController>(context, listen: false)
.addProductData(pObj: obj);
_productImageTextEditingController.clear();
_productNameTextEditingController.clear();
_productPriceTextEditingController.clear();
},
child: const Text("Add"),
),
const SizedBox(height: 20),
ElevatedButton(
onPressed: () {
Navigator.push(context, MaterialPageRoute(builder:

(context) {

return const ProductsListScreen();
}));
},
child: const Text("Submit"),
),
],
),
),
);
}
}