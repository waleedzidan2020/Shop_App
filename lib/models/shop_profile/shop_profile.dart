class profileModel {
  bool? status;

  Profileinfo? data;

  profileModel.FormJason(Map<String, dynamic> jason) {
    status = jason['status'];

    data = jason['data']!=null ? Profileinfo.FormJason(jason['data']) : null;
  }
}

class Profileinfo {
  String? UserName;
  String? Phone;
  String? email;
  String? token;

  Profileinfo.FormJason(Map<String, dynamic> jason) {
    UserName = jason['name'];
    Phone = jason['phone'];
    email = jason['email'];
    token = jason['token'];
  }
}
