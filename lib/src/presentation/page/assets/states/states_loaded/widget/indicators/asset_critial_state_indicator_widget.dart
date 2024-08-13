import 'package:flutter/material.dart';

class AssetCritialStateIndicatorWidget extends StatelessWidget {
  const AssetCritialStateIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.circle,
      color: Color(0xFFED3833),
      size: 12,
    );
  }
}
