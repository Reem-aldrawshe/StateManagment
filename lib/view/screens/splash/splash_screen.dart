import 'package:flutter/material.dart';
import 'package:water_delivery/utils/responsive.dart';
import 'package:water_delivery/view/screens/splash/on_boarding1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
   @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
   // final screenWidth = MediaQuery.of(context).size.width;
   // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff5DCCFC),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("9:41",
                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
                      Row(
                        children: [
                          Icon(Icons.signal_cellular_alt,
                              color: Colors.white, size: 20),
                          SizedBox(width: 4),
                          Icon(Icons.wifi, color: Colors.white, size: 20),
                          SizedBox(width: 4),
                          Icon(Icons.battery_full,
                              color: Colors.white, size: 20),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 200),
            Center(
              child: Container(
                 width: responsive(context, 231),
               // height: 
                child: Image.asset("assets/images/logog.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
