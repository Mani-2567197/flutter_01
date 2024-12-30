import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:products/model/product_model.dart';
import 'package:products/utils/server_constraints.dart';

class GetProducts extends StatefulWidget {
  const GetProducts({Key? key}) : super(key: key);

  @override
  _GetProductsState createState() => _GetProductsState();
}

class _GetProductsState extends State<GetProducts> {
  List<Products> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Products List")
        ),
        body: Container(
            child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final productinfo = products[index];
            return Card(
                child: Column(
              children: [
                Text(productinfo.name?? ""),
                Text(productinfo.description ?? ""),
                Text("${productinfo.price ?? 0}"),
                Text(productinfo.category ?? ""),
                Text("${productinfo.stock ?? 0}")
              ],
            ));
          },
        )));
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  Future<void> fetchProducts() async {
    final url = ServerConstraints.baseurl + ServerConstraints.getprodut;
    final dio = Dio();
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        ProductModel productData = ProductModel.fromJson(data);
        setState(() {
          products = productData.products ?? [];
        });
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}
