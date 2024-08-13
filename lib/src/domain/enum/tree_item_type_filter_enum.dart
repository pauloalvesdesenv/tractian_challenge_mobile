import 'package:flutter/material.dart';

enum TreeItemTypeFilter {
  energySensor,
  critical,
}

extension TreeItemTypeFilterEnumExt on TreeItemTypeFilter {
  String get label {
    switch (this) {
      case TreeItemTypeFilter.energySensor:
        return 'Sensor de Energia';
      case TreeItemTypeFilter.critical:
        return 'Crítico';
    }
  }

  IconData get icon {
    switch (this) {
      case TreeItemTypeFilter.energySensor:
        return Icons.bolt;
      case TreeItemTypeFilter.critical:
        return Icons.error;
    }
  }
}
