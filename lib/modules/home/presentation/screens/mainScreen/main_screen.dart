import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/mainScreen/bottomNavigationBar/bottom_nav_bar.dart';
import '../../cubits/mainScreen/main_screen_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    MainScreenCubit.get(context).changeScreen(0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainScreenCubit, MainScreenState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: MainScreenCubit.get(context).screens[MainScreenCubit.get(context).currentIndex]
      ),
    );
  }
}