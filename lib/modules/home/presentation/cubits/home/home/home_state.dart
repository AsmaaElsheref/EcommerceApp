part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SetFavouriteProducts extends HomeState {}

final class GetFavouriteProducts extends HomeState {}

final class ChangeQuantityState extends HomeState {}

final class CategorySelected extends HomeState {}

final class ResetPrice extends HomeState {}

final class SetCartProductsId extends HomeState {}

final class GetProductsLoading extends HomeState {}
final class GetProductsSuccess extends HomeState {}
final class GetProductsFailed extends HomeState {}
