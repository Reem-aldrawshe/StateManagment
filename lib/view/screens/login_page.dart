// import 'package:flutter/material.dart';
// import 'package:water_delivery/utils/responsive.dart';
// import 'package:water_delivery/view/screens/product_page.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 28),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "9:41",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Icon(Icons.signal_cellular_alt,
//                             color: Colors.black, size: 20),
//                         SizedBox(width: 4),
//                         Icon(Icons.wifi, color: Colors.black, size: 20),
//                         SizedBox(width: 4),
//                         Icon(Icons.battery_full,
//                             color: Colors.black, size: 20),
//                       ],
//                     ),
//                   ],
//                 ),
            
//                 const SizedBox(height: 16),
            
//                 IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: const Icon(Icons.arrow_back, color: Color(0xff3FBDF1)),
//                 ),
//                 const SizedBox(height: 16),
            
//                 const Text(
//                   "Welcome Back!",
//                   style: TextStyle(
//                     color: Color(0xff5DCCFC),
//                     fontSize: 20,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "Please fill in your email password to login to your account.",
//                   style: TextStyle(
//                     color: Color(0xff625D5D),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
            
//                 const SizedBox(height: 32),
            
//                 const Text("Email", style: TextStyle(color: Color(0xff625D5D), fontSize: 14, fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 6),
//                 const TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     hintText: "Productionexperience@gmail.com",
//                     hintStyle: TextStyle(color: Color(0xff625D5D), fontSize: 12 , fontWeight: FontWeight.w400),
//                      border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                     ),
//                     // focusedBorder: fieldBorder,
//                     // enabledBorder: fieldBorder,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                   ),
//                 ),
            
//                 const SizedBox(height: 16),
            
//                 const Text("Password", style: TextStyle(color: Color(0xff625D5D), fontSize: 14 , fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 6),
//                 const TextField(
//                   obscureText: true,
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     hintText: "******************",
//                     hintStyle: TextStyle(color: Color(0xff625D5D)),
//                    border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                     ),
//                     // focusedBorder: fieldBorder,
//                     // enabledBorder: fieldBorder,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 50),
//                   ),
//                 ),
            
//                 const SizedBox(height: 8),
            
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                     },
//                     child: const Text(
//                       "Forgot Password?",
//                       style: TextStyle(
//                         color: Color(0xff625D5D),
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
            
//                 const SizedBox(height: 120),
            
//                 SizedBox(
//                   width: responsive(context, 319),
//                   height: 60,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xff5DCCFC),
//                     shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(1),
//                     )
//                     ),
//                     onPressed: () {
//                      Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) =>  ProductPage()),
//                       );
//                     },
//                     child: const Text(
//                       "Login",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),
            
//                 const SizedBox(height: 17),
            
//                Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Already have an account? " , style: TextStyle(color: Color(0xff625D5D), fontSize: 14 , fontWeight: FontWeight.w400),),
//                       GestureDetector(
//                         onTap: () {
//                          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
//                         },
//                         child: const Text(
//                           "Sign in",
//                           style: TextStyle(
//                             color: Color(0xff3FBDF1),
//                             fontSize: 14 ,
//                              fontWeight: FontWeight.w400
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//               ],
//             ),
//           ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_delivery/bloc/auth/auth_bloc.dart';
import 'package:water_delivery/bloc/auth/auth_event.dart';
import 'package:water_delivery/bloc/auth/auth_state.dart';
import 'package:water_delivery/utils/responsive.dart';
import 'package:water_delivery/view/screens/product_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _onLoginPressed() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    context.read<AuthBloc>().add(LoginEvent(email: email, password: password));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("9:41",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_alt, color: Colors.black, size: 20),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, color: Colors.black, size: 20),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, color: Colors.black, size: 20),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Color(0xff3FBDF1)),
              ),

              const SizedBox(height: 16),

              const Text("Welcome Back!",
                  style: TextStyle(
                      color: Color(0xff5DCCFC),
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                "Please fill in your email password to login to your account.",
                style: TextStyle(
                    color: Color(0xff625D5D),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),

              const SizedBox(height: 32),

              const Text("Email",
                  style: TextStyle(
                      color: Color(0xff625D5D),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Productionexperience@gmail.com",
                  hintStyle: TextStyle(
                      color: Color(0xff625D5D),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),

              const SizedBox(height: 16),

              const Text("Password",
                  style: TextStyle(
                      color: Color(0xff625D5D),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "******************",
                  hintStyle: TextStyle(color: Color(0xff625D5D)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Navigate to forgot password
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Color(0xff625D5D),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 60),

              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) =>  ProductPage()));
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                child: SizedBox(
                  width: responsive(context, 319),
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _onLoginPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5DCCFC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                    child: const Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),

              const SizedBox(height: 17),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(
                          color: Color(0xff625D5D),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to RegisterPage
                    },
                    child: const Text(
                      " Sign up",
                      style: TextStyle(
                          color: Color(0xff3FBDF1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
