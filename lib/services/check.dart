import 'package:dartist_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dartist_app/services/firebase_user.dart';
import 'package:dartist_app/screens/category_screen.dart';

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  void check() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (FirebaseCurrentUser().currentUser == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
              settings: RouteSettings(name: 'Sign In Screen'),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CategoriesScreen(),
            ));
      }
    });
  }

  @override
  initState() {
    super.initState();
    check();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Dartists'),
        ),
      ),
    );
  }
}
