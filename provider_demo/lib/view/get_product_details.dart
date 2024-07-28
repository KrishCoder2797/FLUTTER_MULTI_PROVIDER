import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models/product_model.dart';
import 'package:provider_demo/view/product_display.dart';
import '../controllers/product_controllers.dart';

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
      body: Column(
        children: [
          const SizedBox(height: 20),

          /// PRODUCT IMAGE
          TextFormField(
            controller: _productImageTextEditingController,
            decoration: InputDecoration(
              hintText: "Add Product Image",
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),

          /// PRODUCT NAME
          TextFormField(
            controller: _productNameTextEditingController,
            decoration: InputDecoration(
              hintText: "Enter Product Name",
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),

          /// PRODUCT PRICE
          TextFormField(
            controller: _productPriceTextEditingController,
            decoration: InputDecoration(
              hintText: "Enter Product Price",
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              var tempObj = ProductModel(
                isFavorite: false,
                price: _productPriceTextEditingController.text.trim(),
                productImage: _productImageTextEditingController.text.trim(),
                productName: _productNameTextEditingController.text.trim(),
                quantity: 0,
              );
              Provider.of<ProductController>(context, listen: false)
                  .addProductData(pObj: tempObj);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProductDisplay();
              }));
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
