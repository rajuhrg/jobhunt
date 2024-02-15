import 'package:flutter/material.dart';
// import 'package:jobhunt/forgotpwd/forgotpwd1.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/const_widget.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';

import 'readotp/readotp.dart';


class ForgotpwdNext extends StatefulWidget {
    const ForgotpwdNext({Key? key, required this.type}) : super(key: key);
  final String  type;

  @override
  State<ForgotpwdNext> createState() => _ForgotpwdNextState();
}

class _ForgotpwdNextState extends State<ForgotpwdNext> {
  String phoned =
      "Don’t worry we can help you out! Enter the mobile number associated with your accout and we’ll send a message with verification code to reset your password. ";
  String emaild =
      "Don’t worry we can help you out! Enter the email associated with your accout and we’ll send an email with verification code to reset your password. ";
  String imageFile = "assets/images/forgotpwd2.png";
  TextEditingController userid = TextEditingController();
  Widget signInresponseWidget = const Text("");
  String mobileno = "";

   late String type;

  @override
  void initState() {
    type = widget.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    print("moved to password next $type");
    print(widget.type);
    return Scaffold(
      body: Container(
        color: forgotpwdOutercolor,
        child: Center(
          child: SingleChildScrollView(
            child: ResponsiveRow(
              children: [
                FlexWidget(
                  child: Column(
                    children: [
                      Card(
                          elevation: 10,
                          child: Padding(
                             padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.08,
                                    horizontal: screenWidth * 0.05),
                            child: Column(
                              children: [
                                Image.asset(
                                  // "assets/images/forgotpwd2.png/useridfailed.png",
                                  "$imageFile",
                                  // width: 100.0.sp,
                                  // height: 300.0,
                                ),
                                signInresponseWidget,
                                Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                      color: forgotcolor1,
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  (type == "phone") ? phoned : emaild,
                                  style: TextStyle(
                                      color: Color(0xFF6A6A6A),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                SizedBox(
                                  height: inputBoxHeith,
                                  child: TextFormField(
                                    controller: userid,
                                    keyboardType: (type == "phone")
                                        ? TextInputType.number
                                        : TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        labelText: (type == "phone")
                                            ? "Mobile No"
                                            : "Email ID",
                                        border: outlineInputborder,
                                        suffixIcon:   (type == "phone")? const Icon(Icons.stay_current_portrait): const Icon(Icons.email),
                                        
                                        ),
                                    onChanged: (v) {
                                      mobileno = v.toString();
                                    },
                                   
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    if (userid.text == "7975781060" ||
                                        userid.text == "rajuavs777@gmail.com") {
                                      setState(() {
                                        signInresponseWidget = const Text("");
                                      });
                                      Map typeMap = {};
                                      typeMap["type"] = type;
                                      typeMap["next"] = "";
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ReadOtp(
                                                    type: typeMap,
                                                  )));
                                    } else {
                                      showError();
                                      imageFile = "assets/images/useridfailed.png";
                                      setState(() {});
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(btnRadious1)),
                                  // padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: btnGradient,
                                        borderRadius:
                                            BorderRadius.circular(btnRadious1)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          // maxWidth: 300.0,
                                           minHeight: btnHeight1),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Send Code",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                 SizedBox(height: screenHeight * 0.02),
                                   TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Do you need help?",
                                        style: TextStyle(
                                            color: Color(0xFF9B9B9B),
                                            fontSize: 14.0),
                                      ))
                              ],
                            ),
                          )),
                    ],
                  ),
                  xs: 11,
                  sm: 10,
                  md: 6,
                  lg: 5,
                  xl: 4,
                  xxl: 4,
                  xxxl: 4,
                  xsLand: 10,
                  smLand: 8,
                  mdLand: 5,
                  lgLand: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
 
  }

  void showError() {
    signInresponseWidget = Container(
        color: Colors.grey.shade300,
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error,
              color: Color(0xFFE64C3C),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Flexible(
                child: Text(
              (type == "phone") ? "Mobile Number not found" : "Email not found",
              style:
                  TextStyle(color: Colors.red, overflow: TextOverflow.visible),
            )),
          ],
        ));
  }
}
