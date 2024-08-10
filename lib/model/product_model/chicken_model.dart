class ChickenProduct {
  //String? image;
  String? name;
  String? price;
  String? description;
  String? pieces;

  ChickenProduct({
    // required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.pieces,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    // data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['pieces'] = pieces;
    return data;
  }

  ChickenProduct.fromJson(Map<String, dynamic> json) {
    //image = json['image'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    pieces = json['pieces'];
  }
}
