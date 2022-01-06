import 'package:case_study/providers/departure.dart';
import 'package:case_study/providers/login.dart';
import 'package:case_study/providers/ticket.dart';
import 'package:case_study/screens/ticket_overview_page.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'package:flutter/material.dart';

import 'screens/home_overview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DepartureProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TicketProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: blackPRColor,
        ),
        home: HomeOverviewPage(),
        initialRoute: '/',
        routes: {
          TicketsOverviewPage.routeName: (ctx) => TicketsOverviewPage(),
        },
      ),
    );
  }
}
