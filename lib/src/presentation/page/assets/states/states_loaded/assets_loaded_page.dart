import 'package:assets_follow_up/src/domain/enum/tree_item_type_filter_enum.dart';
import 'package:assets_follow_up/src/presentation/page/assets/assets_bloc.dart';
import 'package:assets_follow_up/src/presentation/page/assets/states/states_loaded/widget/asset_tree_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetsLoadedPage extends StatefulWidget {
  final AssetsLoadedState state;

  const AssetsLoadedPage(this.state, {super.key});

  @override
  State<AssetsLoadedPage> createState() => _AssetsLoadedPageState();
}

class _AssetsLoadedPageState extends State<AssetsLoadedPage> {
  final TextEditingController _searchEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  child: TextField(
                    controller: _searchEC,
                    onChanged: (e) =>
                        context.read<AssetsBloc>().onTextSearchChange(e),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Buscar Ativo ou Local',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFEAEFF3),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.maxFinite,
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: TreeItemTypeFilter.values.length,
                  separatorBuilder: (_, i) => const SizedBox(width: 8),
                  itemBuilder: (_, i) {
                    bool isSelected =
                        widget.state.filter == TreeItemTypeFilter.values[i];
                    return InkWell(
                      onTap: () => _
                          .read<AssetsBloc>()
                          .onTreeItemTypeFilterChange(
                              TreeItemTypeFilter.values[i]),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: isSelected
                              ? const Color(0xFF004C96)
                              : Colors.white,
                          border: Border.all(color: const Color(0xFFD8DFE6)),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            Icon(
                              TreeItemTypeFilter.values[i].icon,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF77818C),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              TreeItemTypeFilter.values[i].label,
                              style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF77818C)),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: widget.state.tree
                  .map((e) => AssetTreeItemWidget(item: e))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
