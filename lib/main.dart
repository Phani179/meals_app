import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            // brightness: Brightness.dark,
            seedColor: const Color.fromARGB(255, 131, 57, 0),
          ),
          textTheme: GoogleFonts.robotoMonoTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: const TabsScreen(),
      ),
    );
  }
}
