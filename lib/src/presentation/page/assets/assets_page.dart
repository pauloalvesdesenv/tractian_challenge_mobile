import 'package:assets_follow_up/src/domain/entity/company_entity.dart';
import 'package:assets_follow_up/src/presentation/page/assets/assets_bloc.dart';
import 'package:assets_follow_up/src/presentation/page/assets/states/assets_error_page.dart';
import 'package:assets_follow_up/src/presentation/page/assets/states/assets_loading_page.dart';
import 'package:assets_follow_up/src/presentation/page/assets/states/states_loaded/assets_loaded_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AssetsPage extends StatelessWidget {
  final CompanyEntity company;
  const AssetsPage({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Assets of ${company.name}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF17192D),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (_) =>
            GetIt.I.get<AssetsBloc>()..onCubitInit(companyId: company.id),
        child: BlocBuilder<AssetsBloc, AssetsState>(
          builder: (_, state) {
            if (state is AssetsLoadingState) {
              return AssetsLoadingPage(
                company: company,
              );
            }
            if (state is AssetsErrorState) {
              return AssetsErrorPage(state);
            }
            if (state is AssetsLoadedState) {
              return AssetsLoadedPage(state);
            }
            throw Exception();
          },
        ),
      ),
    );
  }
}
