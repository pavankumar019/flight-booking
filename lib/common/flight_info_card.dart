import 'package:flutter/material.dart';

class FlightInfoCard extends StatelessWidget {
  final String logoPath;
  final String flightDescription;
  final String price;
  final String departureTime;
  final String departureLocation;
  final String arrivalTime;
  final String arrivalLocation;
  final String duration;
  final String stops;

  const FlightInfoCard({
    super.key,
    required this.logoPath,
    required this.flightDescription,
    required this.price,
    required this.departureTime,
    required this.departureLocation,
    required this.arrivalTime,
    required this.arrivalLocation,
    required this.duration,
    required this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                logoPath,
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(flightDescription,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                    Text(price,
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(departureTime,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                    Text(departureLocation,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(duration, style: const TextStyle(color: Colors.grey)),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                            height: 1, width: 100, color: Color(0Xff505050)),
                        Transform.rotate(
                          angle: 51.82,
                          child: const Icon(Icons.airplanemode_active,
                              color: Color(0xff63AF23), size: 20),
                        ),
                      ],
                    ),
                    Text(stops, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(arrivalTime,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                    Text(arrivalLocation,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
