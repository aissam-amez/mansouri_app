import 'package:flutter/material.dart';
import 'package:mansouri/screens/main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);

    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => MyHomePage(title: 'فاطمة الزهراء المنصوري')));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: ClipOval(
          child: Image.asset(
            'assets/images/user1.png',
            height: 150,
          ),
        ),
      ),
    ));
  }
}
