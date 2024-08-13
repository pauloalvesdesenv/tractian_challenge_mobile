import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_entity.dart';

class TreeComponentEntity extends TreeItemEntity {
  final String sensorId;
  final String sensorType;
  final String status;
  final String gatewayId;

  TreeComponentEntity({
    required super.id,
    required super.parentId,
    required super.name,
    required super.type,
    required super.childrens,
    required this.sensorId,
    required this.sensorType,
    required this.status,
    required this.gatewayId,
  });
}
