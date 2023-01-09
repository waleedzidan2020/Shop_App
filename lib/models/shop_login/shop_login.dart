class ShopLoginModel {
  bool? status;
  String? message;
  UserLogin?  data;
  ShopLoginModel.FromJason(Map<String, dynamic>? jason) {
    status=jason!['status'];
    message=jason!['message'];
    data=UserLogin.FromJason(jason['data']);


  }
}

class UserLogin {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
 int ? points;
 int ? credit;
  String? token;

  UserLogin.FromJason(Map<String, dynamic>? jason) {
    id=jason!['id'];
    name=jason!['name'];
    email=jason!['email'];
    phone=jason!['phone'];
    image=jason!['image'];
    points=jason!['points'];
    credit=jason!['credit'];

    token=jason['token'];
  }
}
