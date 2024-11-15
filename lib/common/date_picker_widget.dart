import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
  final String label;
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;
  final bool isOneWay;

  const DatePickerWidget(
      {super.key,
      required this.label,
      required this.selectedDate,
      required this.onDateChanged,
      this.isOneWay = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        GestureDetector(
          onTap: isOneWay
              ? null
              : () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    onDateChanged(pickedDate);
                  }
                },
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color:
                        isOneWay ? const Color(0xffD4D4D4) : Colors.grey[400]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat('E,d MMM - y').format(selectedDate),
                      style: TextStyle(
                          fontSize: 16,
                          color: isOneWay ? const Color(0xffD4D4D4) : null)),
                  Icon(Icons.calendar_today,
                      color: isOneWay
                          ? const Color(0xffD4D4D4)
                          : const Color(0xff49454F)),
                ],
              ),
            ),
            Positioned(
              top: -6,
              left: 12,
              child: Container(
                alignment: Alignment.center,
                color: isOneWay
                    ? const Color(0xffD4D4D4)
                    : const Color(0xffE9F0E4),
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 2),
                child: Center(
                  child: Text(label,
                      style: TextStyle(
                          color:
                              isOneWay ? Color(0xffB5B5B5) : Colors.grey[600],
                          fontSize: 14)),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
