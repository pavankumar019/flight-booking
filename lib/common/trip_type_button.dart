import 'package:flutter/material.dart';

enum TripType { oneWay, roundTrip, multiCity }

class TripTypeButton extends StatelessWidget {
  final String label;
  final TripType tripType;
  final TripType selectedTripType;
  final VoidCallback onPressed;

  const TripTypeButton({
    super.key,
    required this.label,
    required this.tripType,
    required this.selectedTripType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = tripType == selectedTripType;

    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
