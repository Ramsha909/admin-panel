class Product {
  String name;
  int price;
  String description;
  String category;
  String imgUrl;
  String id;

  Product(
      {this.name,
      this.price,
      this.description,
      this.category,
      this.imgUrl,
      this.id});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    imgUrl = json['imgUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['imgUrl'] = this.imgUrl;
    data['id'] = this.id;
    return data;
  }
}
