import 'package:demoappfortest/screens/ticket_card.dart';
import 'package:demoappfortest/screens/tickets_card.dart';
import 'package:demoappfortest/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final passengers = [
    {'name': 'Hiroshi Patel', 'age': 29, 'gender': 'M'},
    {'name': 'Hiroshi Patel', 'age': 15, 'gender': 'M'},
    {'name': 'Hiroshi Patel', 'age': 16, 'gender': 'F'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Screen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This is a demo screen for registering a widget.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TicketCard(
              serviceName: 'Bus Service Name',
              route: 'Pune to Mumbai Central via Swargate',
              busType: 'Ordinary',
              journeyDate: DateTime(2025, 2, 19),
              boardingTime: '01:48',
              boardingPoint: 'Swargate',
              droppingTime: '06:00',
              droppingPoint: 'Mumbai Central',
              passengers: passengers,
              phoneNumber: '+91 9876543210',
              basicFare: 562.80,
              reservation: 2.00,
              rounding: -0.80,
              totalFare: 574.00,
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(-20),
                    bottomRight: Radius.circular(-20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bus Service Name',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: AppColors.neutral100, fontSize: 12),
                  ),
                  Text(
                    'Pune to Mumbai Central via Swargate',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: AppColors.neutral100,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Boarding: Swargate',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: AppColors.neutral100,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: AppColors.neutral100,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.neutral100,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
