class BurgerProduct {
  //String? image;
  String? name;
  String? price;
  String? description;
  String? size;

  BurgerProduct(
      {
      // required this.image,
      required this.name,
      required this.price,
      required this.description,
      required this.size});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    // data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['size'] = size;
    return data;
  }

  BurgerProduct.fromJson(Map<String, dynamic> json) {
    //image = json['image'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    size = json['size'];
  }
}
