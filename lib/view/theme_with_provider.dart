
import 'package:flutter/material.dart';
import 'package:intro_to_provider_and_streaming/provider/theme_manager_provider.dart';
import 'package:provider/provider.dart';

class ThemeProviderExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ThemeManagerProvider()
    ,child: Consumer<ThemeManagerProvider>(
      builder: (context,data,_) {
        return MaterialApp(
        
              darkTheme: ThemeData(scaffoldBackgroundColor: Colors.grey),
              theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          themeMode: context.read<ThemeManagerProvider>().isDark ? ThemeMode.dark : ThemeMode.light,
          home: HomePage(),
        );
      }
    ),
    );
  }

}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        // context.read<ThemeManagerProvider>().changeTheme();
        Navigator.push(context,MaterialPageRoute(builder: (context) => MyWidget(),));
      }),
    );
  }
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InkWell(
        onTap: () {
          context.read<ThemeManagerProvider>().changeTheme();
        },
        child: FlutterLogo()),),
    );
  }
}