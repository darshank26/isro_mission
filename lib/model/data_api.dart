class spacecraft_api {
  final String name;
  final String launchDate;
  final String launchVehicle;
  final String orbitType;
  final String application;
  final String remark;
  final String link;

  spacecraft_api({
    required this.name,
    required this.launchDate,
    required this.launchVehicle,
    required this.orbitType,
    required this.application,
    required this.remark,
    required this.link,
  });

  factory spacecraft_api.fromJson(Map<String, dynamic> json) {
    return spacecraft_api(
      name: json['name'],
      launchDate: json['launch_date'],
      launchVehicle: json['launch_vehicle'],
      orbitType: json['orbit_type'],
      application: json['application'],
      remark: json['remark'],
      link: json['link'],
    );
  }
}
