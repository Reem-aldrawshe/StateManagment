import 'package:flutter/material.dart';
import 'package:water_delivery/utils/responsive.dart';
import 'package:water_delivery/view/screens/home_page.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 21, vertical: 13),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "9:41",
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 15,
            //               fontWeight: FontWeight.w600,
            //             ),
            //           ),
            //           Row(
            //             children: [
            //               Icon(Icons.signal_cellular_alt, color: Colors.black, size: 20),
            //               SizedBox(width: 4),
            //               Icon(Icons.wifi, color: Colors.black, size: 20),
            //               SizedBox(width: 4),
            //               Icon(Icons.battery_full, color: Colors.black, size: 20),
            //             ],
            //           ),
            //         ],
            //       ),

            //       SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.arrow_back, color: Color(0xff3FBDF1)),
                    ],
                  ),
            //     ],
            //   ),
            // ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/onboarding3.png",
                    width: responsive(context, 312),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Fast and responsibly delivery",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff625D5D),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff625D5D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffF2F2F2),
                  ),
                  width: responsive(context, 23),
                  height: 6,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffF2F2F2),
                    shape: BoxShape.rectangle,
                  ),
                  width: responsive(context, 23),
                  height: 6,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff5DCCFC),
                  ),
                  width: responsive(context, 23),
                  height: 6,
                ),
              ],
            ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsive(context, 28),
                vertical: 16,
              ),
              child: SizedBox(
                  width: responsive(context, 318),
                  height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5DCCFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    )
                  ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  "Get started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}