import 'package:flutter/material.dart';

class AppRadioButton extends StatelessWidget {
  final bool isSelected;
  const AppRadioButton({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? const Color(0xFF28AF6E) : Colors.transparent,
        border: Border.all(
          color: isSelected
              ? const Color(0xFF28AF6E)
              : Colors.white.withAlpha(100),
          width: 2,
        ),
      ),
      child: isSelected
          ? const Icon(Icons.circle, color: Colors.white, size: 12)
          : null,
    );
  }
}
