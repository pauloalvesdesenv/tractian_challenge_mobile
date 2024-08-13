import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_location_entity.dart';
import 'package:assets_follow_up/src/presentation/page/assets/widgets/asset_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class AssetTreeLocationWidget extends StatelessWidget {
  final TreeLocationEntity location;
  const AssetTreeLocationWidget({required this.location, super.key});

  @override
  Widget build(BuildContext context) {
    return AssetExpansionTile(
      title: location.name,
      icon: Symbols.location_on,
      itens: location.childrens,
      hasParent: location.parentId != null,
    );
  }
}
