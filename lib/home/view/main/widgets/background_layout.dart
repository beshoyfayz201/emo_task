import 'package:flutter/material.dart';

class BackGroundLayout extends StatelessWidget {
  final Widget child;
  final bool isLight;
  const BackGroundLayout(
      {super.key, required this.child, required this.isLight});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: isLight
              ? const LinearGradient(colors: [
                  Color.fromARGB(156, 93, 137, 226),
                  Color.fromARGB(156, 36, 137, 238)
                ], begin: Alignment.topCenter)
              : const LinearGradient(
                  colors: [Colors.black, Colors.black],
                  begin: Alignment.topCenter)),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
