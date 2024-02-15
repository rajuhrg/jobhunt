import 'package:flutter/material.dart';
// import 'package:jobhunt/navigators.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';

import 'forgotpwd_next.dart';


class ForgotPassword1 extends StatefulWidget {
  const ForgotPassword1({Key? key}) : super(key: key);

  @override
  State<ForgotPassword1> createState() => _ForgotPassword1State();
}

class _ForgotPassword1State extends State<ForgotPassword1> {
  List btncolorc = [0, 0];
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    return Scaffold(
      body: Container(
        color: forgotpwdOutercolor,
        child: SizedBox(
          child: Center(
            child: SingleChildScrollView(
              child: ResponsiveRow(
                  alignment: WrapAlignment.center,
                  columnsCount: 12,
                  children: [
                    FlexWidget(
                      child: Column(
                        children: [
                          Card(
                            elevation: 10,
                            color: forgotpwdInnerColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.08,
                                  horizontal: screenWidth * 0.05),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/forgotpwd1.png",
                                    // width: 100.0.sp,
                                  ),
                                  SizedBox(height: screenHeight * 0.044),
                                  Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: screenHeight * 0.032),
                                  const Text(
                                    "Don’t worry we can help you out! Choose the way to get a verification code",
                                    style: TextStyle(
                                        color: Color(0xFF6A6A6A),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w300),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: screenHeight * 0.04),
                                  SizedBox(
                                    width: double.infinity,
                                    child: smart_button_sharp(btncolorc),
                                  ),
                                  SizedBox(height: screenHeight * 0.04),
                                  MaterialButton(
                                    onPressed: () {
                                      if (btncolorc[0] == 1) {
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotpwdNext( type: "phone")));
                                        // Navigators.pushNav(context, "forgotNext", {"type":"phone"});
                                      } else if (btncolorc[1] == 1) {
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotpwdNext(type: "mail")));
                                        // Navigators.pushNav(context, "forgotNext", {"type":"mail"});
                                      } else {}
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(btnRadious1)),
                                    // padding: EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          gradient: btnGradient,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            // maxWidth: 300.0,
                                            minHeight: btnHeight1),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Select",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Do you need help?",
                                        style: TextStyle(
                                            color: Color(0xFF9B9B9B),
                                            fontSize: 14.0),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      xs: 11,
                      sm: 10,
                      md: 8,
                      lg: 5,
                      xl: 4,
                      xxl: 4,
                      xxxl: 4,
                      xsLand: 12,
                      smLand: 10,
                      mdLand: 6,
                      lgLand: 4,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  smart_button_sharp(List<dynamic> btncolorc) {
    // btncolorc = List.filled(btncolorc.length, 0);
    // Widget buttons(ButtonColor s1, ButtonColor s2) {
    return Wrap(
      // mainAxisAlignment: MainAxisAlignment.center,
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        MaterialButton(
          onPressed: () {
            setState(() {
              btncolorc[0] = 1;
              btncolorc[1] = 0;
            });
          },
          color: btncolorc[0] == 1 ? primaryPurple : Color(0xFFD1D1D1),
          minWidth: 80.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                width: 1.0,
                color: Colors.black26,
              )),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 80.0,
                minHeight: btnHeight1,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.crop_portrait,
                color: btncolorc[0] == 1 ? Colors.white : Color(0xFF5F6368),
                size: 24.0,
              ),
            ),
          ),
        ),
        // SizedBox(width: isMobile? 10.0.w : 100.0),
        // const SizedBox(width: 90.0),
        MaterialButton(
          onPressed: () {
            setState(() {
              // btncolorc = List.filled(btncolorc.length, 0);
              btncolorc[1] = 1;
              btncolorc[0] = 0;
              print(btncolorc);
            });
          },
          color: btncolorc[1] == 1 ? primaryPurple : Color(0xFFD1D1D1),
          minWidth: 80.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side:  BorderSide(width: 1.0, color: Colors.black26)),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 80.0,
                minHeight: btnHeight1,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.mail,
                color: btncolorc[1] == 1 ? Colors.white : Color(0xFF5F6368),
                size: 24.0,
              ),
            ),
          ),
        ),
        // FlatButton(
        //   key: ValueKey(s1),
        //   minWidth: 30.0,
        //   color: s1.color,
        //   child: Text(s1.text),
        //   onPressed: () {
        //     setState(() {
        //       s1.color = primaryclr;
        //     });
        //   },
        // ),
        // FlatButton(
        //   key: ValueKey(s2),
        //   minWidth: 30.0,
        //   color: s2.color,
        //   child: Text(s2.text),
        //   onPressed: () {
        //     setState(() {
        //       s2.color = primaryclr;
        //     });
        //   },
        // )
      ],
    );
    // }
  }
}


