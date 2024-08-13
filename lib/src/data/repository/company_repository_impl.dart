import 'package:assets_follow_up/src/data/data_source/company_data_source.dart';
import 'package:assets_follow_up/src/data/model/asset_model.dart';
import 'package:assets_follow_up/src/data/model/company_model.dart';
import 'package:assets_follow_up/src/data/model/location_model.dart';
import 'package:assets_follow_up/src/domain/repository/company_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CompanyRepository)
class CompanyRepositoryImpl extends CompanyRepository {
  final CompanyDataSource companyDataSource;

  CompanyRepositoryImpl({required this.companyDataSource});

  @override
  Future<List<CompanyModel>> getCompanies() async {
    return companyDataSource.getCompanies();
  }

  @override
  Future<List<LocationModel>> getLocationsByCompanyId(
          {required String companyId}) async =>
      companyDataSource.getLocationsByCompanyId(companyId: companyId);

  @override
  Future<List<AssetModel>> getAssetsByCompanyId(
          {required String companyId}) async =>
      companyDataSource.getAssetsByCompanyId(companyId: companyId);
}
