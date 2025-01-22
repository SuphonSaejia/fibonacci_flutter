import 'package:fibonacci_flutter/model/home_model.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Function()? onTap;
  final bool isSelect;
  final Color tileColor;
  final FibonacciType type;
  final String text;

  const ListItem({
    super.key,
    this.onTap,
    required this.isSelect,
    required this.tileColor,
    required this.type,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: isSelect ? tileColor : null,
      enabled: true,
      title: Text(text),
      trailing: fibonacciIcon(type),
    );
  }

  Icon fibonacciIcon(FibonacciType type) {
    switch (type) {
      case FibonacciType.even:
        return const Icon(Icons.circle);
      case FibonacciType.odd:
        return const Icon(Icons.square);
      case FibonacciType.prime:
        return const Icon(Icons.close);
      default:
        return const Icon(Icons.help_outline);
    }
  }
}
