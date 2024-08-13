import 'package:assets_follow_up/src/presentation/page/assets/assets_bloc.dart';
import 'package:flutter/material.dart';

class AssetsErrorPage extends StatelessWidget {
  final AssetsErrorState state;

  const AssetsErrorPage(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(state.message);
  }
}
