import 'package:block_architecture/features/cart/ui/caet.dart';
import 'package:block_architecture/features/home/block/home_bloc.dart';
import 'package:block_architecture/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBlock = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBlock,
      listenWhen: (context, state) => state is HomeActionState,
      buildWhen: (context, state) => state is! HomeState,
      listener: (context, state) {
        if (state is NavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
        }

        if (state is NavigateToWishlistPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Wishlist()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("HomeView"),
            actions: [
              IconButton(
                onPressed: () {
                  homeBlock.add(NavigateToWishlistEvent());
                },
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {
                  homeBlock.add(NavigateToCartEvent());
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
          body: Center(
            child: Container(
              color: Colors.amber,
              child: const Text("Home View"),
            ),
          ),
        );
      },
    );
  }
}
