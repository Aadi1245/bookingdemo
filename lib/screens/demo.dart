import 'package:demoappfortest/screens/ticket_card.dart';
import 'package:demoappfortest/screens/tickets_card.dart';
import 'package:demoappfortest/utils/app_colors.dart';
import 'package:demoappfortest/widgets/receipt_card.dart';
import 'package:dotted_line/dotted_line.dart';
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
      backgroundColor: AppColors.neutral100,
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
            // SizedBox(height: 16),
            // TicketWidget(),
            SizedBox(height: 16),

            BusReceiptWidget(
              phoneNumber: "+91 9876543210",
              boardingTime: "10:00 AM",
              droppingTime: "02:00 PM",
              totalSeats: "2",
              seatNumbers: "15,16",
              busType: "Ordinary",
              journeyDate: "25/02/2025",
              busServiceName: 'Bus Service Name',
              route: 'Pandharpur to Mumbai Central via Swargate',
              boardingPoint: 'Swargate',
              droppingPoint: 'Mumbai Central',
              // ... other parameters
              passengers: [
                PassengerInfo(name: 'John Doe', age: 30, gender: 'M'),
              ],
              onHomePressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
              onDownloadPressed: () => {/* Download logic */},
              basicFare: 562.80,
              reservation: 2.00,
              rounding: -0.80,
              totalFare: 574.00,
              isReceipt: true,
            ),
            // Column(
            //   children: [
            //     Container(
            //       width: double.infinity,
            //       // padding: const EdgeInsets.all(5.0),
            //       margin: const EdgeInsets.symmetric(horizontal: 12.0),
            //       decoration: BoxDecoration(
            //         color: AppColors.primaryBlue,
            //         borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(10),
            //             topRight: Radius.circular(10),
            //             bottomLeft: Radius.circular(-20),
            //             bottomRight: Radius.circular(-20)),
            //         // boxShadow: [
            //         //   BoxShadow(
            //         //     color: Colors.grey.withOpacity(0.5),
            //         //     spreadRadius: 2,
            //         //     blurRadius: 5,
            //         //     offset: const Offset(0, 3),
            //         //   ),
            //         // ],
            //       ),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(5.0),
            //             child: Center(
            //               child: Text(
            //                 'Receipt',
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                     color: AppColors.neutral100,
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 5.0, top: 2.0),
            //             child: Text(
            //               'Bus Service Name',
            //               textAlign: TextAlign.left,
            //               style: TextStyle(
            //                   color: AppColors.neutral100, fontSize: 12),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 5.0, top: 2.0),
            //             child: Text(
            //               'Pune to Mumbai Central via Swargate ',
            //               textAlign: TextAlign.left,
            //               maxLines: 2,
            //               overflow: TextOverflow.ellipsis,
            //               style: TextStyle(
            //                   color: AppColors.neutral100,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(
            //                 left: 5.0, top: 2.0, right: 5.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   'Boarding',
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(
            //                     color: AppColors.neutral100,
            //                     fontSize: 12,
            //                   ),
            //                 ),
            //                 Text(
            //                   'Droping',
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(
            //                     color: AppColors.neutral100,
            //                     fontSize: 12,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(
            //                 left: 5.0, top: 2.0, right: 5.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   'Boarding',
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(
            //                       color: AppColors.neutral100,
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //                 Text(
            //                   "------->",
            //                   style: TextStyle(
            //                       color: AppColors.neutral100, fontSize: 12),
            //                 ),
            //                 Text(
            //                   'Droping',
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(
            //                       color: AppColors.neutral100,
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Row(
            //             children: [
            //               Container(
            //                 height: 10,
            //                 width: 10,
            //                 decoration: BoxDecoration(
            //                   color: AppColors.neutral100,
            //                   borderRadius: BorderRadius.only(
            //                       // topLeft: Radius.circular(10),
            //                       topRight: Radius.circular(15)),
            //                 ),
            //               ),
            //               Spacer(),
            //               Container(
            //                 height: 10,
            //                 width: 10,
            //                 decoration: BoxDecoration(
            //                   color: AppColors.neutral100,
            //                   borderRadius: BorderRadius.only(
            //                     topLeft: Radius.circular(15),
            //                   ),
            //                 ),
            //               )
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //     DottedLine(
            //       direction: Axis.horizontal,
            //       lineLength: 280.0,
            //       lineThickness: 1.0,
            //       dashLength: 6.0,
            //       dashColor: Colors.black,
            //       dashRadius: 0.0,
            //       dashGapLength: 4.0,
            //     ),
            //     Container(
            //       width: double.infinity,
            //       // padding: const EdgeInsets.all(5.0),
            //       margin: const EdgeInsets.symmetric(horizontal: 12.0),
            //       decoration: BoxDecoration(
            //         color: Colors.grey.withOpacity(0.2),
            //         borderRadius: BorderRadius.only(
            //             bottomLeft: Radius.circular(10),
            //             bottomRight: Radius.circular(10)),
            //         // boxShadow: [
            //         //   BoxShadow(
            //         //     color: Colors.grey.withOpacity(0.5),
            //         //     spreadRadius: 2,
            //         //     blurRadius: 5,
            //         //     offset: Offset(0, 3),
            //         //   ),
            //         // ],
            //       ),
            //       child: Column(
            //         children: [
            //           Row(
            //             children: [
            //               Container(
            //                 height: 10,
            //                 width: 10,
            //                 decoration: BoxDecoration(
            //                   color: AppColors.neutral100,
            //                   borderRadius: BorderRadius.only(
            //                       // topLeft: Radius.circular(10),
            //                       bottomRight: Radius.circular(15)),
            //                 ),
            //               ),
            //               Spacer(),
            //               Container(
            //                 height: 10,
            //                 width: 10,
            //                 decoration: BoxDecoration(
            //                   color: AppColors.neutral100,
            //                   borderRadius: BorderRadius.only(
            //                     bottomLeft: Radius.circular(15),
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 'Bus Type',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral400,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 'Journey Date',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral400,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 'Ordinary',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 '19 February 2025',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           const SizedBox(height: 10),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 'Boiarding Time',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral400,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 'Droping Time',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral400,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 '01:48',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 '06:00',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           const SizedBox(height: 10),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 'Total Seats',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral400,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 'Seat No.',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral400,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 '2',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 '15,16',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(5.0),
            //             child: DottedLine(
            //               direction: Axis.horizontal,
            //               lineLength: 280.0,
            //               lineThickness: 1.0,
            //               dashLength: 6.0,
            //               dashColor: AppColors.neutral500,
            //               dashRadius: 0.0,
            //               dashGapLength: 4.0,
            //             ),
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 'Passenger Name',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral400,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 'Age',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral400,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 'Gender',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral400,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 '1. Hiroshi Patel',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 '29',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 'M',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 '2. Laura Patel',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 '32',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 'F',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(5.0),
            //             child: DottedLine(
            //               direction: Axis.horizontal,
            //               lineLength: 280.0,
            //               lineThickness: 1.0,
            //               dashLength: 6.0,
            //               dashColor: AppColors.neutral500,
            //               dashRadius: 0.0,
            //               dashGapLength: 4.0,
            //             ),
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 'Phone',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral400,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 '+91 9876543210',
            //                 textAlign: TextAlign.left,
            //                 style: TextStyle(
            //                     color: AppColors.neutral900,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(5.0),
            //             child: DottedLine(
            //               direction: Axis.horizontal,
            //               lineLength: 280.0,
            //               lineThickness: 1.0,
            //               dashLength: 6.0,
            //               dashColor: AppColors.primaryBlue,
            //               dashRadius: 0.0,
            //               dashGapLength: 4.0,
            //             ),
            //           ),
            //           Center(
            //             child: Icon(size: 150, Icons.qr_code),
            //           )
            //         ],
            //       ),
            //     ),
            //     const SizedBox(height: 20),
            //     Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Expanded(
            //               child: ElevatedButton(
            //                   onPressed: () {},
            //                   child: Text(
            //                     "Home Page",
            //                     style: TextStyle(color: AppColors.primaryBlue),
            //                   ))),
            //           Expanded(
            //             child: ElevatedButton(
            //                 style: ButtonStyle(
            //                   backgroundColor: MaterialStateProperty.all<Color>(
            //                       AppColors.primaryBlue),
            //                 ),
            //                 onPressed: () {},
            //                 child: Text("Download",
            //                     style: TextStyle(color: AppColors.neutral50))),
            //           )
            //         ],
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
