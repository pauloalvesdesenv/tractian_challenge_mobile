import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_entity.dart';

class TreeLocationEntity extends TreeItemEntity {
  TreeLocationEntity({
    required super.id,
    required super.parentId,
    required super.name,
    required super.type,
    required super.childrens,
  });
}
