part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ChangeFavoriteState extends ProductState {}

final class GetBurgerSuccessState extends ProductState {}

final class GetBurgerLoadingState extends ProductState {}

final class GetBurgerErrorState extends ProductState {
  GetBurgerErrorState(String? msg);
}

final class GetChickenSuccessState extends ProductState {}

final class GetChickenLoadingState extends ProductState {}

final class GetChickenErrorState extends ProductState {
  GetChickenErrorState(String? msg);
}

final class GetCheesePizzaSuccessState extends ProductState {}

final class GetCheesePizzaLoadingState extends ProductState {}

final class GetCheesePizzaErrorState extends ProductState {
  GetCheesePizzaErrorState(String? msg);
}

final class GetPepperoniPizzaSuccessState extends ProductState {}

final class GetPepperoniPizzaLoadingState extends ProductState {}

final class GetPepperoniPizzaErrorState extends ProductState {
  GetPepperoniPizzaErrorState(String? msg);
}
