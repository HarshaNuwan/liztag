import 'package:flutter/material.dart';
import 'package:liztag/autosuggest.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/home_widget.dart';
import 'package:liztag/models/sign_up_screen_model.dart';
import 'package:liztag/screens/signup/signup_screen.dart';
import 'package:liztag/screens/welcome/welcome_screen.dart';
import 'package:liztag/splashwidget.dart';
import 'package:liztag/signup_widget.dart';
import 'package:provider/provider.dart';

import 'entities/country_entity.dart';


/*void main() => runApp(MaterialApp(
  //initialRoute: '/home',
  routes: {
    '/': (context) => SplashWidget(),
    '/signup': (context) => SignUpWidget(),
    '/home': (context) => HomeWidget(),
    '/autosuggest': (context) => AutoSuggetsLocation(),

  },

));*/


void main() async {
  List<CountryEntity> countryList = [];
  CountryEntity c1 = CountryEntity.withAllParams(1, "Sri Lanka", "LKR", "+94");
  CountryEntity c2 = CountryEntity.withAllParams(2, "Singapore", "SGD", "+65");

  countryList.add(c1);
  countryList.add(c2);

  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpScreenModel.withCountryList(countryList)),
        ChangeNotifierProvider(create: (_) => CountryEntity()),
      ],
      child: Liztag(),
    ),
  );
}

//void main() => runApp(Liztag());

class Liztag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Liztag",
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white
      ),
      home: WelcomeScreen(),
    );
  }
}






