part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class ChangeSecure extends SignupState {}

final class SetEmail extends SignupState {}

final class ResetData extends SignupState {}

final class SetValidation extends SignupState {}

final class SignupLoading extends SignupState {}
final class SignupSuccess extends SignupState {}
final class SignupFailed extends SignupState {}
