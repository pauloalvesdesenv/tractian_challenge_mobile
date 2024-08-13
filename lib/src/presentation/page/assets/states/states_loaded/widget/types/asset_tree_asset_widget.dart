import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_asset_entity.dart';
import 'package:assets_follow_up/src/presentation/page/assets/widgets/asset_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class AssetTreeAssetWidget extends StatelessWidget {
  final TreeAssetEntity asset;
  const AssetTreeAssetWidget({required this.asset, super.key});

  @override
  Widget build(BuildContext context) {
    return AssetExpansionTile(
      title: asset.name,
      icon: Symbols.deployed_code,
      itens: asset.childrens,
      hasParent: asset.parentId != null,
    );
  }
}
