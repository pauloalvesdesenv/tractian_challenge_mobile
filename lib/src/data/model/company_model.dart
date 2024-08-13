import 'package:assets_follow_up/src/domain/entity/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({required super.id, required super.name});

  factory CompanyModel.fromMap(Map<String, dynamic> map) =>
      CompanyModel(id: map['id'], name: map['name']);

  static List<CompanyModel> fromCompanyList(dynamic e) =>
      e.map<CompanyModel>((e) => CompanyModel.fromMap(e)).toList();
}
