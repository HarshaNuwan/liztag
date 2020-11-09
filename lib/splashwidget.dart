import 'package:flutter/material.dart';
import 'package:liztag/services/api_provider.dart';

class SplashWidget extends StatefulWidget {
  SplashWidgetState createState() => SplashWidgetState();
}

class SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    initialize();
  }

  void initialize() async {
    final apiProvider = ApiProvider();
    final user = await apiProvider.fetchUser();
    if("Active" != user.status){
      Navigator.pushReplacementNamed(context, '/signup');
    }else{
      Navigator.pushReplacementNamed(context, '/home');
    }
    print(user.status);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 0.6,
              colors: [Colors.deepOrange[300], Colors.deepOrange[800]],
              stops: [0.0, 1.0],
            ),
          ),
          child: Center(
            child: Container(
              height: 200.0,
              width: 200.0,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text(
                    "Liztag",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.home,
                    size: 50.0,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
