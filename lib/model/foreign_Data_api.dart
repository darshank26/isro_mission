class foreign_api {
  final String name;
  final String launchDate;
  final String launchVehicle;
  final String orbitType;
  final String application;

  foreign_api({
    required this.name,
    required this.launchDate,
    required this.launchVehicle,
    required this.orbitType,
    required this.application,
  });

  factory foreign_api.fromJson(Map<String, dynamic> json) {
    return foreign_api(
      name: json['name'],
      launchDate: json['launch_date'],
      launchVehicle: json['launch_vehicle'],
      orbitType: json['orbit_type'],
      application: json['application'],
    );
  }
}
