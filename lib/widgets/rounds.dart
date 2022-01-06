import 'package:case_study/constants.dart';
import 'package:case_study/models/departure_model.dart';
import 'package:case_study/providers/departure.dart';
import 'package:case_study/widgets/custom_departure_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rounds extends StatefulWidget {
  @override
  State<Rounds> createState() => _RoundsState();
}

class _RoundsState extends State<Rounds> {
  var _isInit = true;
  var _isLoading = true;
  List<DepartureModel> departuresList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      getDepartures();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> getDepartures() async {
    Provider.of<DepartureProvider>(context, listen: false)
        .fetchDepartures()
        .then((value) {
      departuresList =
          Provider.of<DepartureProvider>(context, listen: false).departures;
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //final departures = Provider.of<DepartureProvider>(context);
    return SizedBox(
      height: 355,
      width: double.infinity,
      child: Card(
          color: depTimBGColor,
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i in departuresList)
                        CustomDepartureList(
                            icon: i.tourType == "Day"
                                ? Icons.wb_sunny
                                : Icons.bedtime,
                            title:
                                "${i.route} /  ${i.departureTime}-${i.arrivalTime}",
                            days: i.daysOfWeek),
                    ],
                  ),
                )),
    );
  }
}
