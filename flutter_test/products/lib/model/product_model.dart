class ProductModel {
  List<Products>? products;

  ProductModel({this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  String? name;
  int? price;
  String? description;
  String? category;
  int? stock;
  String? createdAt;
  int? iV;

  Products(
      {this.sId,
      this.name,
      this.price,
      this.description,
      this.category,
      this.stock,
      this.createdAt,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    stock = json['stock'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['stock'] = this.stock;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
