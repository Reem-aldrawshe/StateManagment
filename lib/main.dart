import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intro_to_provider_and_streaming/config/service_locater/service_locater.dart';
import 'package:intro_to_provider_and_streaming/manager/theme_manager.dart';
import 'package:intro_to_provider_and_streaming/provider/theme_manager_provider.dart';
import 'package:intro_to_provider_and_streaming/view/product_page.dart';
import 'package:intro_to_provider_and_streaming/view/theme_with_get_it.dart';
import 'package:intro_to_provider_and_streaming/view/theme_with_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ConfigSetup().setup();
  runApp( MaterialApp(
    home: ProductsPage(),
  )
 );
}
