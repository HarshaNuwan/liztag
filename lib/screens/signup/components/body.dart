import 'package:flutter/material.dart';
import 'package:liztag/components/rounded_button.dart';
import 'package:liztag/components/rounded_drop_down_button.dart';
import 'package:liztag/components/rounded_input_field.dart';
import 'package:liztag/components/text_field_container.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/entities/country_entity.dart';
import 'package:liztag/entities/user_entity.dart';
import 'package:liztag/screens/account_verification/verification_screen.dart';
import 'package:liztag/screens/signup/components/background.dart';
import 'package:liztag/models/sign_up_screen_model.dart';
import 'package:liztag/services/sign_up_api_provider.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {


  Body({
    Key key,
  }) : super(key: key);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

 @override
  Widget build(BuildContext context) {

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Signup", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: kPrimaryColor) ,),
            SizedBox(
              height: 20,
            ),
            TextFieldContainer(child: RoundedDropDownButton(itemList: context.watch<SignUpScreenModel>().countryDropDownList,)),
            TextFieldContainer(
              child: RoundedInputField(
                textEditingController: _nameController,
                hintText: "your name",
                icon: Icons.person,
                onChanged: (value) {},
              ),
            ),
            TextFieldContainer(
              child: RoundedInputField(
                textEditingController: _phoneNumberController,
                hintText: "your phone number",
                icon: Icons.phone,
                onChanged: (value) {},
              ),
            ),
            TextFieldContainer(
              child: RoundedInputField(
                textEditingController: _emailController,
                hintText: "your email",
                icon: Icons.email,
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RoundedButton(
              text: "Submit",
              press: () async{
                context.read<SignUpScreenModel>().name = _nameController.text;
                context.read<SignUpScreenModel>().phoneNumber = _phoneNumberController.text;
                context.read<SignUpScreenModel>().email = _emailController.text;

                UserEntity userEntity = UserEntity(0, context.read<CountryEntity>().countryId,
                    context.read<SignUpScreenModel>().name,
                    context.read<SignUpScreenModel>().phoneNumber,
                    context.read<SignUpScreenModel>().email, false);

                bool status = await SignUpApiProvider.signUp(userEntity);

                if(status){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen()));
                }
                //Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen()));
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

