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
    price = json['price'];
    category = json['category'];
    img = json['image'];
    dec = json['description'];
    rating = RatingModel.fromJson(json['rating']);
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
  double? rate;
  int? count;

  RatingModel({this.count, this.rate});
  RatingModel.fromJson(Map<String, dynamic> json) {
    rate = json['id'];
    count = json['count'];
  }
}
