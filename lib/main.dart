import 'package:apk_bioskop/cubit/auth_cubit.dart';
import 'package:apk_bioskop/cubit/bottom_cubit.dart';
import 'package:apk_bioskop/cubit/gambar_cubit.dart';
import 'package:apk_bioskop/cubit/gambar_nonton_cubit.dart';
import 'package:apk_bioskop/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const NewApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(),),
        BlocProvider(create: (context) => BottomCubit(),),        
        BlocProvider(create: (context) => GambarCubit(),),        
        BlocProvider(create: (context) => GambarNontonCubit(),),                
      ],
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        title: "",
      ),
    );
  }
}

