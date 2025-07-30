class Passenger {
  final String name;
  final int age;
  final String gender;

  Passenger({required this.name, required this.age, required this.gender});

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'gender': gender,
      };

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
    );
  }
}
