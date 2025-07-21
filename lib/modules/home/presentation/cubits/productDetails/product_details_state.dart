part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class SetProductImageIndex extends ProductDetailsState {}

final class SetCurrentProductIndex extends ProductDetailsState {}
