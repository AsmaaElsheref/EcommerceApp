import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/providers/providers.dart';
import 'data/localStorage/cache_helper.dart';
import 'modules/app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  runApp(
      MultiBlocProvider(providers: providers(),child: const MyApp()),
  );
}