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
    return SizedBox(
      height: 63,
      child: Column(
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
                margin: const EdgeInsets.only(top: 9),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: isOneWay
                          ? const Color(0xffE9F0E4)
                          : Colors.grey[400]!),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(DateFormat('E,d MMM - y').format(selectedDate),
                        style: TextStyle(
                            fontSize: 15,
                            color: isOneWay ? const Color(0xffD4D4D4) : null)),
                    Icon(
                      Icons.calendar_today,
                      color: isOneWay
                          ? const Color(0xffD4D4D4)
                          : const Color(0xff49454F),
                      size: 18,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -2,
                left: 14,
                child: Container(
                  height: 18,
                  alignment: Alignment.center,
                  color: isOneWay
                      ? const Color(0xffD4D4D4)
                      : const Color(0xffE9F0E4),
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 3, bottom: 3),
                  child: Center(
                    child: Text(label,
                        style: TextStyle(
                            color:
                                isOneWay ? Color(0xffB5B5B5) : Colors.grey[600],
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
