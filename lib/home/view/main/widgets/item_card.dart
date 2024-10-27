import 'package:flutter/material.dart';
import 'package:emo_task/core/values_manager.dart';

class CustomItem extends StatelessWidget {
  final Widget child;
  final bool isLight;

  const CustomItem({super.key, required this.child, this.isLight = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
                color: isLight ? Colors.blue.shade50 : Colors.black26),
            color:
                isLight ? Colors.white.withOpacity(0.2) : Colors.grey.shade900,
            borderRadius: BorderRadius.circular(AppSize.s20)),
        child: child);
  }
}
