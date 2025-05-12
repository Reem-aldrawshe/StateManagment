
import 'package:get_it/get_it.dart';
import 'package:intro_to_provider_and_streaming/manager/theme_manager.dart';


class ConfigSetup{




setup(){
  GetIt.instance.registerSingleton<ThemeManager>(ThemeManager());

  
}
}