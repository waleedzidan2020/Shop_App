

class CategoriseModel {
  bool? status;
  DataCategory? data;

  CategoriseModel.FromJason(Map<String, dynamic>? jason) {
    status = jason!['status'];
    data = DataCategory.FromJason(jason!['data']);
  }
}

class DataCategory {
  int? CurrentPage;
  List<OneCategory>? Data=[];

  DataCategory.FromJason(Map<String, dynamic>? jason) {
    CurrentPage = jason!['current_page'];

    jason['data'].forEach((element) {
      Data?.add(OneCategory.FromJason(element));
    });
  }
}

class OneCategory {
  int? id;
  String? name;
  String? image;

  OneCategory.FromJason(Map<String, dynamic>? jason) {
    id = jason!['id'];
    name = jason['name'];
    image = jason['image'];
  }
}
