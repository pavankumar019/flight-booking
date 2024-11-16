import 'package:flight_booking/common/dashed_line_widget.dart';
import 'package:flight_booking/common/flight_info_card.dart';
import 'package:flutter/material.dart';

class FlightDuoWidget extends StatelessWidget {
  const FlightDuoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FlightInfoCard(
              logoPath: 'assets/images/garuda-logo.png',
              flightDescription: 'Onward - Garuda Indonesia',
              price: 'AED 409',
              departureTime: '14:35',
              departureLocation: 'BLR - Bengaluru',
              arrivalTime: '21:55',
              arrivalLocation: 'DXB - Dubai',
              duration: '4h 30m',
              stops: '2 Stops',
            ),
            const SizedBox(height: 16),
            const Divider(),
            const FlightInfoCard(
              logoPath: 'assets/images/garuda-logo.png',
              flightDescription: 'Return - Garuda Indonesia',
              price: 'AED 359',
              departureTime: '21:55',
              departureLocation: 'DXB - Dubai',
              arrivalTime: '14:35',
              arrivalLocation: 'BLR - Bengaluru',
              duration: '4h 30m',
              stops: '',
            ),
            const SizedBox(height: 16),
            // const Divider(),
            const DashedLine(
              color: Colors.grey,
              dashSpace: 5,
              dashWidth: 5,
              height: 1.5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(9)),
                              child: Text('Cheapest',
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 9))),
                          const SizedBox(width: 16),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue.shade800,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(9)),
                              child: Text('Refundable',
                                  style: TextStyle(
                                      color: Colors.blue[800], fontSize: 9))),
                        ],
                      ),
                    ),
                    TextButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0XFFFA7927),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, elevation: 0),
                      label: const Text('Flight Details',
                          style: TextStyle(
                              fontSize: 12, color: Color(0XFFFA7927))),
                    )
                  ]),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
