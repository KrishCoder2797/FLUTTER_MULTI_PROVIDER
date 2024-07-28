import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/product_controllers.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({super.key});
  @override
  Widget build(BuildContext context) {
    log("IN PRODUCT DISPLAY BUILD");
    var providerObj = Provider.of<ProductController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Display"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.network("${providerObj.productModelObj?.productImage}"),
              const SizedBox(height: 10),
              Text("${providerObj.productModelObj?.productName}"),
              const SizedBox(height: 10),
              Text("${providerObj.productModelObj?.price}"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// IS FAVORITE
                  Consumer<ProductController>(
                    builder: (context, provider, child) {
                      log("IN FAV CONSUMER");
                      return GestureDetector(
                        onTap: () {
                          providerObj.addToFavorite();
                        },
                        child: Icon(
                          (providerObj.productModelObj!.isFavorite!)
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          providerObj.addQuantity();
                        },
                        child: const Icon(
                          Icons.add,
                        ),
                      ),
                      const SizedBox(width: 5),

                      ///QUANTITY
                      Consumer<ProductController>(
                        builder: (context, value, child) {
                          log("IN QUANTITY");
                          return Text(
                              "${providerObj.productModelObj?.quantity}");
                        },
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          providerObj.removeQuantity();
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
