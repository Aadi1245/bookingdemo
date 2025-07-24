import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bus Service Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.blue,
                  child: Text(
                    'Pandhapur to Mumbai Central via Swargate',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Boarding', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Dropping', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Swargate'),
                Text('Mumbai Central'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bus Type', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('19 February 2025',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ordinary'),
                Text(''),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Boarding Time',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Dropping Time',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('01:48'),
                Text('06:00'),
              ],
            ),
            SizedBox(height: 10),
            Text('Total Seats', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('2'),
            SizedBox(height: 5),
            Text('Seat No.', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('15, 16'),
            SizedBox(height: 10),
            Text('Passenger Names',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1. Hiroshi Patel', style: TextStyle(fontSize: 14)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Age 32', style: TextStyle(fontSize: 12)),
                    Text('M', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Phone', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('+91 9876543210'),
            SizedBox(height: 20),
            Divider(color: Colors.blue, thickness: 2),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Basic Fare',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('₹562.00'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ASN', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reservation',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('10'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rounding', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('-0.80'),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.blue, thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Fare',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('₹574.00',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
