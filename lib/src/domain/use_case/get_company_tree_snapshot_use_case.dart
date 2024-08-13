import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_entity.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_asset_entity.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_component_entity.dart';
import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_location_entity.dart';
import 'package:assets_follow_up/src/domain/enum/tree_item_type_enum.dart';
import 'package:assets_follow_up/src/domain/extension/tree_item_extension.dart';
import 'package:injectable/injectable.dart';

abstract class GetCompanyTreeSnapshotUseCase {
  List<TreeItemEntity> call({required List<TreeItemEntity> tree});
}

@Injectable(as: GetCompanyTreeSnapshotUseCase)
class GetCompanyTreeSnapshotUseCaseImpl extends GetCompanyTreeSnapshotUseCase {
  GetCompanyTreeSnapshotUseCaseImpl();

  @override
  List<TreeItemEntity> call({required List<TreeItemEntity> tree}) {
    return getCopyWith(tree);
  }

  List<TreeItemEntity> getCopyWith(List<TreeItemEntity> tree) {
    return tree
        .map((e) => switch (e.type) {
              TreeItemTypeEnum.location => (e as TreeLocationEntity)
                  .copyWith(childrens: getCopyWith(e.childrens)),
              TreeItemTypeEnum.asset => (e as TreeAssetEntity)
                  .copyWith(childrens: getCopyWith(e.childrens)),
              TreeItemTypeEnum.component => (e as TreeComponentEntity)
                  .copyWith(childrens: getCopyWith(e.childrens)),
            })
        .toList();
  }
}
