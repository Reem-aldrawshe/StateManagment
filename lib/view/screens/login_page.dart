import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_delivery/bloc/auth/auth_bloc.dart';
import 'package:water_delivery/bloc/auth/auth_event.dart';
import 'package:water_delivery/bloc/auth/auth_state.dart';
import 'package:water_delivery/model/user_model.dart';
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
  final username = emailController.text.trim(); 
  final password = passwordController.text;

  if (username.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter email and password')),
    );
    return;
  }
  context.read<AuthBloc>().add(
    LoginEvent(LoginModel(username: username, password: password)),
  );
}

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthSuccess) {
          Navigator.of(context).pop(); 
          Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const ProductPage()),
);

        } else if (state is AuthFailure) {
          Navigator.of(context).pop(); 
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("9:41",
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 15,
                //             fontWeight: FontWeight.w600)),
                //     Row(
                //       children: [
                //         Icon(Icons.signal_cellular_alt, color: Colors.black, size: 20),
                //         SizedBox(width: 4),
                //         Icon(Icons.wifi, color: Colors.black, size: 20),
                //         SizedBox(width: 4),
                //         Icon(Icons.battery_full, color: Colors.black, size: 20),
                //       ],
                //     ),
                //   ],
                // ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Color(0xff3FBDF1)),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                    color: Color(0xff5DCCFC),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Sign in to your account",
                  style: TextStyle(
                    color: Color(0xff625D5D),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 32),
                const Text("Email", style: TextStyle(color: Color(0xff625D5D), fontSize: 14, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "example@gmail.com",
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Password", style: TextStyle(color: Color(0xff625D5D), fontSize: 14, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "************",
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                    ),
                    onPressed: _onLoginPressed,
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
