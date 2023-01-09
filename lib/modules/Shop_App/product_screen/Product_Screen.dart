import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/shop_app/cubit/cubit.dart';
import 'package:my_app/layout/shop_app/cubit/state.dart';

import '../../../models/shop_categories/Categorise_model.dart';
import '../../../models/shop_product/Product_model.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopStates>(
      builder: (context, state) {
        var cubit = ShopLayoutCubit.get(context);

        return ConditionalBuilder(
          condition: state is DataSuccessState ,
          builder: (context) =>
              BuilderWidget(cubit.Productmodel, cubit.CategoryModel, context),
          fallback: (context) => Center(
              child: CircularProgressIndicator(
            color: Colors.blueAccent,
          )),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget BuilderWidget(
      ProductModel? Model, CategoriseModel? ModelCategory, context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CarouselSlider(
              items: Model?.data?.ListOfBanners.map((e) {
                return Image(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${e.image}",
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                  height: 190.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  reverse: false,
                  initialPage: 0,
                  autoPlayCurve: Curves.easeInBack,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                  enlargeCenterPage: false),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    BuildCategory(ModelCategory!.data!.Data![index]),
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemCount: ModelCategory!.data!.Data!.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(
                  Model!.data!.ListOfProducts.length,
                  (index) =>
                      BuildProduct(Model.data!.ListOfProducts[index], context)),
              shrinkWrap: true,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildProduct(Products model, context) => Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.cyan, width: 4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image(
                  height: 210.0,
                  width: double.infinity,
                  image: NetworkImage(
                    "${model.image}",
                  ),
                ),
                if (model.discount != 0)
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text(
                      "Discount",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
            Text(
              textAlign: TextAlign.start,
              "${model.name}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Expanded(

              child: Row(
                children: [
                  Text(
                    "${model.price.round()} \$",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  if (model.discount != 0)
                    Text(
                      "${model.discount} %",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundColor:ShopLayoutCubit.get(context).Favorite[model.id]!? Colors.blue:Colors.grey,
                    child: IconButton(
                      onPressed: () {
                        ShopLayoutCubit.get(context).AddFavorite(model.id);
                      },
                      icon: Icon(Icons.favorite_border,color: Colors.white),
                      iconSize: 20,
                      splashRadius: 25,
                    ),
                  ),
                  // FavoriteButton(
                  //   valueChanged: (Change) {
                  //     ShopLayoutCubit.get(context).AddFavorite(model.id);
                  //   },
                  //   iconSize: 40,
                  //   iconColor: Colors.blue,
                  //   isFavorite:ShopLayoutCubit.get(context).Favorite[model.id] ,
                  //
                  // ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget BuildCategory(OneCategory? Model) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        width: 120,
        height: 120,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image(
              width: 120,
              height: 120,
              image: NetworkImage(
                "${Model!.image}",
              ),
            ),
            Container(
              width: 119,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(9),
                    bottomRight: Radius.circular(9),
                  )),
              child: Text(
                "${Model.name}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}
