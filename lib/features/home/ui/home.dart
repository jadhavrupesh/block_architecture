import 'package:block_architecture/features/cart/ui/caet.dart';
import 'package:block_architecture/features/home/block/home_bloc.dart';
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
        }

        if (state is NavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlist()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case HomeLoadedSuccessState:
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
                  child: Text("Home View"),
                ),
              ),
            );
            break;
          case HomeErrorState:
            return Scaffold(
              appBar: AppBar(
                title: Text("Home Error"),
              ),
              body: Center(
                child: Text("Home Error"),
              ),
            );
            break;
          default:
            return SizedBox();
        }
      },
    );
  }
}
