import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/controllers/product_controllers.dart';
import 'package:provider_demo/view/get_product_details.dart';
void main() {
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return ChangeNotifierProvider(
create: (BuildContext context) {
return ProductController();
},
child: MaterialApp(
title: 'Provider Demo',
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
useMaterial3: true,
),
home: GetProductDetails(),
),
);
}
}