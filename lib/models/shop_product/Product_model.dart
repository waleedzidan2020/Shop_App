class ProductModel {
  bool? status;
  ProductHomeModel? data;

  ProductModel.FromJason(Map<String, dynamic>? Jason) {
    status = Jason?['status'];
    data = ProductHomeModel.FromJason(Jason!['data']);
  }
}

class ProductHomeModel {
  List<Banners> ListOfBanners = [];
  List<Products>? ListOfProducts = [];

  ProductHomeModel.FromJason(Map<String, dynamic>? Jason) {
    Jason!['banners']!.forEach((elemnt) {
      ListOfBanners.add(Banners.FromJason(elemnt));
    });

    Jason!['products']?.forEach((elemnt) {
      ListOfProducts?.add(Products.FromJason(elemnt));

    });
  }
}

class Banners {
  int? id;
  String? image;


  Banners.FromJason( Map<String, dynamic>? Jason) {
    id = Jason!['id'];
    image = Jason!['image'];
  }
}

class Products {
  late int id;
  dynamic? price;
  dynamic? oldprice;
  String? image;
  String? name;
  late bool Infavorites;
  bool? Incart;
  dynamic? discount;

  Products.FromJason(Map<String, dynamic>? Jason) {
    id = Jason!['id'];
    image = Jason['image'];
    price = Jason['price'];
    oldprice = Jason['old_price'];
    name = Jason['name'];
    Infavorites = Jason['in_favorites'];
    Incart = Jason['in_cart'];
    discount = Jason['discount'];
  }
}
