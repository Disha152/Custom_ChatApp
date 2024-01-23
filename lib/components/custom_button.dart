import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomButton({super.key, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
  onTap: onTap,
  child: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.primary,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset:  const Offset(0, 2),
        ),
      ],
    ),
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.symmetric(horizontal: 35),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),
      ),
    ),
  ),
);

  }
}
