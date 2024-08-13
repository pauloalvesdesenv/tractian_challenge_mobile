import 'package:assets_follow_up/src/data/model/asset_model.dart';
import 'package:assets_follow_up/src/data/model/company_model.dart';
import 'package:assets_follow_up/src/data/model/location_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class CompanyDataSource {
  Future<List<CompanyModel>> getCompanies();
  Future<List<LocationModel>> getLocationsByCompanyId(
      {required String companyId});
  Future<List<AssetModel>> getAssetsByCompanyId({required String companyId});
}

@Injectable(as: CompanyDataSource)
class CompanyDataSourceDioImpl extends CompanyDataSource {
  final Dio dio;

  CompanyDataSourceDioImpl({required this.dio});

  @override
  Future<List<CompanyModel>> getCompanies() async {
    final result = await dio.get('/companies');
    return CompanyModel.fromCompanyList(result.data);
  }

  @override
  Future<List<LocationModel>> getLocationsByCompanyId(
      {required String companyId}) async {
    final result = await dio.get('/companies/$companyId/locations');
    return LocationModel.fromLocationList(result.data);
  }

  @override
  Future<List<AssetModel>> getAssetsByCompanyId(
      {required String companyId}) async {
    final result = await dio.get('/companies/$companyId/assets');
    return AssetModel.fromAssetList(result.data);
  }
}
