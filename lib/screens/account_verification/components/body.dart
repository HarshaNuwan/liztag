import 'package:flutter/material.dart';
import 'package:liztag/components/rounded_button.dart';
import 'package:liztag/components/rounded_input_field.dart';
import 'package:liztag/components/text_field_container.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/screens/account_verification/components/background.dart';
import 'package:liztag/screens/home/home_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Verification",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldContainer(
              child: RoundedInputField(
                hintText: "enter the verification code",
                icon: Icons.verified_user,
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 25 ,),
            RoundedButton(
              text: "Send",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen()) );

              },
              color: kPrimaryColor,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

