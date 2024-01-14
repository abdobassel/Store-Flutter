class ProductModel {
  int? id;
  String? title;
  String? price;
  String? dec;
  String? img;
  String? category;
  RatingModel? rating;

  ProductModel(
      {this.category,
      this.id,
      this.dec,
      this.img,
      this.price,
      this.rating,
      this.title});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toString();
    category = json['category'];
    img = json['image'];
    dec = json['description'];
    rating =
        json['rating'] != null ? RatingModel.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': dec,
      'image': img,
      'price': price,
      'title': title,
      'category': category,
      'rating': rating,
    };
  }
}

class RatingModel {
  dynamic rate;
  dynamic count;

  RatingModel.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }
}
