import 'package:apk_bioskop/cubit/auth_cubit.dart';
import 'package:apk_bioskop/halamanbottom.dart';
import 'package:apk_bioskop/login&register/register.dart';
import 'package:apk_bioskop/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController txtEmail = TextEditingController(text: "");
  final TextEditingController txtPassword = TextEditingController(text: "");
  bool obsucuretext = true;
  @override
  Widget build(BuildContext context) {
    Widget login() {
      return Container(
        margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Card(  
          elevation: 12.0,
          shadowColor: Colors.blueGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Login To Your Account",
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    hintText: "name@example.com",
                    labelText: "Email",
                    hintStyle: grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: txtEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: obsucuretext,
                  decoration: InputDecoration(
                    hintText: "enter your password",
                    contentPadding: const EdgeInsets.all(12),
                    labelText: "Password",
                    hintStyle: grey,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsucuretext = !obsucuretext;
                          });
                        },
                        icon: Icon(obsucuretext
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: txtPassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSucces) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HalamanBottom(),
                          ),
                          (route) => false);
                    } else if (state is AuthFailed) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 40),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.deepPurple,
                        shadowColor: Colors.black,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Your Password")),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "-- or sign with --",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/facebook.png",
                        scale: 3.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/google.png",
                        scale: 3.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/twitter.png",
                        scale: 3.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dont have account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                              (route) => false);
                        },
                        child: const Text("Sign Up"))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          login(),
        ],
      )),
    );
  }
}
