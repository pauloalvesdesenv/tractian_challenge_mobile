import 'package:assets_follow_up/src/presentation/page/company/companies_bloc.dart';
import 'package:flutter/material.dart';

class CompaniesErrorPage extends StatelessWidget {
  final CompaniesErrorState state;

  const CompaniesErrorPage(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(state.message);
  }
}
