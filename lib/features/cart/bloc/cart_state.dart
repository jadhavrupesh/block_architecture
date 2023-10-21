part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({
    required this.cartItems,
  });
}

class CartRemoveState extends CartActionState {
  final List<ProductDataModel> cartItems;
  CartRemoveState({required this.cartItems});
}
