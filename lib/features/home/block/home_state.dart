part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState(this.products);
}

class HomeErrorState extends HomeState {}

class NavigateToWishlistPageActionState extends HomeActionState {}

class NavigateToCartPageActionState extends HomeActionState {}
