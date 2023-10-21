import 'package:block_architecture/features/cart/bloc/cart_bloc.dart';
import 'package:block_architecture/features/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart View"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (context, state) => state is CartActionState,
        buildWhen: (context, state) => state is! CartActionState,
        listener: (context, state) {
          if (state is! CartRemoveState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Item removed From Cart.")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return Center(
                child: ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                      cartBloc: cartBloc,
                      productDataModel: successState.cartItems[index],
                    );
                  },
                ),
              );

            default:
          }
          return Container();
        },
      ),
    );
  }
}
