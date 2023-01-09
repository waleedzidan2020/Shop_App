import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/shop_app/cubit/cubit.dart';
import 'package:my_app/layout/shop_app/cubit/state.dart';

import '../../../models/shop_favorite/GetFavorite.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopStates>(
      builder: (context, state) {
        var cubit = ShopLayoutCubit.get(context);
        return ConditionalBuilder(
          condition:cubit.favoritedata!.data!=null,
          builder: (context)=> Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  BuildFavorite(cubit.favoritedata!.data!.data[index],context),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: cubit.favoritedata!.data!.data.length,
            ),
          ),
          fallback:(context) => Center(child: CircularProgressIndicator()),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget BuildFavorite(FavoriteData? model, context) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[300],
        ),
        height: 180.0,
        child: Row(
          children: [
            Stack(
              children: [
                Image(
                  image: NetworkImage(
                    '${model!.product!.image}',
                  ),
                  width: 150,
                  height: 180.0,
                ),
                if (model.product!.discount != 0)
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
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "${model.product!.name}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 15, fontFamily: "Oswald"),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "${model.product!.price} \$",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (model.product!.discount != 0)
                        Text(
                          "${model.product!.discount} %",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                          ),
                        ),
                      Spacer(),

                      CircleAvatar(
                        backgroundColor: ShopLayoutCubit.get(context)
                                .Favorite[model.product!.id]!
                            ? Colors.blue
                            : Colors.grey,
                        child: IconButton(
                          onPressed: () {
                            ShopLayoutCubit.get(context)
                                .AddFavorite(model.product!.id);
                          },
                          icon:
                              Icon(Icons.favorite_border, color: Colors.white),
                          iconSize: 20,
                          splashRadius: 25,
                        ),
                      ),
                      SizedBox(
                        width: 12,
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
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
