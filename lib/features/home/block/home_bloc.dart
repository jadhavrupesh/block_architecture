import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_architecture/data/card_items.dart';
import 'package:block_architecture/data/groceryData.dart';
import 'package:block_architecture/data/wishlist_items.dart';
import 'package:block_architecture/model/ProductDataModel.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<NavigateToWishlistEvent>(navigateToWishlistEvent);
    on<NavigateToCartEvent>(navigateToCartEvent);
    on<ProductWishlistBtnClickEvent>(productWishlistBtnClickEvent);
    on<ProductCartBtnClickEvent>(productCartBtnClickEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    print("home initial event called: ");
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 0));
    emit(HomeLoadedSuccessState(GroceryData.groceryProducts
        .map((e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['imageUrl']))
        .toList()));
  }

  FutureOr<void> productWishlistBtnClickEvent(
      ProductWishlistBtnClickEvent event, Emitter<HomeState> emit) {
    print("wishlist product click event: ");
    wishlistItems.add(event.clickedProduct);
    emit(ProductWishlistedActionState());
    print("Wishlist length is ${wishlistItems.length}");
  }

  FutureOr<void> productCartBtnClickEvent(
      ProductCartBtnClickEvent event, Emitter<HomeState> emit) {
    print("cart product click event: ");
    cartItems.add(event.clickedProduct);
    print("cartItems length is ${cartItems.length}");
    emit(ProductCartedActionState());
  }

  FutureOr<void> navigateToWishlistEvent(
      NavigateToWishlistEvent event, Emitter<HomeState> emit) {
    print("Wishlist navigation click event: ");
    emit(NavigateToWishlistPageActionState());
  }

  FutureOr<void> navigateToCartEvent(
      NavigateToCartEvent event, Emitter<HomeState> emit) {
    print("cart navigation click event: ");
    emit(NavigateToCartPageActionState());
  }
}
