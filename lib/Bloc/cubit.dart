import 'package:store_app_flutter/Bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_flutter/EndPoints/endpints.dart';
import 'package:store_app_flutter/Helpers/Network/dioHelper.dart';
import 'package:store_app_flutter/models/product_model.dart';

class StoreCubit extends Cubit<StoreStates> {
  StoreCubit(super.initialState);

  static StoreCubit get(context) => BlocProvider.of(context);

  ProductModel? productModel;
  List<ProductModel> products = [];

  void getProducts() async {
    emit(StoreGetProductsLoading());
    await DioHelper.getData(url: allPRODUCTS).then((value) {
      products = [];
      List<dynamic> productsData = value.data;

      print(value.data);

      productsData.forEach((e) {
        products.add(ProductModel.fromJson(e));
      });

      emit(StoreGetProductsSuccessState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  bool islike = false;

  void updateProduct(
      {String? title,
      String? desc,
      String? price,
      String? category,
      String? img,
      int? id}) async {
    emit(StoreUpdatesLoading());
    await DioHelper.putData(url: '$allPRODUCTS/$id', data: {
      'title': title ?? productModel!.title,
      'description': desc ?? productModel!.dec,
      'price': price ?? productModel!.price,
      'image': img,
      'category': category,
      'id': id,
    }).then((value) {
      print(value.data);
      productModel = ProductModel.fromJson(value.data);
      emit(StoreUpdateSuccess(productModel!));
    }).catchError((error) {
      print(error.toString());
      emit(StoreUpdatesErrorState(error: error.toString()));
    });
  }
}
