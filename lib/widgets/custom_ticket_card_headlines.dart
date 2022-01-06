import 'package:case_study/constants.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../constants.dart';

class TicketCardTitle extends StatelessWidget {
  final String passengerName;
  final String seatNu;
  final String departureCity;
  final String departureBusStop;
  final String departureTime;
  final String arrivalCity;
  final String arrivalBusStop;
  final String arrivalTime;
  final String tourNumber;
  final String date;
  final String ticketNumber;
  final String bookingNumber;
  final String qrCode;

  const TicketCardTitle({
    required this.passengerName,
    required this.seatNu,
    required this.departureCity,
    required this.departureBusStop,
    required this.departureTime,
    required this.arrivalCity,
    required this.arrivalBusStop,
    required this.arrivalTime,
    required this.tourNumber,
    required this.date,
    required this.ticketNumber,
    required this.bookingNumber,
    required this.qrCode,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Departure Time',
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 14,
                    color: dpTimeHeadlineColor),
              ),
              Text(
                'Arrival Time',
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 14,
                    color: dpTimeHeadlineColor),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                departureTime,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: dpTimeColor),
              ),
              Text(
                arrivalTime,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: dpTimeColor),
              ),
            ],
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                departureCity,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: stuBerColor),
              ),
              Row(
                children: [
                  Text(
                    ' - - - - - ',
                    style: TextStyle(color: redLightBG),
                  ),
                  Column(
                    children: [
                      Text(
                        '',
                        style: TextStyle(fontSize: 2),
                      ),
                      Icon(
                        Icons.east,
                        size: 22,
                        color: redLightBG,
                      ),
                    ],
                  ),
                  Text(
                    ' - - - - - ',
                    style: TextStyle(color: redLightBG),
                  ),
                ],
              ),

              //style: TextStyle(color: redLightBG),

              Text(
                arrivalCity,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: stuBerColor),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                departureBusStop,
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 12, color: locDetailColor),
              ),
              Text(
                arrivalBusStop,
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 12, color: locDetailColor),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Passenger',
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 14,
                    color: dpTimeHeadlineColor),
              ),
              SizedBox(height: 8),
              Text(
                'Seat',
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 14,
                    color: dpTimeHeadlineColor),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                passengerName,
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 14, color: dpTimeColor),
              ),
              SizedBox(height: 8),
              Container(
                width: 38,
                height: 20,
                decoration: BoxDecoration(
                    color: redLightBG,
                    border: Border.all(
                      color: redLightBG,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Text(
                  seatNu,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tour Number',
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 14,
                    color: dpTimeHeadlineColor),
              ),
              SizedBox(height: 8),
              Text(
                'Date',
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 14,
                    color: dpTimeHeadlineColor),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tourNumber,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: dpTimeColor),
              ),
              SizedBox(height: 8),
              Text(
                date,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: dpTimeColor),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ticket Number',
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 14,
                        color: dpTimeHeadlineColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    ticketNumber,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: dpTimeColor),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Booking Number',
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 14,
                        color: dpTimeHeadlineColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    bookingNumber,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: dpTimeColor),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              SizedBox(
                width: 58,
              ),
              QrImage(
                padding: EdgeInsets.all(0),
                data: qrCode,
                version: QrVersions.auto,
                size: 100.0,
              ),
            ],
          )

          // Container(
          //   margin: EdgeInsets.only(left: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         children: [
          //           Text(
          //             'Ticket Number',
          //             style: TextStyle(
          //                 fontFamily: 'WorkSans',
          //                 fontSize: 14,
          //                 color: dpTimeHeadlineColor),
          //           ),
          //           Text(
          //             ticketNumber,
          //             style: TextStyle(
          //                 fontWeight: FontWeight.w500,
          //                 fontFamily: 'Roboto',
          //                 fontSize: 16,
          //                 color: dpTimeColor),
          //           ),
          //         ],
          //       ),
          //       SizedBox(
          //           height: 85,
          //           width: 85,
          //           child: Image.asset('assets/images/qrcode.png'))
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
