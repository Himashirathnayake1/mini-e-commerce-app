import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1612),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Mini-E",
          theme: ThemeData(
            colorSchemeSeed: Colors.deepPurple,
            textTheme: GoogleFonts.montserratTextTheme(),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
