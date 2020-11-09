import 'package:flutter/material.dart';
import 'package:liztag/components/app_bar_with_back_button_and_title.dart';
import 'package:liztag/components/rounded_button.dart';
import 'package:liztag/components/rounded_input_field.dart';
import 'package:liztag/components/text_field_container.dart';
import 'package:liztag/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AppBarWithBackButtonAndTitle(
            title: "Create Advertisement",
          ),
          SizedBox(height: 20.0),
          TextFieldContainer(child: RoundedInputField(icon: Icons.markunread_mailbox, onChanged: (value){}, hintText: "property name",)),
          TextFieldContainer(child: RoundedInputField(icon: Icons.monetization_on, onChanged: (value){}, hintText: "property value",)),
          Spacer(),
          RoundedButton(press: (){}, text: "Save", textColor: Colors.white, color: kPrimaryColor),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}
