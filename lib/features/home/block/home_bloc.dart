import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_architecture/data/groceryData.dart';
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
    on<ProductCartBtnClickEvent>(croductCartBtnClickEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    print("home initial event called: ");
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
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
  }

  FutureOr<void> croductCartBtnClickEvent(
      ProductCartBtnClickEvent event, Emitter<HomeState> emit) {
    print("cart product click event: ");
  }

  FutureOr<void> navigateToWishlistEvent(
      NavigateToWishlistEvent event, Emitter<HomeState> emit) {
    print("Wishlist navigation click event: ");
    emit(NavigateToCartPageActionState());
  }

  FutureOr<void> navigateToCartEvent(
      NavigateToCartEvent event, Emitter<HomeState> emit) {
    print("cart navigation click event: ");
    emit(NavigateToCartPageActionState());
  }
}
