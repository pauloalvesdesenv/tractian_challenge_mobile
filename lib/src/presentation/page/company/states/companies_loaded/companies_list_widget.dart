import 'package:assets_follow_up/src/presentation/page/assets/assets_page.dart';
import 'package:assets_follow_up/src/presentation/page/company/companies_bloc.dart';
import 'package:flutter/material.dart';

class CompaniesListWidget extends StatelessWidget {
  final CompaniesLoadedState state;

  const CompaniesListWidget(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: state.companies.length,
      separatorBuilder: (_, i) => const Divider(
        height: 0,
        thickness: 0.2,
        color: Colors.grey,
      ),
      itemBuilder: (_, i) => ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AssetsPage(
                      company: state.companies[i],
                    ))),
        leading: const Icon(
          Icons.business,
          color: Color.fromARGB(255, 13, 77, 150),
          size: 32,
        ),
        title: Text(
          state.companies[i].name,
          style: const TextStyle(
              color: Color.fromARGB(255, 13, 77, 150),
              fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ),
    );
  }
}
