import 'package:assets_follow_up/src/presentation/widget/app_loading.dart';
import 'package:flutter/material.dart';

class CompaniesLoadingPage extends StatelessWidget {
  const CompaniesLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLoading(
      description: 'Loading companies, wait please',
    );
  }
}
