import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:water_delivery/bloc/auth/auth_bloc.dart';
import 'package:water_delivery/service/auth_service.dart';
import 'package:water_delivery/service/user_service.dart';
import 'package:water_delivery/view/screens/product_page.dart';
import 'bloc/product/product_bloc.dart';
import 'bloc/product/product_event.dart';
import 'service/company_service.dart';
import 'service/offer_service.dart';
import 'view/screens/splash/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ProviderScope(
      child: DevicePreview(enabled: true, builder: (context) => MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ProductBloc>(
                create: (context) => ProductBloc(
                  offerService: OfferService(),
                  companyService: CompanyService(),
                )..add(LoadProducts()),
              ),
              BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(
                  AuthService(),
                  UserService(),
                ),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
            ),
          );
        });
  }
}
