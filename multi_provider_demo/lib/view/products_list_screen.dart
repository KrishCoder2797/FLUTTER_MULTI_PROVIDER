import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_provider_demo/controllers/product_controller.dart';
import 'package:multi_provider_demo/controllers/wishlist_controller.dart';
import 'package:multi_provider_demo/view/wishlist_screen.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var providerObj = Provider.of<ProductController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return WishListScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: Colors.red,
            ),
          ),
        ],
        title: const Text("Products List Screen"),
      ),
      body: ListView.builder(
        itemCount: providerObj.listOfProducts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                Image.network(
                    "${providerObj.listOfProducts[index].productImage}"),
                const SizedBox(height: 10),
                Text("${providerObj.listOfProducts[index].productName}"),
                const SizedBox(height: 10),
                Text("${providerObj.listOfProducts[index].price}"),
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
                            /// ADD PRODUCT TO WISHLIST
                            providerObj.addToFavorite(index: index);
                            if (providerObj.listOfProducts[index].isFavorite) {
                              Provider.of<WishListController>(context,
                                      listen: false)
                                  .addDataToWishlist(
                                      obj: providerObj.listOfProducts[index]);
                            }
                          },
                          child: Icon(
                            (providerObj.listOfProducts[index].isFavorite)
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
                            providerObj.addQuantity(index);
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
                                "${providerObj.listOfProducts[index].quantity}");
                          },
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            providerObj.removeQuantity(index);
                          },
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
