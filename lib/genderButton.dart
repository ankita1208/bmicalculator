import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final String genderText;
  final IconData genderIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderButton({
    required this.genderText,
    required this.genderIcon,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Icon(
              genderIcon,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              genderText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
