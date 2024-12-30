import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:products/utils/server_constraints.dart';
import 'package:products/widgets/input_text_field_widget.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Products"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputTextFieldWidget(
                  controller: nameController,
                  hintText: " Enter Name of the product"),
              InputTextFieldWidget(
                  controller: priceController,
                  hintText: "Enter price of the product"),
              InputTextFieldWidget(
                  controller: categoryController,
                  hintText: "Enter Category of the product"),
              InputTextFieldWidget(
                  controller: descriptionController,
                  hintText: "Enter description of the product"),
              InputTextFieldWidget(
                  controller: stockController, hintText: "Stock"),
              ElevatedButton(
                  onPressed: () {
                    addProductsintoapi();
                  },
                  child: Text("Add Product"))
            ],
          ),
        ));
  }

  Future<void> addProductsintoapi() async {
    final name = nameController.text;
    final category = categoryController.text;
    final price = priceController.text;
    final descrip = descriptionController.text;
    final stock = stockController.text;

    final url = ServerConstraints.baseurl + ServerConstraints.addproduct;
    final dio = Dio();
    final payload = {
      "name": name,
      "price": price,
      "description": descrip,
      "stock": stock,
      "category": category
    };
    try {
      final response = await dio.post(url, data: payload);
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final error = response.data["error"] ?? false;
        final message = response.data["message"] ?? false;
        if (error) {
          showAlertDialog(message);
        } else {
          print("Product Added Successfully");
        }
        Navigator.pushNamed(context, "/getproducts");
      }
    } catch (e) {
      print(e);
    } finally {
      dio.close();
    }
  }

  void showAlertDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Already Exists"),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }
}
