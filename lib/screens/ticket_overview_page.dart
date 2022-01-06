import 'package:case_study/models/ticket_model.dart';
import 'package:case_study/providers/login.dart';
import 'package:case_study/providers/ticket.dart';
import 'package:case_study/widgets/custom_ticket_card_headlines.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class TicketsOverviewPage extends StatefulWidget {
  static const routeName = '/tickets';

  @override
  State<TicketsOverviewPage> createState() => _TicketsOverviewPageState();
}

class _TicketsOverviewPageState extends State<TicketsOverviewPage> {
  var _isInit = true;
  var _isLoading = true;

  TicketModel? ticketModel = TicketModel();
  Future<void> getTicketDetails(String userId) async {
    await Provider.of<TicketProvider>(context, listen: false)
        .fetchTickets(userId)
        .then((value) {
      ticketModel =
          Provider.of<TicketProvider>(context, listen: false).ticketDetails;
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future<void> getLoginResponse() async {
    final loginId = Provider.of<LoginProvider>(context, listen: false)
        .responseModel!
        .data['userId'];
    getTicketDetails(loginId);
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      getLoginResponse();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: redLightBG,
        leading: Icon(
          Icons.directions_bus,
        ),
        title: Text(
          'Tickets',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 36, right: 36),
        height: 460,
        width: 350,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            elevation: 10,
            child: Column(
              children: [
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              grTop,
                              grBottom,
                            ])),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: [
                                TicketCardTitle(
                                  passengerName: ticketModel!.passengerName!,
                                  seatNu: ticketModel!.seatNu!,
                                  departureCity: ticketModel!.departureCity!,
                                  departureBusStop:
                                      ticketModel!.departureBusStop!,
                                  departureTime: ticketModel!.departureTime!,
                                  arrivalCity: ticketModel!.arrivalCity!,
                                  arrivalBusStop: ticketModel!.arrivalBusStop!,
                                  arrivalTime: ticketModel!.arrivalTime!,
                                  tourNumber: ticketModel!.tourNumber!,
                                  date: ticketModel!.date!,
                                  ticketNumber: ticketModel!.ticketNumber!,
                                  bookingNumber: ticketModel!.bookingNumber!,
                                  qrCode: ticketModel!.qrCode!,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ],
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          setState(() {
            if (index == 0) Navigator.of(context).pushNamed('/');
            if (index == 1) {
              Navigator.of(context).pushNamed(
                TicketsOverviewPage.routeName,
              );
            }
          });
          print(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontFamily: 'WorkSans'),
        selectedItemColor: redLightBG,
        unselectedLabelStyle: TextStyle(fontFamily: 'WorkSans'),
        unselectedItemColor: Colors.black,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            label: 'Homescreen',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Tickets',
            icon: Icon(Icons.text_snippet),
          ),
        ],
      ),
    );
  }
}
