import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/shop_app/cubit/cubit.dart';
import 'package:my_app/layout/shop_app/cubit/state.dart';
import 'package:my_app/models/shop_categories/Categorise_model.dart';

class CategoriseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopStates>(
      builder: (context, stete) {
        var cubit = ShopLayoutCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.CategoryModel!.status == true,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          BuildItem(cubit.CategoryModel!.data!.Data![index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 12,
                      ),
                      itemCount: cubit.CategoryModel!.data!.Data!.length,
                    ),
                  ),
                ],
              ),
            );
          },
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget BuildItem(OneCategory? model) => Column(
        children: [
          Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.grey[200],
            child: MaterialButton(
              clipBehavior: Clip.antiAlias,
              onPressed: () {},
              minWidth: double.infinity,
              height: 120,
              child: Row(
                children: [
                  Image(
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "${model?.image}",
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      "${model?.name}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ],
      );
}
