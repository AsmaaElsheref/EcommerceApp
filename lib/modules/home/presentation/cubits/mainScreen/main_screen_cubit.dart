import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../cart/presentation/screens/cart.dart';
import '../../../../profile/presentation/screens/profile.dart';
import '../../screens/home/buildHome/home.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitial());

  static MainScreenCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;
  List screens=[
    Home(),
    Cart(),
    Profile()
  ];

  void changeScreen(index){
    currentIndex = index;
    emit(ChangeScreen());
  }

}
