// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:water_delivery/bloc/auth/auth_bloc.dart';
// import 'package:water_delivery/bloc/auth/auth_event.dart';
// import 'package:water_delivery/utils/responsive.dart';
// import 'package:water_delivery/view/screens/login_page.dart';

// class RegisterPage extends StatelessWidget {
//   const RegisterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 28,),
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
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () => Navigator.pop(context),
//                       icon: const Icon(Icons.arrow_back, color: Color(0xff3FBDF1)),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 16),

//                 const Text(
//                   "Create your Account",
//                   style: TextStyle(
//                     color: Color(0xff5DCCFC),
//                     fontSize: 20,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "Please fill in your details to create your/n account",
//                   style: TextStyle(
//                     color: Color(0xff625D5D),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),

//                 const SizedBox(height: 32),

//                 const Text("Name", style: TextStyle(color: Color(0xff625D5D), fontSize: 14, fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 6),
//                 const TextField(
//                   decoration: InputDecoration(
//                     hintText: "Product Experience",
//                      border: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.grey),
//     ),
//                     // focusedBorder: fieldBorder,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 const Text("Email", style: TextStyle(color: Color(0xff625D5D), fontSize: 14, fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 6),
//                 const TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     hintText: "Productionexperience@gmail.com",
//                      border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                     ),
//                    // focusedBorder: fieldBorder,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 const Text("Password", style: TextStyle(color: Color(0xff625D5D), fontSize: 14, fontWeight: FontWeight.w700),),
//                 const SizedBox(height: 6),
//                 const TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: "******************",
//                      border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                     ),
//                     // focusedBorder: fieldBorder,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 const Text("Confirm Password", style: TextStyle(color: Color(0xff625D5D), fontSize: 14, fontWeight: FontWeight.w700),),
//                 const SizedBox(height: 6),
//                 const TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: "******************",
//                     border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                     // focusedBorder: fieldBorder,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                   ),
//                 ),

//                 const SizedBox(height: 32),

//                 SizedBox(
//                   width: responsive(context, 318),
//                   height: 60,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xff5DCCFC),
//                       shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(1),
//                     )
//                     ),
//                     onPressed: () {
//                       context.read<AuthBloc>().add(RegisterEvent(name: , email: email, password: password));
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Account Created")),
//                       );
//                     },
//                     child: const Text(
//                       "Create an account",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Already have an account? " , style: TextStyle(color: Color(0xff625D5D), fontSize: 14 , fontWeight: FontWeight.w400),),
//                     GestureDetector(
//                       onTap: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
//                       },
//                       child: const Text(
//                         "Sign in",
//                         style: TextStyle(
//                           color: Color(0xff3FBDF1),
//                           fontSize: 14 ,
//                            fontWeight: FontWeight.w400
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
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
import 'package:water_delivery/utils/responsive.dart';
import 'package:water_delivery/view/screens/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                  Text(
                    "9:41",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_alt,
                          color: Colors.black, size: 20),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, color: Colors.black, size: 20),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full,
                          color: Colors.black, size: 20),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Color(0xff3FBDF1)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Create your Account",
                style: TextStyle(
                  color: Color(0xff5DCCFC),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please fill in your details to create your/n account",
                style: TextStyle(
                  color: Color(0xff625D5D),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 32),

              const Text("Name",
                  style: TextStyle(
                      color: Color(0xff625D5D),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Product Experience",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),

              const SizedBox(height: 16),

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
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),

              const SizedBox(height: 16),

              const Text("Confirm Password",
                  style: TextStyle(
                      color: Color(0xff625D5D),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "******************",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: responsive(context, 318),
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5DCCFC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      )),
                  onPressed: () {
                    final name = nameController.text.trim();
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    final confirmPassword = confirmPasswordController.text.trim();

                    if (name.isEmpty ||
                        email.isEmpty ||
                        password.isEmpty ||
                        confirmPassword.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please fill all fields")),
                      );
                      return;
                    }

                    if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Passwords do not match")),
                      );
                      return;
                    }

                    context.read<AuthBloc>().add(
                          RegisterEvent(
                            username: name,
                            email: email,
                            password: password,
                          ),
                        );
                    // يمكنك اظهار رسالة نجاح أو معالجة الحالة في BlocListener
                  },
                  child: const Text(
                    "Create an account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                        color: Color(0xff625D5D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginPage()));
                    },
                    child: const Text(
                      "Sign in",
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
