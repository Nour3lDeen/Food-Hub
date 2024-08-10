import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/model/product_model/burger_model.dart';
import 'package:restaurant/model/product_model/chicken_model.dart';
import 'package:restaurant/model/product_model/pizza_model.dart';
import 'package:restaurant/view_model/data/firebase/firebase_keys.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  List<BurgerProduct> burgerProducts = [];
  List<ChickenProduct> chickenProducts = [];
  List<PizzaProduct> pizzaProducts = [];

  static ProductCubit get(context) => BlocProvider.of<ProductCubit>(context);
  FirebaseFirestore db = FirebaseFirestore.instance;

  bool isFavorite = false;
  void changeFavorite() {
    isFavorite = !isFavorite;
    emit(ChangeFavoriteState());
  }

  Future<void> getBurger() async {
    int i = 0;
    emit(GetBurgerLoadingState());
    await db
        .collection(FirebaseKeys.categories)
        .doc(FirebaseKeys.burger)
        .collection(FirebaseKeys.beef)
        .get()
        .then((value) {
      for (var element in value.docs) {
        burgerProducts.add(BurgerProduct.fromJson(element.data()));
        print(burgerProducts.length);
        print(burgerProducts[i++].toJson());
      }
      emit(GetBurgerSuccessState());
    },onError: (error) {
      if(error is FirebaseException) {
        emit(GetBurgerErrorState(error.message??'Error'));
      }
    });
  }

  Future<void> getChicken() async {
    emit(GetChickenLoadingState());
    await db
        .collection(FirebaseKeys.categories)
        .doc(FirebaseKeys.chicken)
        .collection(FirebaseKeys.chicken)
        .get()
        .then((value) {
      for (var element in value.docs) {
        chickenProducts.add(ChickenProduct.fromJson(element.data()));
        /*print(chickenProducts.length);
        print(chickenProducts[i++].toJson());*/
      }
      emit(GetChickenSuccessState());
    },onError: (error) {
      if(error is FirebaseException) {
        emit(GetChickenErrorState(error.message??'Error'));
      }
    });
  }

  Future<void> getCheesePizza() async {
    emit(GetCheesePizzaLoadingState());
    await db
        .collection(FirebaseKeys.categories)
        .doc(FirebaseKeys.pizza)
        .collection(FirebaseKeys.cheesePizza)
        .get()
        .then((value) {
      for (var element in value.docs) {
        pizzaProducts.add(PizzaProduct.fromJson(element.data()));
        /*print(pizzaProducts.length);
        print(pizzaProducts[i++].toJson());*/
      }
      emit(GetCheesePizzaSuccessState());
    },onError: (error) {
      if(error is FirebaseException) {
        emit(GetCheesePizzaErrorState(error.message??'Error'));
      }
    });
  }


  Future<void> getPepperoniPizza() async {
    emit(GetPepperoniPizzaLoadingState());
    await db
        .collection(FirebaseKeys.categories)
        .doc(FirebaseKeys.pizza)
        .collection(FirebaseKeys.pepperoniPizza)
        .get()
        .then((value) {
      for (var element in value.docs) {
        pizzaProducts.add(PizzaProduct.fromJson(element.data()));
       /* print(pizzaProducts.length);
        print(pizzaProducts[i++].toJson());*/
      }
      emit(GetPepperoniPizzaSuccessState());
    },onError: (error) {
      if(error is FirebaseException) {
        emit(GetPepperoniPizzaErrorState(error.message??'Error'));
      }
    });
  }

  Future<void> getALlProducts() async {
    await getBurger();
    await getChicken();
    await getCheesePizza();
    await getPepperoniPizza();
  }
}



