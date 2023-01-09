import '../../../models/shop_profile/shop_profile.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ChangeBottomNavigateState extends ShopStates {}

class DataLoadingState extends ShopStates {}

class DataSuccessState extends ShopStates {}

class DataErorrState extends ShopStates {}

class DataCategorySuccessState extends ShopStates {}

class DataCategoryErrorState extends ShopStates {}

class DataCategoryLoadingState extends ShopStates {}

class PostFavoriteSuccessState extends ShopStates {}

class PostFavoriteErorrState extends ShopStates {}

class ChangeFavoriteState extends ShopStates {}

class GetFavoriteErorrState extends ShopStates {}

class GetFavoriteSuccessState extends ShopStates {}

class LoadingFavoritePageState extends ShopStates {}
class ProfileLoadingState extends ShopStates {
  profileModel? profile;
  ProfileLoadingState(this.profile);

}

class ProfileDataSuccessState extends ShopStates {
  profileModel? profile;
  ProfileDataSuccessState(this.profile);
}

class ProfileDataErorrState extends ShopStates {}
class LoadingBottomState extends ShopStates {}

class removetoken extends ShopStates {}

class updateSuccessState extends ShopStates {}

class updateErorrState extends ShopStates {}

class LoadingUpdateState extends ShopStates {}
