import 'package:eloro_app_for_home_work/core/di/di.dart';
import 'package:eloro_app_for_home_work/features/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'features/cart/data/models/cart_item_model.dart';
import 'features/main/presentation/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpService();
  await Hive.initFlutter();

  Hive.registerAdapter(CartItemModelAdapter());

  await Hive.openBox<CartItemModel>('cartBox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<CartBloc>(),)],
      child: MaterialApp(home: MainScreen()));
  }
}
