import 'package:assets_follow_up/src/domain/entity/company_entity.dart';
import 'package:assets_follow_up/src/presentation/widget/app_loading.dart';
import 'package:flutter/material.dart';

class AssetsLoadingPage extends StatelessWidget {
  final CompanyEntity company;
  const AssetsLoadingPage({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return AppLoading(
      description: 'Loading assets of ${company.name}, wait please',
    );
  }
}
