import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_component_entity.dart';
import 'package:assets_follow_up/src/domain/enum/tree_item_type_enum.dart';
import 'package:assets_follow_up/src/domain/enum/tree_item_type_filter_enum.dart';
import 'package:assets_follow_up/src/domain/extension/string_extension.dart';
import 'package:assets_follow_up/src/domain/use_case/get_company_tree_snapshot_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/tree_item/tree_item_entity.dart';
import '../../../domain/use_case/get_company_tree_use_case.dart';

class AssetsState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AssetsLoadingState extends AssetsState {}

class AssetsErrorState extends AssetsState {
  final String message;
  AssetsErrorState({required this.message});
}

class AssetsLoadedState extends AssetsState {
  final List<TreeItemEntity> tree;
  final TreeItemTypeFilter? filter;
  final String? search;

  AssetsLoadedState({required this.tree, this.filter, this.search});
}

@Injectable()
class AssetsBloc extends Cubit<AssetsState> {
  final GetCompanyTreeUseCase getCompanyTreeUseCase;
  final GetCompanyTreeSnapshotUseCase getCompanyTreeSnapshotUseCase;

  AssetsBloc(
      {required this.getCompanyTreeUseCase,
      required this.getCompanyTreeSnapshotUseCase})
      : super(AssetsLoadingState());

  late List<TreeItemEntity> _tree;

  Future<void> onCubitInit({required String companyId}) async {
    await getAssets(companyId);
  }

  Future<void> getAssets(String companyId) async {
    try {
      final companies = await getCompanyTreeUseCase(companyId: companyId);
      _tree = getCompanyTreeSnapshotUseCase(tree: companies);
      emit(AssetsLoadedState(tree: companies));
    } catch (e) {
      emit(AssetsErrorState(message: e.toString()));
    }
  }

  void onTextSearchChange(String search) {
    final currentState = state as AssetsLoadedState;
    getTreeFiltered(getCompanyTreeSnapshotUseCase(tree: _tree),
        search: search, filter: currentState.filter);
  }

  void onTreeItemTypeFilterChange(TreeItemTypeFilter filter) {
    final currentState = state as AssetsLoadedState;
    getTreeFiltered(getCompanyTreeSnapshotUseCase(tree: _tree),
        filter: filter, search: currentState.search);
  }

  void getTreeFiltered(List<TreeItemEntity> tree,
      {String? search, TreeItemTypeFilter? filter}) {
    final filteredTree =
        treeRemoveWhere(tree, filter: filter, search: search)
            .toList();
    filteredTree.removeWhere((e) => e.childrens.isEmpty);
    emit(AssetsLoadedState(tree: filteredTree, filter: filter, search: search));
  }

  List<TreeItemEntity> treeRemoveWhere(List<TreeItemEntity> tree,
      {String? search, TreeItemTypeFilter? filter}) {
    for (TreeItemEntity item in tree) {
      treeRemoveWhere(item.childrens, filter: filter, search: search);
      item.childrens.removeWhere((e) => e.type == TreeItemTypeEnum.component
          ? removeWhere(e as TreeComponentEntity,
              search: search, filter: filter)
          : e.childrens.isEmpty);
    }
    return tree;
  }

  bool removeWhere(TreeComponentEntity item,
      {String? search, TreeItemTypeFilter? filter}) {
    bool remove = false;
    if (filter != null) {
      switch (filter) {
        case TreeItemTypeFilter.critical:
          if (item.status != 'alert') {
            remove = true;
          }
          break;
        case TreeItemTypeFilter.energySensor:
          if (item.sensorType != 'energy') {
            remove = true;
          }
          break;
      }
    }
    if (!remove) {
      if (search?.isNotEmpty ?? false) {
        remove = !item.name.toCompare().contains(search!.toCompare());
      }
    }

    return remove;
  }
}
