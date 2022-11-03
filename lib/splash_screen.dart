import 'package:flutter/material.dart';
import '/myHomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, MyHomePage.route);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        alignment: Alignment.center,
        child: Image.asset(
          'images/nike_logo.png',
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
