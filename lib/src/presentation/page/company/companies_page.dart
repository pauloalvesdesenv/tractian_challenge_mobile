import 'package:assets_follow_up/src/presentation/page/company/companies_bloc.dart';
import 'package:assets_follow_up/src/presentation/page/company/states/companies_error_page.dart';
import 'package:assets_follow_up/src/presentation/page/company/states/companies_loaded/companies_list_widget.dart';
import 'package:assets_follow_up/src/presentation/page/company/states/companies_loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Companies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF17192D),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (_) => GetIt.I.get<CompaniesBloc>()..onCubitInit(),
        child: BlocBuilder<CompaniesBloc, CompaniesState>(
          builder: (_, state) {
            if (state is CompaniesLoadingState) {
              return const CompaniesLoadingPage();
            }
            if (state is CompaniesErrorState) {
              return CompaniesErrorPage(state);
            }
            if (state is CompaniesLoadedState) {
              return CompaniesListWidget(state);
            }
            throw Exception();
          },
        ),
      ),
    );
  }
}
