part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class ProductWishlistBtnClickEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  ProductWishlistBtnClickEvent({required this.clickedProduct});
}

class ProductCartBtnClickEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  ProductCartBtnClickEvent({required this.clickedProduct});
}

class NavigateToWishlistEvent extends HomeEvent {}

class NavigateToCartEvent extends HomeEvent {}
