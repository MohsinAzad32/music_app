import 'package:flutter/material.dart';

class Neubox extends StatelessWidget {
  final Widget child;
  const Neubox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      padding: EdgeInsets.all(12.0),
      child: child,
    );
  }
}
