import 'package:flight_booking/common/date_picker_widget.dart';
import 'package:flight_booking/common/trip_type_button.dart';
import 'package:flight_booking/ui/flight_details.dart';
import 'package:flutter/material.dart';

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
                    padding: EdgeInsets.only(left: 24, top: 19),
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
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          TripTypeButton(
                            label: 'Round Trip',
                            tripType: TripType.roundTrip,
                            selectedTripType: myTripType,
                            onPressed: () => setState(() {
                              myTripType = TripType.roundTrip;
                            }),
                          ),
                          TripTypeButton(
                            label: 'One Way',
                            tripType: TripType.oneWay,
                            selectedTripType: myTripType,
                            onPressed: () => setState(() {
                              myTripType = TripType.oneWay;
                            }),
                          ),
                          TripTypeButton(
                            label: 'Multi-City',
                            tripType: TripType.multiCity,
                            selectedTripType: myTripType,
                            onPressed: () => setState(() {
                              myTripType = TripType.multiCity;
                            }),
                          ),
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
                                Container(
                                  margin: EdgeInsets.only(left: 8.5),
                                  child: Transform.rotate(
                                    angle: 45,
                                    child: const Icon(
                                      Icons.flight,
                                      color: Color(0xFF63AF23),
                                      size: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 17,
                                ),
                                const Expanded(
                                    flex: 4,
                                    child: TextField(
                                      cursorColor: Color(0xFF63AF23),
                                      style: TextStyle(fontSize: 16),
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
                                    Color(0xFF63AF23),
                                    Color(0xFF63AF23).withAlpha(2),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Icon(
                                    Icons.location_on,
                                    color: Color(0xFF63AF23),
                                    size: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 17,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: TextField(
                                      cursorColor: Color(0xFF63AF23),
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
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: DatePickerWidget(
                            label: 'Depature',
                            selectedDate: departureDate,
                            onDateChanged: (date) {
                              setState(() {
                                departureDate = date;
                              });
                            }),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 1,
                        child: DatePickerWidget(
                            isOneWay: myTripType == TripType.oneWay,
                            label: 'Return',
                            selectedDate: returnDate,
                            onDateChanged: (date) {
                              setState(() {
                                returnDate = date;
                              });
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
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
                                  child: DropdownButton<int>(
                                    value: travelers,
                                    isExpanded: true,
                                    items: List.generate(
                                            4, (index) => index + 1)
                                        .map((value) => DropdownMenuItem<int>(
                                              value: value,
                                              child: Text(
                                                '$value Passenger${value > 1 ? 's' : ''}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
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
                                top: -3,
                                left: 14,
                                child: Container(
                                  height: 18,
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 3, bottom: 3),
                                  color: const Color(0xffE9F0E4),
                                  child: Text('Travelers',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
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
                        flex: 1,
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
                                              child: Text(classType,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500)),
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
                                top: -3,
                                left: 14,
                                child: Container(
                                  height: 18,
                                  color: const Color(0xffE9F0E4),
                                  padding: const EdgeInsets.only(
                                      top: 3, bottom: 3, left: 5, right: 5),
                                  child: Text('Cabin Class',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400)),
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
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EzyTravel(),
                      ));
                },
                child: Container(
                  height: 42,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  child: const Text(
                    'Search Flights',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
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
