import 'package:case_study/providers/login.dart';
import 'package:case_study/screens/login_screen.dart';
import 'package:case_study/screens/ticket_overview_page.dart';
import 'package:flutter/material.dart';
import 'package:case_study/screens/home_details.screen.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class HomeOverviewPage extends StatefulWidget {
  @override
  State<HomeOverviewPage> createState() => _HomeOverviewPageState();
}

class _HomeOverviewPageState extends State<HomeOverviewPage> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: redLightBG,
        leading: Icon(
          Icons.directions_bus,
        ),
        title: Text(
          'TEST APP',
          textAlign: TextAlign.center,
        ),
      ),
      body: HomeBodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (currentIndex) {
          setState(() {
            if (currentIndex == 0) Navigator.of(context).pushNamed('/');
            if (currentIndex == 1) {
              if (loginProvider.isLoggedIn) {
                Navigator.of(context).pushNamed(TicketsOverviewPage.routeName);
                return;
              }
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      content: LoginScreen(),
                      insetPadding: EdgeInsets.symmetric(horizontal: 13),
                    );
                  });

              // Navigator.of(context).pushNamed(TicketsOverviewPage.routeName);
            }
          });
          if (currentIndex == 1) {
            print('Current Index $currentIndex = Tickets Page');
          } else {
            print('Current Index $currentIndex = Homescreen');
          }
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
