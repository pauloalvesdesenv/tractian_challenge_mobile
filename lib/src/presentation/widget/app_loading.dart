import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final String? description;

  const AppLoading({this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
            width: 32,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Color(0xFF004C96)),
            ),
          ),
          const SizedBox(height: 16),
          Text(description ?? 'Loading, wait please.'),
        ],
      ),
    );
  }
}
