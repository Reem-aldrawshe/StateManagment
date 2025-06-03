import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_delivery/bloc/auth/auth_bloc.dart';
import 'package:water_delivery/bloc/product/product_bloc.dart';
import 'package:water_delivery/service/auth_service.dart';
import 'package:water_delivery/service/product_service.dart';
import 'package:water_delivery/repositories/product_repository.dart';
import 'package:water_delivery/view/screens/home_page.dart';
import 'package:water_delivery/bloc/product/product_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(AuthService()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            repository: ProductRepository(service: ProductService()),
          )..add(LoadProducts()),
        ),
        
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
