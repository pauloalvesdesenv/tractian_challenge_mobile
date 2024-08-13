import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_asset_entity.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_component_entity.dart';
import 'package:assets_follow_up/src/domain/enum/tree_item_type_enum.dart';

class AssetModel {
  final String id;
  final String? locationId;
  final String name;
  final String? parentId;
  final String? sensorType;
  final String? sensorId;
  final String? status;
  final String? gatewayId;

  String? getParentId() => parentId ?? locationId;

  AssetModel({
    required this.id,
    required this.locationId,
    required this.name,
    required this.parentId,
    required this.sensorType,
    required this.sensorId,
    required this.status,
    required this.gatewayId,
  });

  factory AssetModel.fromMap(Map<String, dynamic> map) => AssetModel(
        id: map['id'],
        locationId: map['locationId'],
        name: map['name'],
        parentId: map['parentId'],
        sensorType: map['sensorType'],
        sensorId: map['sensorId'],
        status: map['status'],
        gatewayId: map['gatewayId'],
      );

  static List<AssetModel> fromAssetList(dynamic e) =>
      e.map<AssetModel>((e) => AssetModel.fromMap(e)).toList();

  TreeComponentEntity toTreeComponentEntity() => TreeComponentEntity(
        id: id,
        parentId: locationId ?? parentId,
        name: name,
        type: TreeItemTypeEnum.component,
        childrens: [],
        sensorId: sensorId!,
        sensorType: sensorType!,
        status: status!,
        gatewayId: gatewayId!,
      );

  TreeAssetEntity toTreeAssetEntity() => TreeAssetEntity(
        id: id,
        parentId: locationId ?? parentId,
        name: name,
        type: TreeItemTypeEnum.asset,
        childrens: [],
      );
}
