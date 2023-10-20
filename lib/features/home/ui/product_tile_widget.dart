import 'package:block_architecture/model/ProductDataModel.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;

  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(productDataModel.imageUrl),
                ),
              ),
            ),
            Text(
              productDataModel.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              productDataModel.description,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("${productDataModel.price}"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: () {},
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
