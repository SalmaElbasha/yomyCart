import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/presentation/product/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(BuildContext context) => BlocProvider.of(context);

//  bool isFavorite = false;
  bool isInCart = false;

  ///todo
  void changeFavoriteButton() {
    //  isFavorite = !isFavorite;
    emit(ChangeFavoriteState());
  }

  void changeCartButton() {
    isInCart = !isInCart;
    emit(AddToCartState());
  }
}
