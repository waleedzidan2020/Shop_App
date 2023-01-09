class FavoriteModel {
  bool? status;
  FavoritePage? data;

  FavoriteModel.FromJason(Map<String, dynamic> jason) {
    status = jason['status'];
    data = jason['status'] ? FavoritePage.FromJason(jason['data']) : null;
  }
}

class FavoritePage {
  int? currentpage;
  List<FavoriteData> data = [];

  FavoritePage.FromJason(Map<String, dynamic> jason) {
    currentpage = jason['current_page'];
    jason['data'].forEach((element) {
      data.add(FavoriteData.FromJason(element));
    });
  }
}

class FavoriteData {
  int? id;
  ProductData? product;

  FavoriteData.FromJason(Map<String, dynamic> jason) {
    id = jason['id'];
    product = ProductData.FromJason(jason['product']);
  }
}

class ProductData {
  late int id;
  dynamic? price;
  dynamic? oldprice;
  String? image;
  String? name;

  dynamic? discount;

  ProductData.FromJason(Map<String, dynamic>? Jason) {
    id = Jason!['id'];
    image = Jason['image'];
    price = Jason['price'];
    oldprice = Jason['old_price'];
    name = Jason['name'];
    discount = Jason['discount'];
  }
}
