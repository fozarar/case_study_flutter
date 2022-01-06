class TicketModel {
  String? passengerName;
  String? seatNu;
  String? departureCity;
  String? departureBusStop;
  String? departureTime;
  String? arrivalCity;
  String? arrivalBusStop;
  String? arrivalTime;
  String? tourNumber;
  String? date;
  String? ticketNumber;
  String? bookingNumber;
  String? qrCode;

  TicketModel({
    this.passengerName,
    this.seatNu,
    this.departureCity,
    this.departureBusStop,
    this.departureTime,
    this.arrivalCity,
    this.arrivalBusStop,
    this.arrivalTime,
    this.tourNumber,
    this.date,
    this.ticketNumber,
    this.bookingNumber,
    this.qrCode,
  });

  TicketModel.fromJson(Map<String, dynamic> json) {
    passengerName = json["passengerName"];
    seatNu = json["seatNu"];
    departureCity = json["departureCity"];
    departureBusStop = json["departureBusStop"];
    departureTime = json["departureTime"];
    arrivalCity = json["arrivalCity"];
    arrivalBusStop = json["arrivalBusStop"];
    arrivalTime = json["arrivalTime"];
    tourNumber = json["tourNumber"];
    date = json["date"];
    ticketNumber = json["ticketNumber"];
    bookingNumber = json["bookingNumber"];
    qrCode = json["qrCode"];
  }
}
