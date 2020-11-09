import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 35),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 35 + 20.0, left: 30, right: 20),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: Row(
              children: <Widget>[
                Text("Hi Harsha!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: Icon(Icons.person, color: Colors.grey, size: 35,),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(left: 20, right: 10 ),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 10,
                      color: kPrimaryColor.withOpacity(0.23)
                  )
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: size.width * 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: FlatButton(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                          onPressed: (){},
                          child: Text(
                            "Search",
                            style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                 //Icon(Icons.search, color: kPrimaryColor,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}