import 'package:block_architecture/features/cart/ui/caet.dart';
import 'package:block_architecture/features/home/block/home_bloc.dart';
import 'package:block_architecture/features/home/ui/product_tile_widget.dart';
import 'package:block_architecture/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeBloc homeBlock = HomeBloc();

  @override
  void initState() {
    homeBlock.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBlock,
      listenWhen: (context, state) => state is HomeActionState,
      buildWhen: (context, state) => state is! HomeActionState,
      listener: (context, state) {
        if (state is NavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is NavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlist()));
        } else if (state is ProductCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Item Carted..."),
            ),
          );
        } else if (state is ProductWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Item Wishlisted..."),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                title: const Text("HomeView"),
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
                child: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      homeBloc: homeBlock,
                      productDataModel: successState.products[index],
                    );
                  },
                ),
              ),
            );
            break;
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Home Error"),
              ),
            );
            break;
          default:
            return const SizedBox();
        }
      },
    );
  }
}
