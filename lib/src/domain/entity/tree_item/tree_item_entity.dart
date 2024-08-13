import 'package:assets_follow_up/src/domain/enum/tree_item_type_enum.dart';

class TreeItemEntity {
  final String id;
  final String? parentId;
  final String name;
  final TreeItemTypeEnum type;
  List<TreeItemEntity> childrens;
  TreeItemEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.childrens,
    required this.parentId,
  });
}
