import 'package:cassava_app/screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme(
      headline1: GoogleFonts.rubik(
          fontSize: 83, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.rubik(
          fontSize: 52, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.rubik(fontSize: 42, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.rubik(
          fontSize: 29, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.rubik(fontSize: 21, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.rubik(
          fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.rubik(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.rubik(
          fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.poppins(
          fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.poppins(
          fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.poppins(
          fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.poppins(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.poppins(
          fontSize: 8, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    );
    const ColorScheme colorScheme = ColorScheme(
      primary: Color(0xFF55836F),
      primaryVariant: Color(0xFF75A488),
      secondary: Color(0xFF1E1E1E),
      secondaryVariant: Color(0xFF747474),
      background: Colors.white,
      // surface: Color(0xFFF1F6F3),
      surface: Colors.white,

      onSurface: Color(0xFF55836F),
      onBackground: Color(0xFF1E1E1E),
      error: Color(0xFF1E1E1E),
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      brightness: Brightness.light,
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cassava App',
        home: const HomeScreen(),
        theme: ThemeData(
          colorScheme: colorScheme,
          textTheme: textTheme,
        ));
  }
}
