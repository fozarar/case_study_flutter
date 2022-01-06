// ignore_for_file: sized_box_for_whitespace

import 'package:case_study/models/login_model.dart';
import 'package:case_study/models/user_model.dart';
import 'package:case_study/providers/login.dart';
import 'package:case_study/screens/ticket_overview_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String logInId = '';
  LoginModel loginModel = LoginModel(email: '', password: '');
  String errorMessage = '';
  bool _isValid = true;
  var _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> submit() async {
    _formKey.currentState!.save();
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }

    setState(() {
      _isLoading = true;
    });

    loginFunc();
  }

  Future<void> loginFunc() async {
    Provider.of<LoginProvider>(context, listen: false)
        .login(loginModel)
        .then((value) {
      setState(() {
        _isLoading = false;
        if (value!.status != 200) {
          _isValid = false;
          print('isvalid: $_isValid');
          errorMessage = value.message;
        } else {
          UserModel userInfo = UserModel.fromJson(value.data);
          logInId = userInfo.userId!;
          Navigator.of(context)
              .pushNamed(TicketsOverviewPage.routeName, arguments: logInId);
        }
      });
    });
  }

  // setState(() {
  //   _isLoading = false;
  // });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                'Welcome back!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto'),
              ),
              SizedBox(height: 4),
              Text(
                errorMessage,
                style: TextStyle(
                    color: redLightBG,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 24),
              Container(
                width: 330,
                height: 60,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle:
                        TextStyle(fontSize: 14, color: textInputTextColor),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: textInputBorderColor, width: 1.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    loginModel.email = value!;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 330,
                height: 60,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle:
                        TextStyle(fontSize: 14, color: textInputTextColor),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: textInputBorderColor, width: 1.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    loginModel.password = value!;
                  },
                ),
              ),
              SizedBox(height: 24),
              Consumer<LoginProvider>(
                builder: (ctx, logindata, _) => _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: redLightBG,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          // elevation: 15.0,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: 150,
                          height: 50,
                          child: Text(
                            "LOG IN",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPressed: submit,
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
