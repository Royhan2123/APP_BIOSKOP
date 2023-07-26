import 'package:apk_bioskop/cubit/auth_cubit.dart';
import 'package:apk_bioskop/halamanbottom.dart';
import 'package:apk_bioskop/login&register/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController txtName = TextEditingController(text: "");
  final TextEditingController txtKonfrimPassword =
      TextEditingController(text: "");
  final TextEditingController txtEmail = TextEditingController(text: "");
  final TextEditingController txtPassword = TextEditingController(text: "");
  bool obsucuretext = true;
  @override
  Widget build(BuildContext context) {
    Widget register() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Card(
          elevation: 8.0,
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Create To Your Account",
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    hintText: "enter your name",
                    labelText: "Name",
                    hintStyle: grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  controller: txtName,
                ),
                const SizedBox(
                  height: 20,
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
                TextField(
                  obscureText: obsucuretext,
                  decoration: InputDecoration(
                    hintText: "enter your Konfirm Password",
                    contentPadding: const EdgeInsets.all(12),
                    labelText: "Konfirm Password",
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
                  controller: txtKonfrimPassword,
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
                      onPressed: () {
                        context.read<AuthCubit>().signUp(
                            email: txtEmail.text,
                            password: txtPassword.text,
                            name: txtName.text,
                            konfirmpassword: txtKonfrimPassword.text);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
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
                      "Already have account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                              (route) => false);
                        },
                        child: const Text("Sign in"))
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
          children: [register()],
        ),
      ),
    );
  }
}
