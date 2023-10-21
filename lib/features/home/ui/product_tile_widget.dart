import 'package:block_architecture/features/home/block/home_bloc.dart';
import 'package:block_architecture/model/ProductDataModel.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  final ProductDataModel productDataModel;

  const ProductTileWidget({
    super.key,
    required this.homeBloc,
    required this.productDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(productDataModel.imageUrl),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              productDataModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              productDataModel.description,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${productDataModel.price}"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(ProductWishlistBtnClickEvent(
                            clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(ProductCartBtnClickEvent(
                            clickedProduct: productDataModel));
                      },
                      icon: Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
