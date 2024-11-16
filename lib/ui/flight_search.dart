import 'package:flight_booking/common/date_picker_widget.dart';
import 'package:flight_booking/ui/ezy_travel.dart';
import 'package:flutter/material.dart';

enum TripType { oneWay, roundTrip, multiCity }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime departureDate = DateTime.now();
  DateTime returnDate = DateTime.now();
  int travelers = 1;
  String cabinClass = 'Economy Class';
  late TripType myTripType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myTripType = TripType.oneWay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search Flights',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            IconButton(onPressed: () => {}, icon: const Icon(Icons.menu))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      "assets/images/mask_group.png",
                      width: double.infinity,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Let's Start Trip",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => setState(() {
                                myTripType = TripType.roundTrip;
                              }),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  backgroundColor:
                                      myTripType == TripType.roundTrip
                                          ? Colors.green
                                          : Colors.white),
                              child: Text(
                                'Round Trip',
                                style: TextStyle(
                                    color: myTripType == TripType.roundTrip
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => setState(() {
                                myTripType = TripType.oneWay;
                              }),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  backgroundColor: myTripType == TripType.oneWay
                                      ? Colors.green
                                      : Colors.white),
                              child: Text(
                                'One way',
                                style: TextStyle(
                                    color: myTripType == TripType.oneWay
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => setState(() {
                                myTripType = TripType.multiCity;
                              }),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  backgroundColor:
                                      myTripType == TripType.multiCity
                                          ? Colors.green
                                          : Colors.white),
                              child: Text(
                                'Multi city',
                                style: TextStyle(
                                    color: myTripType == TripType.multiCity
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white),
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.only(
                      left: 8, right: 18, bottom: 24, top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Transform.rotate(
                                      angle: 45,
                                      child: const Icon(Icons.flight,
                                          color: Color(0xFF63AF23)),
                                    )),
                                const Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'From'),
                                    )),
                              ],
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 50, right: 50),
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.greenAccent.shade200,
                                    Colors.greenAccent.shade100
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Icon(Icons.location_on,
                                        color: Color(0xFF63AF23))),
                                Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'To'),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                            color: const Color(0xFFECF2E7),
                            borderRadius: BorderRadius.circular(120)),
                        child: Image.asset('assets/images/revert_icon.png'),
                        // child: IconButton(
                        //     onPressed: () => {},
                        //     icon: const Icon.as(
                        //       Icons.swap_vert,
                        //       color: Color(0xFF63AF23),
                        //     )),
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DatePickerWidget(
                          label: 'Depature',
                          selectedDate: departureDate,
                          onDateChanged: (date) {
                            setState(() {
                              departureDate = date;
                            });
                          }),
                      const SizedBox(
                        width: 8,
                      ),
                      DatePickerWidget(
                          isOneWay: myTripType == TripType.oneWay,
                          label: 'Return',
                          selectedDate: returnDate,
                          onDateChanged: (date) {
                            setState(() {
                              returnDate = date;
                            });
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Container(
                                height: 50,
                                margin: EdgeInsets.only(top: 7),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey[400]!),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    value: travelers,
                                    isExpanded: true,
                                    items: List.generate(
                                            4, (index) => index + 1)
                                        .map((value) => DropdownMenuItem<int>(
                                              value: value,
                                              child: Text(
                                                  '$value Passenger${value > 1 ? 's' : ''}'),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        travelers = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -7,
                                left: 10,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 2, bottom: 2),
                                  color: const Color(0xffE9F0E4),
                                  child: Text('Travelers',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14)),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Container(
                                height: 50,
                                margin: const EdgeInsets.only(top: 7),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey[400]!),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: null,
                                    value: cabinClass,
                                    isExpanded: true,
                                    items: [
                                      'Economy Class',
                                      'Business Class',
                                      'First Class'
                                    ]
                                        .map((classType) =>
                                            DropdownMenuItem<String>(
                                              value: classType,
                                              child: Text(classType),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        cabinClass = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -7,
                                left: 10,
                                child: Container(
                                  color: const Color(0xffE9F0E4),
                                  padding: const EdgeInsets.only(
                                      top: 2, bottom: 2, left: 5, right: 5),
                                  child: Text('Cabin Class',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14)),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EzyTravel(),
                      ))
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "Search Flights",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 352,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Travel Inspirations',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          TextButton.icon(
                            iconAlignment: IconAlignment.end,
                            label: const Text(
                              'Dubai',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2D2D2D)),
                            ),
                            onPressed: () => {},
                            icon: const Icon(
                              size: 15,
                              Icons.keyboard_arrow_down,
                              color: Color(0xff63AF23),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return _buildInspirationCard(
                                index == 0 ? 'Saudi Arabia' : 'Kuwait');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 313,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Flight & Hotel Packages',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 390,
                              height: 313,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/packages_1.png',
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Widget _buildInspirationCard(String destination) {
  return Container(
    width: 220,
    height: 310,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/${destination == 'Saudi Arabia' ? 'travel_1.png' : 'travel_2.png'}',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'From AED867',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                'Economy round trip',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                destination,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
