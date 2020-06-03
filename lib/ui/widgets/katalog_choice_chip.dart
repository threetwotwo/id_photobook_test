import 'package:flutter/material.dart';
import 'package:idphotobooktest/constants/app_colors.dart';

class KatalogChoiceChip extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback onSelected;

  const KatalogChoiceChip({
    Key key,
    @required this.label,
    @required this.isSelected,
    @required this.onSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orangePeel : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
              color: isSelected ? Colors.transparent : Colors.grey, width: 2),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: isSelected ? Colors.white : Colors.grey),
          ),
        ),
      ),
    );
  }
}
