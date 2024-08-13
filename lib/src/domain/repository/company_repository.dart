import 'package:assets_follow_up/src/data/model/asset_model.dart';
import 'package:assets_follow_up/src/data/model/company_model.dart';
import 'package:assets_follow_up/src/data/model/location_model.dart';

abstract class CompanyRepository {
  Future<List<CompanyModel>> getCompanies();
  Future<List<LocationModel>> getLocationsByCompanyId(
      {required String companyId});
  Future<List<AssetModel>> getAssetsByCompanyId({required String companyId});
}
