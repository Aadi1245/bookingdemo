import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final String serviceName;
  final String route;
  final String busType;
  final DateTime journeyDate;
  final String boardingTime;
  final String boardingPoint;
  final String droppingTime;
  final String droppingPoint;
  final List<Map<String, dynamic>> passengers;
  final String phoneNumber;
  final double basicFare;
  final double reservation;
  final double rounding;
  final double totalFare;

  const TicketCard({
    super.key,
    required this.serviceName,
    required this.route,
    required this.busType,
    required this.journeyDate,
    required this.boardingTime,
    required this.boardingPoint,
    required this.droppingTime,
    required this.droppingPoint,
    required this.passengers,
    required this.phoneNumber,
    required this.basicFare,
    required this.reservation,
    required this.rounding,
    required this.totalFare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Service Name and Route
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  serviceName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  route,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          // Journey Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Boarding',
                    style: TextStyle(color: Colors.blue[600], fontSize: 14.0),
                  ),
                  Text(
                    boardingPoint,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    boardingTime,
                    style: TextStyle(color: Colors.blue[600], fontSize: 14.0),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.blue[600],
                size: 24.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Dropping',
                    style: TextStyle(color: Colors.blue[600], fontSize: 14.0),
                  ),
                  Text(
                    droppingPoint,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    droppingTime,
                    style: TextStyle(color: Colors.blue[600], fontSize: 14.0),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          // Bus Type and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bus Type',
                style: TextStyle(color: Colors.blue[600], fontSize: 14.0),
              ),
              Text(
                busType,
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Journey Date',
                style: TextStyle(color: Colors.blue[600], fontSize: 14.0),
              ),
              Text(
                '${journeyDate.day} ${journeyDate.month} ${journeyDate.year}',
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          // Passenger Details
          Text(
            'Passenger Names',
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          ...passengers.map((passenger) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${passengers.indexOf(passenger) + 1}. ${passenger['name']}'),
                    Text('${passenger['age']}'),
                    Text(passenger['gender']),
                  ],
                ),
              )),
          const SizedBox(height: 8.0),
          Text(
            'Phone',
            style: TextStyle(color: Colors.blue[600], fontSize: 14.0),
          ),
          Text(phoneNumber),
          const SizedBox(height: 12.0),
          // Fare Details
          const Divider(color: Colors.blue, thickness: 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Basic Fare'),
              Text('₹${basicFare.toStringAsFixed(2)}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('ASN'),
              Text('₹0.00'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Reservation'),
              Text('₹${reservation.toStringAsFixed(2)}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Rounding'),
              Text('₹${rounding.toStringAsFixed(2)}'),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Fare',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '₹${totalFare.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Example usage in a screen
class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passengers = [
      {'name': 'Hiroshi Patel', 'age': 29, 'gender': 'M'},
      {'name': 'Hiroshi Patel', 'age': 15, 'gender': 'M'},
      {'name': 'Hiroshi Patel', 'age': 16, 'gender': 'F'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket'),
        backgroundColor: Colors.blue[700],
      ),
      body: TicketCard(
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
    );
  }
}
