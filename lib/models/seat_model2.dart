class SeatModell {
  final String seatNo;
  final double fare;
  final bool available;

  SeatModell({
    required this.seatNo,
    required this.fare,
    required this.available,
  });

  factory SeatModell.fromJson(Map<String, dynamic> json) {
    return SeatModell(
      seatNo: json['seatNo'] ?? '',
      fare: (json['fare'] as num).toDouble(),
      available: json['seatstatus'] == 'A', // Available if status is 'A'
    );
  }

  @override
  String toString() =>
      'SeatModel(seatNo: $seatNo, fare: $fare, available: $available)';
}
