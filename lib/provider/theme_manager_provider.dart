import 'package:flutter/material.dart';

class ThemeManagerProvider extends ChangeNotifier{
bool isDark = false;

changeTheme(){
  isDark=!isDark;
  print(isDark);
  notifyListeners();
}

} 