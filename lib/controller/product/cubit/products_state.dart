part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {
  ProductsLoading();

  List<Object?> get props => [];
}

final class ProductsSuccess extends ProductsState {
  final ApiAcs productModelAPI;

  ProductsSuccess(this.productModelAPI);

  List<Object?> get props => [productModelAPI];
}

final class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);

  List<Object?> get props => [message];
}
