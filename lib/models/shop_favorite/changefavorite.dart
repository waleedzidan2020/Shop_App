class ChangeFavoriteModel{

   bool? status;
   String? message;

   ChangeFavoriteModel.FromJason(Map<String,dynamic> jason){

     status=jason['status'];
     message=jason['message'];
   }
}
