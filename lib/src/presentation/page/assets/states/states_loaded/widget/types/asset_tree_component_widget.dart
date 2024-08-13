import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_component_entity.dart';
import 'package:assets_follow_up/src/presentation/page/assets/states/states_loaded/widget/indicators/asset_critial_state_indicator_widget.dart';
import 'package:assets_follow_up/src/presentation/page/assets/states/states_loaded/widget/indicators/asset_energy_sensor_indicator_widget.dart';
import 'package:assets_follow_up/src/presentation/page/assets/widgets/asset_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class AssetTreeComponentWidget extends StatelessWidget {
  final TreeComponentEntity component;
  const AssetTreeComponentWidget({required this.component, super.key});

  @override
  Widget build(BuildContext context) {
    return AssetExpansionTile(
      title: component.name,
      icon: Symbols.cards,
      itens: component.childrens,
      hasParent: component.parentId != null,
      trailinIcon: _getComponentIndicator(),
    );
  }

  Widget? _getComponentIndicator() {
    final row = Row(
      children: [
        if (component.status == 'alert')
          const AssetCritialStateIndicatorWidget(),
        if (component.sensorType == 'energy')
          const AssetEnergySensorIndicatorWidget()
      ],
    );
    return row.children.isNotEmpty ? row : null;
  }
}
