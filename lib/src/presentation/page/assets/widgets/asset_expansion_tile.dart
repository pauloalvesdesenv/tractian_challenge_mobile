import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_entity.dart';
import 'package:assets_follow_up/src/presentation/page/assets/states/states_loaded/widget/asset_tree_item_widget.dart';
import 'package:flutter/material.dart';

class AssetExpansionTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<TreeItemEntity> itens;
  final bool hasParent;
  final Widget? trailinIcon;

  const AssetExpansionTile({
    required this.title,
    required this.icon,
    required this.itens,
    required this.hasParent,
    this.trailinIcon,
    super.key,
  });

  @override
  State<AssetExpansionTile> createState() => _AssetExpansionTileState();
}

class _AssetExpansionTileState extends State<AssetExpansionTile> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => isOpen = !isOpen),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                if (!widget.hasParent ||
                    (widget.hasParent && widget.itens.isNotEmpty))
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        isOpen
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        size: 18,
                      ),
                      if (isOpen && widget.itens.isNotEmpty)
                        Positioned(
                          bottom: 0,
                          child: Container(
                            transform: Matrix4.translationValues(0, 13, 0),
                            width: 1,
                            height: 16,
                            color: Colors.grey[400],
                          ),
                        )
                    ],
                  ),
                if (widget.itens.isEmpty && widget.hasParent)
                  Container(
                    transform: Matrix4.translationValues(-8, 8, 0),
                    width: 12,
                    height: 25,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[400]!))),
                  ),
                const SizedBox(width: 2),
                Icon(
                  widget.icon,
                  size: 26,
                  color: const Color(0xFF14142E),
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: Row(
                  children: [
                    Text(widget.title),
                    if (widget.trailinIcon != null) const SizedBox(width: 6),
                    widget.trailinIcon ?? const SizedBox.shrink()
                  ],
                )),
              ],
            ),
          ),
        ),
        if (isOpen)
          Row(
            children: [
              const SizedBox(width: 16.5),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border(left: BorderSide(color: Colors.grey[400]!))),
                  child: Column(
                    children: widget.itens
                        .map((e) => AssetTreeItemWidget(item: e))
                        .toList(),
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}
