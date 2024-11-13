import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const CustomButton({required this.child, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: child),
      ),
    );
  }
}
