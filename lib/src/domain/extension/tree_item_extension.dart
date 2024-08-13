import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_entity.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_asset_entity.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_component_entity.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_location_entity.dart';
import 'package:assets_follow_up/src/domain/enum/tree_item_type_enum.dart';

extension TreeLocationEntityExt on TreeLocationEntity {
  TreeLocationEntity copyWith({
    String? id,
    String? parentId,
    String? name,
    TreeItemTypeEnum? type,
    List<TreeItemEntity>? childrens,
  }) =>
      TreeLocationEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        childrens: childrens ?? this.childrens,
        parentId: parentId ?? this.parentId,
      );
}

extension TreeAssetEntityExt on TreeAssetEntity {
  TreeAssetEntity copyWith({
    String? id,
    String? parentId,
    String? name,
    TreeItemTypeEnum? type,
    List<TreeItemEntity>? childrens,
  }) =>
      TreeAssetEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        childrens: childrens ?? this.childrens,
        parentId: parentId ?? this.parentId,
      );
}

extension TreeComponentEntityExt on TreeComponentEntity {
  TreeComponentEntity copyWith({
    String? id,
    String? parentId,
    String? name,
    TreeItemTypeEnum? type,
    List<TreeItemEntity>? childrens,
    String? gatewayId,
    String? sensorId,
    String? sensorType,
    String? status,
  }) =>
      TreeComponentEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        childrens: childrens ?? this.childrens,
        parentId: parentId ?? this.parentId,
        gatewayId: gatewayId ?? this.gatewayId,
        sensorId: sensorId ?? this.sensorId,
        sensorType: sensorType ?? this.sensorType,
        status: status ?? this.status,
      );
}
