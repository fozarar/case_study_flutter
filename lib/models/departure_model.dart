class DepartureModel {
  String route;
  String departureTime;
  String arrivalTime;
  String tourType;
  List<String> daysOfWeek;

  DepartureModel({
    required this.route,
    required this.departureTime,
    required this.arrivalTime,
    required this.tourType,
    required this.daysOfWeek,
  });

  //method that assign values to respective datatype vairables

  factory DepartureModel.fromJson(dynamic json) {
    return DepartureModel(
      route: json['route'],
      departureTime: json['departureTime'],
      arrivalTime: json['arrivalTime'],
      tourType: json['tourType'],
      daysOfWeek: (json["daysOfWeek"] as List).cast<String>(),
    );
  }

  // DepartureModel.fromJson(dynamic json) {
  //   route = json["route"];
  //   departureTime = json["departureTime"];
  //   arrivalTime = json["arrivalTime"];
  //   tourType = json["tourType"];
  //   daysOfWeek = [];
  //   json["daysOfWeek"].forEach((day) {
  //     daysOfWeek!.add(day);
  //   });
  // }
}
