import 'package:assets_follow_up/src/presentation/page/company/companies_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tractian Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2188FF)),
        appBarTheme:
            const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const CompaniesPage(),
    );
  }
}
