part of 'products_cubit.dart';

@immutable
sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

final class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;
  const ProductsLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

final class ProductsError extends ProductsState {
  final String errorMessage;
  const ProductsError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
