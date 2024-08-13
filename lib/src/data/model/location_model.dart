import 'package:assets_follow_up/src/domain/entity/tree_item/tree_item_types/tree_location_entity.dart';
import 'package:assets_follow_up/src/domain/enum/tree_item_type_enum.dart';

class LocationModel {
  final String id;
  final String name;
  final String? parentId;

  LocationModel({required this.id, required this.name, required this.parentId});

  factory LocationModel.fromMap(Map<String, dynamic> map) => LocationModel(
        id: map['id'],
        name: map['name'],
        parentId: map['parentId'],
      );

  static List<LocationModel> fromLocationList(dynamic e) =>
      e.map<LocationModel>((e) => LocationModel.fromMap(e)).toList();

  TreeLocationEntity toLocationEntity() => TreeLocationEntity(
      id: id,
      parentId: parentId,
      name: name,
      type: TreeItemTypeEnum.location,
      childrens: []);
}
