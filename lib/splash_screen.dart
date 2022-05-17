import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_app/list_page.dart';

class SplashScreenPage extends StatefulWidget {
  static final String routeName = "/splash_screen";
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();

}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),()=> Navigator.pushNamed(context, RestaurantsListPage.routeName));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15BCC7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(5),
              child:ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child : Image.asset(
                  "assets/images/merahp.jpg",
                  width: 130.0,
                  height: 130.0,
                  fit:BoxFit.cover,

                ),
              ),

            ),

            Text("Indonesia Resto ",
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: 'Staarliches'
              ),
            )

          ],
        ),
      ),
    );
  }
  }




