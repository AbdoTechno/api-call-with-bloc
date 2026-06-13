import 'package:api_call_bloc/home/models/product_model.dart';
import 'package:api_call_bloc/home/repos/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsLoading());
  ProductRepo repo = ProductRepo();
  void fetchProducts() async {
    try {
      emit(ProductsLoaded(products: await repo.getProducts()));
    } on Exception catch (e) {
      emit(ProductsError(errorMessage: e.toString()));
    }
  }
}
