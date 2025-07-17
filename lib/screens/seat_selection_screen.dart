import 'package:flutter/material.dart';

class Seat {
  final String id;
  final int row;
  final int col;
  final String type; // 'sleeper' or 'seater'
  final String status; // 'available' or 'booked'
  final String gender; // 'any', 'male', 'female'
  final String deck; // 'lower' or 'upper'
  final double price;

  Seat(this.id, this.row, this.col, this.type, this.status, this.gender,
      this.deck, this.price);
}

class SeatLayoutWidget extends StatefulWidget {
  final List<Seat> seats;
  final int totalCols;
  final bool isDoubleDecker;

  const SeatLayoutWidget({
    super.key,
    required this.seats,
    required this.totalCols,
    this.isDoubleDecker = false,
  });

  @override
  State<SeatLayoutWidget> createState() => _SeatLayoutWidgetState();
}

class _SeatLayoutWidgetState extends State<SeatLayoutWidget> {
  String selectedDeck = 'lower';
  String genderFilter = 'all';
  Set<String> selectedSeats = {};

  Widget buildSeat(Seat seat) {
    bool isBooked = seat.status == 'booked';
    bool isSelected = selectedSeats.contains(seat.id);

    Color seatColor = isBooked
        ? Colors.grey.shade300
        : isSelected
            ? const Color(0xFFD84E55) // RedBus red color
            : const Color(0xFFE8F5E8); // Light green for available

    Color borderColor = isBooked
        ? Colors.grey.shade400
        : isSelected
            ? const Color(0xFFD84E55)
            : const Color(0xFF4CAF50); // Green border for available

    Color textColor = isBooked || isSelected ? Colors.white : Colors.black87;

    // Gender indicator icon
    IconData? genderIcon;
    Color? genderIconColor;
    if (seat.gender == 'male') {
      genderIcon = Icons.male;
      genderIconColor = Colors.blue.shade600;
    } else if (seat.gender == 'female') {
      genderIcon = Icons.female;
      genderIconColor = Colors.pink.shade600;
    }

    return AnimatedScale(
      scale: isSelected ? 1.05 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: isBooked
            ? null
            : () {
                setState(() {
                  if (isSelected) {
                    selectedSeats.remove(seat.id);
                  } else {
                    selectedSeats.add(seat.id);
                  }
                });
              },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(2),
          width: 45,
          height: 65, // Taller rectangle like in RedBus
          decoration: BoxDecoration(
            color: seatColor,
            border: Border.all(color: borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              if (!isBooked)
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Gender icon at top
              if (genderIcon != null)
                Icon(
                  genderIcon,
                  size: 14,
                  color:
                      isSelected || isBooked ? Colors.white : genderIconColor,
                ),
              // Seat number
              Text(
                seat.id,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              // Price
              Text(
                "₹${seat.price.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 9,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLegend(Color color, String label, {IconData? icon}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child:
              icon != null ? Icon(icon, size: 10, color: Colors.white) : null,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Seat> filteredSeats = widget.seats.where((seat) {
      final deckCheck = widget.isDoubleDecker
          ? seat.deck == selectedDeck
          : seat.deck == 'lower';
      final genderCheck = genderFilter == 'all' ||
          seat.gender == genderFilter ||
          seat.gender == 'any';
      return deckCheck && genderCheck;
    }).toList();

    double totalPrice = selectedSeats.fold(0, (sum, id) {
      final seat = widget.seats.firstWhere((s) => s.id == id);
      return sum + seat.price;
    });

    return Column(
      children: [
        // Header with bus info
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.directions_bus, color: Colors.grey.shade600, size: 24),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AC Sleeper (2+1)",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "40 seats available",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Deck selector for double decker
        if (widget.isDoubleDecker)
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade50,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedDeck = 'lower'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedDeck == 'lower'
                            ? const Color(0xFFD84E55)
                            : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        border: Border.all(
                          color: selectedDeck == 'lower'
                              ? const Color(0xFFD84E55)
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.layers,
                            size: 18,
                            color: selectedDeck == 'lower'
                                ? Colors.white
                                : Colors.grey.shade600,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Lower Deck",
                            style: TextStyle(
                              color: selectedDeck == 'lower'
                                  ? Colors.white
                                  : Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedDeck = 'upper'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedDeck == 'upper'
                            ? const Color(0xFFD84E55)
                            : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        border: Border.all(
                          color: selectedDeck == 'upper'
                              ? const Color(0xFFD84E55)
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.layers,
                            size: 18,
                            color: selectedDeck == 'upper'
                                ? Colors.white
                                : Colors.grey.shade600,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Upper Deck",
                            style: TextStyle(
                              color: selectedDeck == 'upper'
                                  ? Colors.white
                                  : Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        // Legend and filter
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey.shade50,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        buildLegend(const Color(0xFFE8F5E8), "Available"),
                        buildLegend(const Color(0xFFD84E55), "Selected"),
                        buildLegend(Colors.grey.shade300, "Booked"),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: DropdownButton<String>(
                      value: genderFilter,
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(value: 'all', child: Text('All')),
                        DropdownMenuItem(value: 'male', child: Text('Male')),
                        DropdownMenuItem(
                            value: 'female', child: Text('Female')),
                      ],
                      onChanged: (val) {
                        setState(() => genderFilter = val!);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child:
                        Icon(Icons.male, size: 10, color: Colors.blue.shade700),
                  ),
                  const SizedBox(width: 4),
                  Text("Male",
                      style:
                          TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Icon(Icons.female,
                        size: 10, color: Colors.pink.shade700),
                  ),
                  const SizedBox(width: 4),
                  Text("Female",
                      style:
                          TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                ],
              ),
            ],
          ),
        ),

        // Seat layout
        Expanded(
          child: Container(
            color: Colors.grey.shade50,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Bus header
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.airline_seat_recline_normal,
                                  color: Colors.grey.shade600, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                "Driver",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.door_front_door,
                              color: Colors.grey.shade600, size: 20),
                        ],
                      ),
                    ),

                    // Seat grid
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              (filteredSeats.length / widget.totalCols).ceil(),
                              (row) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Left side seats
                                    Row(
                                      children: List.generate(2, (col) {
                                        int index =
                                            row * widget.totalCols + col;
                                        return index < filteredSeats.length
                                            ? buildSeat(filteredSeats[index])
                                            : const SizedBox(width: 48);
                                      }),
                                    ),
                                    // Aisle
                                    Container(
                                      width: 32,
                                      height: 2,
                                      color: Colors.grey.shade200,
                                    ),
                                    // Right side seats
                                    Row(
                                      children: List.generate(2, (col) {
                                        int index =
                                            row * widget.totalCols + 2 + col;
                                        return index < filteredSeats.length
                                            ? buildSeat(filteredSeats[index])
                                            : const SizedBox(width: 48);
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Bottom selection summary
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${selectedSeats.length} seat(s) selected",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      if (selectedSeats.isNotEmpty)
                        Text(
                          "Seats: ${selectedSeats.join(', ')}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                    ],
                  ),
                  Text(
                    "₹${totalPrice.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD84E55),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedSeats.isEmpty
                      ? null
                      : () {
                          // Handle seat selection
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Selected ${selectedSeats.length} seats'),
                              backgroundColor: const Color(0xFFD84E55),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD84E55),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    selectedSeats.isEmpty ? "Select Seats" : "Continue",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SeatBookingScreen extends StatelessWidget {
  const SeatBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Seat> seats = List.generate(48, (i) {
      final deck = i < 24 ? 'lower' : 'upper';
      final status = i % 8 == 0 ? 'booked' : 'available';
      final gender = i % 6 == 0
          ? 'female'
          : i % 5 == 0
              ? 'male'
              : 'any';
      final seatType = i % 3 == 0 ? 'sleeper' : 'seater';
      return Seat('${i + 1}', i ~/ 4, i % 4, seatType, status, gender, deck,
          450 + (i % 6) * 75);
    });

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "Select Seats",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFD84E55),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SeatLayoutWidget(
        seats: seats,
        totalCols: 4,
        isDoubleDecker: true,
      ),
    );
  }
}

// chat gpt
// import 'package:flutter/material.dart';

// class Seat {
//   final String id;
//   final int row;
//   final int col;
//   final String type; // 'sleeper' or 'seater'
//   final String status; // 'available' or 'booked'
//   final String gender; // 'any', 'male', 'female'
//   final String deck; // 'lower' or 'upper'
//   final double price;

//   Seat(this.id, this.row, this.col, this.type, this.status, this.gender,
//       this.deck, this.price);
// }

// class SeatLayoutWidget extends StatefulWidget {
//   final List<Seat> seats;
//   final int totalCols;
//   final bool isDoubleDecker;

//   const SeatLayoutWidget({
//     super.key,
//     required this.seats,
//     required this.totalCols,
//     this.isDoubleDecker = false,
//   });

//   @override
//   State<SeatLayoutWidget> createState() => _SeatLayoutWidgetState();
// }

// class _SeatLayoutWidgetState extends State<SeatLayoutWidget> {
//   String selectedDeck = 'lower';
//   String genderFilter = 'all';
//   Set<String> selectedSeats = {};

//   Widget buildSeat(Seat seat) {
//     bool isBooked = seat.status == 'booked';
//     bool isSelected = selectedSeats.contains(seat.id);

//     IconData genderIcon;
//     switch (seat.gender) {
//       case 'male':
//         genderIcon = Icons.male;
//         break;
//       case 'female':
//         genderIcon = Icons.female;
//         break;
//       default:
//         genderIcon = Icons.event_seat;
//     }

//     Color seatColor = isBooked
//         ? Colors.grey.shade400
//         : isSelected
//             ? Colors.indigo
//             : Colors.white;

//     Color textColor = isBooked || isSelected ? Colors.white : Colors.black;

//     return AnimatedScale(
//       scale: isSelected ? 1.05 : 1.0,
//       duration: const Duration(milliseconds: 300),
//       child: GestureDetector(
//         onTap: isBooked
//             ? null
//             : () {
//                 setState(() {
//                   if (isSelected) {
//                     selectedSeats.remove(seat.id);
//                   } else {
//                     selectedSeats.add(seat.id);
//                   }
//                 });
//               },
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 250),
//           margin: const EdgeInsets.all(4),
//           padding: const EdgeInsets.all(6),
//           width: 48,
//           height: 64,
//           decoration: BoxDecoration(
//             color: seatColor,
//             border: Border.all(
//               color: isSelected
//                   ? Colors.indigo
//                   : isBooked
//                       ? Colors.grey
//                       : Colors.black12,
//               width: 1.5,
//             ),
//             borderRadius: BorderRadius.circular(8),
//             boxShadow: [
//               if (!isBooked && !isSelected)
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.15),
//                   blurRadius: 6,
//                   offset: const Offset(0, 3),
//                 )
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 genderIcon,
//                 size: 14,
//                 color: textColor,
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 seat.id,
//                 style: TextStyle(
//                   fontSize: 10,
//                   fontWeight: FontWeight.w600,
//                   color: textColor,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 "₹${seat.price.toStringAsFixed(0)}",
//                 style: TextStyle(fontSize: 9, color: textColor),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildLegend(Color color, String label) {
//     return Row(
//       children: [
//         Container(
//           width: 16,
//           height: 16,
//           margin: const EdgeInsets.only(right: 6),
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(4),
//             border: Border.all(color: Colors.black26),
//           ),
//         ),
//         Text(label, style: const TextStyle(fontSize: 12)),
//         const SizedBox(width: 12),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Seat> filteredSeats = widget.seats.where((seat) {
//       final deckCheck = widget.isDoubleDecker
//           ? seat.deck == selectedDeck
//           : seat.deck == 'lower';
//       final genderCheck = genderFilter == 'all' ||
//           seat.gender == genderFilter ||
//           seat.gender == 'any';
//       return deckCheck && genderCheck;
//     }).toList();

//     double totalPrice = selectedSeats.fold(0, (sum, id) {
//       final seat = widget.seats.firstWhere((s) => s.id == id);
//       return sum + seat.price;
//     });

//     return Column(
//       children: [
//         if (widget.isDoubleDecker)
//           Padding(
//             padding: const EdgeInsets.only(top: 8),
//             child: ToggleButtons(
//               borderRadius: BorderRadius.circular(8),
//               selectedColor: Colors.white,
//               fillColor: Colors.indigo,
//               isSelected: [selectedDeck == 'lower', selectedDeck == 'upper'],
//               onPressed: (index) {
//                 setState(() {
//                   selectedDeck = index == 0 ? 'lower' : 'upper';
//                 });
//               },
//               children: const [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Text("Lower Deck"),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Text("Upper Deck"),
//                 )
//               ],
//             ),
//           ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   buildLegend(Colors.white, "Available"),
//                   buildLegend(Colors.indigo, "Selected"),
//                   buildLegend(Colors.grey.shade400, "Booked"),
//                 ],
//               ),
//               DropdownButton<String>(
//                 value: genderFilter,
//                 items: const [
//                   DropdownMenuItem(value: 'all', child: Text('All')),
//                   DropdownMenuItem(value: 'male', child: Text('Male')),
//                   DropdownMenuItem(value: 'female', child: Text('Female')),
//                 ],
//                 onChanged: (val) {
//                   setState(() => genderFilter = val!);
//                 },
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.7,
//               height: MediaQuery.of(context).size.height * 0.65,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.shade400),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//               padding: const EdgeInsets.only(top: 24, bottom: 12),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 4,
//                     right: 4,
//                     child: Icon(Icons.settings_ethernet,
//                         size: 28, color: Colors.black54),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 16),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: Column(
//                         children: List.generate(
//                           (filteredSeats.length / widget.totalCols).ceil(),
//                           (row) => Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 4),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: List.generate(2, (col) {
//                                     int index = row * widget.totalCols + col;
//                                     return index < filteredSeats.length
//                                         ? buildSeat(filteredSeats[index])
//                                         : const SizedBox(width: 48);
//                                   }),
//                                 ),
//                                 const SizedBox(width: 30),
//                                 Row(
//                                   children: List.generate(2, (col) {
//                                     int index =
//                                         row * widget.totalCols + 2 + col;
//                                     return index < filteredSeats.length
//                                         ? buildSeat(filteredSeats[index])
//                                         : const SizedBox(width: 48);
//                                   }),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           color: Colors.grey.shade100,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Selected: ${selectedSeats.length} seat(s)",
//                 style:
//                     const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 "Total: ₹${totalPrice.toStringAsFixed(0)}",
//                 style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.indigo),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// class SeatBookingScreen extends StatelessWidget {
//   const SeatBookingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Seat> seats = List.generate(40, (i) {
//       final deck = i < 20 ? 'lower' : 'upper';
//       final status = i % 6 == 0 ? 'booked' : 'available';
//       final gender = i % 4 == 0
//           ? 'female'
//           : i % 3 == 0
//               ? 'male'
//               : 'any';
//       return Seat('S${i + 1}', i ~/ 4, i % 4, 'seater', status, gender, deck,
//           500 + (i % 5) * 50);
//     });

//     return Scaffold(
//       appBar: AppBar(title: const Text("Bus Seat Layout")),
//       body: SeatLayoutWidget(
//         seats: seats,
//         totalCols: 4,
//         isDoubleDecker: true,
//       ),
//     );
//   }
// }

// grok
