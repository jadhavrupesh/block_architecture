part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ProductWishlistBtnClickEvent extends HomeEvent {}

class ProductCartBtnClickEvent extends HomeEvent {}

class NavigateToWishlistEvent extends HomeEvent {}

class NavigateToCartEvent extends HomeEvent {}
