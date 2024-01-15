import 'package:store_app_flutter/models/product_model.dart';

abstract class StoreStates {}

class StoreInitialState extends StoreStates {}

class StoreGetProductsSuccessState extends StoreStates {}

class StoreGetProductsErrorState extends StoreStates {
  final String error;

  StoreGetProductsErrorState({required this.error});
}

class StoreChangeModeState extends StoreStates {}

class StoreGetProductsLoading extends StoreStates {}

class StoreUpdatesErrorState extends StoreStates {
  final String error;

  StoreUpdatesErrorState({required this.error});
}

class StoreUpdatesLoading extends StoreStates {}

class StoreUpdateSuccess extends StoreStates {
  final ProductModel productModel;

  StoreUpdateSuccess(this.productModel);
}

class LikeSuccessState extends StoreStates {}
