import 'package:pawsome/app_theme.dart';
import 'package:pawsome/constants/longtext.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Container(
      color: isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor:
              isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      left: 16,
                      right: 16),
                  child: Image.asset('assets/images/helpImage.png'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'About us',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isLightMode ? Colors.black : Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    Constants.aboutUsText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: isLightMode ? Colors.black : Colors.white),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
