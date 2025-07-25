import 'package:demoappfortest/utils/app_colors.dart';
import 'package:demoappfortest/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class BusReceiptWidget extends StatelessWidget {
  final String busServiceName;
  final String route;
  final String boardingPoint;
  final String droppingPoint;
  final String busType;
  final String journeyDate;
  final String boardingTime;
  final String droppingTime;
  final String totalSeats;
  final String seatNumbers;
  final List<PassengerInfo> passengers;
  final String phoneNumber;
  final VoidCallback? onHomePressed;
  final VoidCallback? onDownloadPressed;
  final double basicFare;
  final double reservation;
  final double rounding;
  final double totalFare;
  final bool? isReceipt;

  const BusReceiptWidget(
      {Key? key,
      required this.busServiceName,
      required this.route,
      required this.boardingPoint,
      required this.droppingPoint,
      required this.busType,
      required this.journeyDate,
      required this.boardingTime,
      required this.droppingTime,
      required this.totalSeats,
      required this.seatNumbers,
      required this.passengers,
      required this.phoneNumber,
      this.onHomePressed,
      this.onDownloadPressed,
      required this.basicFare,
      required this.reservation,
      required this.rounding,
      required this.totalFare,
      required this.isReceipt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = AppSizes.isTablet(context);
    final horizontalPadding = isTablet ? 32.0 : 12.0;
    final containerWidth = screenWidth - (horizontalPadding * 2);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            // Top section with receipt header and journey details
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                border: Border.all(color: AppColors.neutral100),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isReceipt ?? false)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Center(
                              child: Text(
                                'Receipt',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.neutral100,
                                  fontSize: isTablet ? 22 : 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        // Bus Service Name
                        Text(
                          'Bus Service Name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.neutral300,
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 14 : 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Route Information
                        Text(
                          route,
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.neutral100,
                            fontSize: isTablet ? 16 : 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Boarding and Dropping Labels
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Boarding',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.neutral300,
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 14 : 12,
                              ),
                            ),
                            Text(
                              'Dropping',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.neutral300,
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 14 : 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Boarding and Dropping Points
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                boardingPoint,
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.neutral100,
                                  fontSize: isTablet ? 16 : 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "--------->",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.neutral100,
                                  fontSize: isTablet ? 14 : 12,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                droppingPoint,
                                textAlign: TextAlign.right,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.neutral100,
                                  fontSize: isTablet ? 16 : 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: AppColors.neutral100,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: AppColors.neutral100,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // Dotted line separator
            DottedLine(
              direction: Axis.horizontal,
              lineLength: containerWidth - 50,
              lineThickness: 1.0,
              dashLength: 6.0,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 4.0,
            ),
            // Bottom section with details
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  // Ticket cutout effect - bottom
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: AppColors.neutral100,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: AppColors.neutral100,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        // Bus Type and Journey Date
                        _buildInfoRow('Bus Type', 'Journey Date', isTablet),
                        const SizedBox(height: 4),
                        _buildValueRow(busType, journeyDate, isTablet),
                        const SizedBox(height: 12),
                        // Boarding and Dropping Time
                        _buildInfoRow(
                            'Boarding Time', 'Dropping Time', isTablet),
                        const SizedBox(height: 4),
                        _buildValueRow(boardingTime, droppingTime, isTablet),
                        const SizedBox(height: 12),
                        // Total Seats and Seat Numbers
                        _buildInfoRow('Total Seats', 'Seat No.', isTablet),
                        const SizedBox(height: 4),
                        _buildValueRow(totalSeats, seatNumbers, isTablet),
                        // Dotted line
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: DottedLine(
                            direction: Axis.horizontal,
                            lineLength: containerWidth - 32,
                            lineThickness: 1.0,
                            dashLength: 6.0,
                            dashColor: AppColors.neutral500,
                            dashRadius: 0.0,
                            dashGapLength: 4.0,
                          ),
                        ),
                        // Passenger Information Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Passenger Name',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.neutral400,
                                  fontSize: isTablet ? 14 : 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Age',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.neutral400,
                                  fontSize: isTablet ? 14 : 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Gender',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.neutral400,
                                  fontSize: isTablet ? 14 : 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Passenger Information
                        ...passengers.asMap().entries.map((entry) {
                          int index = entry.key;
                          PassengerInfo passenger = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '${index + 1}. ${passenger.name}',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.neutral900,
                                      fontSize: isTablet ? 16 : 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    passenger.age.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.neutral900,
                                      fontSize: isTablet ? 16 : 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    passenger.gender,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.neutral900,
                                      fontSize: isTablet ? 16 : 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        // Dotted line
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: DottedLine(
                            direction: Axis.horizontal,
                            lineLength: containerWidth - 32,
                            lineThickness: 1.0,
                            dashLength: 6.0,
                            dashColor: AppColors.neutral500,
                            dashRadius: 0.0,
                            dashGapLength: 4.0,
                          ),
                        ),
                        // Phone Number
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Phone',
                              style: TextStyle(
                                color: AppColors.neutral400,
                                fontSize: isTablet ? 14 : 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              phoneNumber,
                              style: TextStyle(
                                color: AppColors.neutral900,
                                fontSize: isTablet ? 16 : 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Final dotted line
                        DottedLine(
                          direction: Axis.horizontal,
                          lineLength: containerWidth - 32,
                          lineThickness: 1.0,
                          dashLength: 6.0,
                          dashColor: AppColors.primaryBlue,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                        ),
                        const SizedBox(height: 16),
                        // QR Code or Fare Details
                        if (isReceipt ?? false)
                          Center(
                            child: Icon(
                              Icons.qr_code,
                              size: isTablet ? 180 : 150,
                            ),
                          )
                        else
                          _buildFareDetails(isTablet),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Updated Button Section
            if (isReceipt ?? false)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onHomePressed,
                        icon: Icon(
                          Icons.home,
                          color: AppColors.primaryBlue,
                          size: isTablet ? 24 : 20,
                        ),
                        label: Text(
                          "Home Page",
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: isTablet ? 16 : 14,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: AppColors.primaryBlue, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: isTablet ? 16 : 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onDownloadPressed,
                        icon: Icon(
                          Icons.download,
                          color: AppColors.neutral50,
                          size: isTablet ? 24 : 20,
                        ),
                        label: Text(
                          "Download",
                          style: TextStyle(
                            color: AppColors.neutral50,
                            fontWeight: FontWeight.w600,
                            fontSize: isTablet ? 16 : 14,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: isTablet ? 16 : 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onDownloadPressed,
                    child: Text(
                      "Continue to payment",
                      style: TextStyle(
                        color: AppColors.neutral50,
                        fontWeight: FontWeight.w600,
                        fontSize: isTablet ? 16 : 14,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: isTablet ? 16 : 12,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(String leftLabel, String rightLabel, bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftLabel,
          style: TextStyle(
            color: AppColors.neutral400,
            fontSize: isTablet ? 14 : 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          rightLabel,
          style: TextStyle(
            color: AppColors.neutral400,
            fontSize: isTablet ? 14 : 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildValueRow(String leftValue, String rightValue, bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            leftValue,
            style: TextStyle(
              color: AppColors.neutral900,
              fontSize: isTablet ? 16 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            rightValue,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.neutral900,
              fontSize: isTablet ? 16 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFareDetails(bool isTablet) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Basic Fare',
              style: TextStyle(
                fontSize: isTablet ? 16 : 14,
              ),
            ),
            Text(
              '₹${basicFare.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: isTablet ? 16 : 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ASN',
              style: TextStyle(
                fontSize: isTablet ? 16 : 14,
              ),
            ),
            Text(
              '₹0.00',
              style: TextStyle(
                fontSize: isTablet ? 16 : 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reservation',
              style: TextStyle(
                fontSize: isTablet ? 16 : 14,
              ),
            ),
            Text(
              '₹${reservation.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: isTablet ? 16 : 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rounding',
              style: TextStyle(
                fontSize: isTablet ? 16 : 14,
              ),
            ),
            Text(
              '₹${rounding.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: isTablet ? 16 : 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Fare',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isTablet ? 18 : 16,
              ),
            ),
            Text(
              '₹${totalFare.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
                fontSize: isTablet ? 18 : 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Model class for passenger information
class PassengerInfo {
  final String name;
  final int age;
  final String gender;

  PassengerInfo({
    required this.name,
    required this.age,
    required this.gender,
  });
}
