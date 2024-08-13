// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:assets_follow_up/src/data/data_source/company_data_source.dart'
    as _i641;
import 'package:assets_follow_up/src/data/repository/company_repository_impl.dart'
    as _i564;
import 'package:assets_follow_up/src/di/inejctable_module.dart' as _i391;
import 'package:assets_follow_up/src/domain/repository/company_repository.dart'
    as _i788;
import 'package:assets_follow_up/src/domain/use_case/get_company_tree_snapshot_use_case.dart'
    as _i172;
import 'package:assets_follow_up/src/domain/use_case/get_company_tree_use_case.dart'
    as _i680;
import 'package:assets_follow_up/src/presentation/page/assets/assets_bloc.dart'
    as _i946;
import 'package:assets_follow_up/src/presentation/page/company/companies_bloc.dart'
    as _i654;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio);
    gh.factory<_i172.GetCompanyTreeSnapshotUseCase>(
        () => _i172.GetCompanyTreeSnapshotUseCaseImpl());
    gh.factory<_i641.CompanyDataSource>(
        () => _i641.CompanyDataSourceDioImpl(dio: gh<_i361.Dio>()));
    gh.factory<_i788.CompanyRepository>(() => _i564.CompanyRepositoryImpl(
        companyDataSource: gh<_i641.CompanyDataSource>()));
    gh.factory<_i680.GetCompanyTreeUseCase>(() =>
        _i680.GetCompanyTreeUseCaseImpl(
            companyRepository: gh<_i788.CompanyRepository>()));
    gh.factory<_i654.CompaniesBloc>(() =>
        _i654.CompaniesBloc(companyRepository: gh<_i788.CompanyRepository>()));
    gh.factory<_i946.AssetsBloc>(() => _i946.AssetsBloc(
          getCompanyTreeUseCase: gh<_i680.GetCompanyTreeUseCase>(),
          getCompanyTreeSnapshotUseCase:
              gh<_i172.GetCompanyTreeSnapshotUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i391.InjectableModule {}
