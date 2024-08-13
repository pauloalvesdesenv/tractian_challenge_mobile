import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_entity.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_asset_entity.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_component_entity.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_location_entity.dart';
import 'package:assets_follow_up/src/domain/enum/tree_item_type_enum.dart';
import 'package:assets_follow_up/src/presentation/page/assets/states/states_loaded/widget/types/asset_tree_asset_widget.dart';
import 'package:assets_follow_up/src/presentation/page/assets/states/states_loaded/widget/types/asset_tree_component_widget.dart';
import 'package:assets_follow_up/src/presentation/page/assets/states/states_loaded/widget/types/asset_tree_location_widget.dart';
import 'package:flutter/material.dart';

class AssetTreeItemWidget extends StatelessWidget {
  final TreeItemEntity item;
  const AssetTreeItemWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    if (item.type == TreeItemTypeEnum.location) {
      return AssetTreeLocationWidget(location: item as TreeLocationEntity);
    }
    if (item.type == TreeItemTypeEnum.asset) {
      return AssetTreeAssetWidget(asset: item as TreeAssetEntity);
    }
    if (item.type == TreeItemTypeEnum.component) {
      return AssetTreeComponentWidget(component: item as TreeComponentEntity);
    }
    throw Exception();
  }
}
