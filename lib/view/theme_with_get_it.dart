
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intro_to_provider_and_streaming/manager/theme_manager.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key});


  

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GetIt.instance.get<ThemeManager>().isDark,
      builder: (context, value, child) {
        return MaterialApp(
          darkTheme: ThemeData(scaffoldBackgroundColor: Colors.grey),
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          themeMode: value ? ThemeMode.dark : ThemeMode.light,
          home: ProductPage(),
        );
      }
    );
  }
}


class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        GetIt.instance.get<ThemeManager>().changeTheme();
      }),
    );
  }
}

