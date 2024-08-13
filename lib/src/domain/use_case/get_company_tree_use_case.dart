import 'dart:developer';

import 'package:assets_follow_up/src/data/model/asset_model.dart';
import 'package:assets_follow_up/src/data/model/location_model.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_entity.dart';
import 'package:assets_follow_up/src/domain/repository/company_repository.dart';
import 'package:injectable/injectable.dart';

abstract class GetCompanyTreeUseCase {
  Future<List<TreeItemEntity>> call({required String companyId});
}

@Injectable(as: GetCompanyTreeUseCase)
class GetCompanyTreeUseCaseImpl extends GetCompanyTreeUseCase {
  final CompanyRepository companyRepository;

  GetCompanyTreeUseCaseImpl({required this.companyRepository});

  @override
  Future<List<TreeItemEntity>> call({required String companyId}) async {
    final locations =
        await companyRepository.getLocationsByCompanyId(companyId: companyId);
    final assets =
        await companyRepository.getAssetsByCompanyId(companyId: companyId);

    List<TreeItemEntity> tree = [];

    for (var location in locations.where((e) => e.parentId == null).toList()) {
      _setTreeLocationEntity(tree, location);
    }

    for (var location in locations.where((e) => e.parentId != null).toList()) {
      _setTreeLocationEntity(tree, location);
    }

    for (var asset in assets
        .where((e) =>
            e.sensorType == null && e.locationId != null && e.parentId == null)
        .toList()) {
      _setTreeAssetEntity(tree, asset);
    }

    for (var asset in assets
        .where((e) =>
            e.sensorType == null && e.locationId == null && e.parentId != null)
        .toList()) {
      _setTreeAssetEntity(tree, asset);
    }

    for (var asset in assets
        .where((e) =>
            e.sensorType != null && e.locationId != null && e.parentId == null)
        .toList()) {
      _setTreeComponentEntity(tree, asset);
    }

    for (var asset in assets
        .where((e) =>
            e.sensorType != null && e.locationId == null && e.parentId != null)
        .toList()) {
      _setTreeComponentEntity(tree, asset);
    }

    return tree;
  }

  void _setTreeLocationEntity(
      List<TreeItemEntity> tree, LocationModel location) {
    final entity = location.toLocationEntity();
    if (location.parentId == null) {
      tree.add(entity);
      return;
    }
    for (var item in tree) {
      if (location.parentId == item.id) {
        item.childrens.add(entity);
      } else {
        if (item.childrens.isNotEmpty) {
          _setTreeLocationEntity(item.childrens, location);
        }
      }
    }
  }

  void _setTreeAssetEntity(List<TreeItemEntity> tree, AssetModel asset) {
    final entity = asset.toTreeAssetEntity();
    if (asset.locationId == null && asset.parentId == null) {
      tree.add(entity);
      return;
    }
    for (var item in tree) {
      if (asset.getParentId() == item.id) {
        item.childrens.add(entity);
        break;
      } else {
        if (item.childrens.isNotEmpty) {
          _setTreeAssetEntity(item.childrens, asset);
        }
      }
    }
  }

  void _setTreeComponentEntity(
      List<TreeItemEntity> tree, AssetModel component) {
    final entity = component.toTreeComponentEntity();
    if (entity.name == 'Motor H12D- Stage 1') {
      log('herer');
    }
    if (component.locationId == null && component.parentId == null) {
      tree.add(entity);
      return;
    }
    for (var item in tree) {
      if (component.getParentId() == item.id) {
        item.childrens.add(entity);
        break;
      } else {
        if (item.childrens.isNotEmpty) {
          _setTreeComponentEntity(item.childrens, component);
        }
      }
    }
  }
}
