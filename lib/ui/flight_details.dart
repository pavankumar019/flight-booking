import 'package:flight_booking/colors.dart';
import 'package:flight_booking/ui/main_component.dart';
import 'package:flutter/material.dart';

class EzyTravel extends StatelessWidget {
  const EzyTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ezy Travel',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'BLR - Bengaluru to DXB - Dubai',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Departure: Sat, 23 Mar - Return: Sat, 23 Mar',
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '(Round Trip)',
                            style: TextStyle(color: Color(0xFFFF5722)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Modify Search',
                            style: TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sort',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                          )
                        ],
                      ),
                      Text(
                        'Non - Stop',
                        style: TextStyle(),
                      ),
                      Row(
                        children: [
                          Text(
                            'Filter',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.tune,
                            size: 17,
                            color: Color(0xff898989),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 55,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 4,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mar 23 - Mar 24',
                          style: TextStyle(
                            color: Color(0Xff434343),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      Text(
                        'From AED 741',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0Xff434343),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 6),
            child: Row(
              children: [
                Text(
                  '851 Flight Found',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const MainComponent();
              },
            ),
          )
        ]),
      ),
    );
  }
}
