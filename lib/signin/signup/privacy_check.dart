import 'package:flutter/material.dart';
import 'package:jobhunt/forgotpwd/readotp/readotp.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';

class PrivacyCheck extends StatefulWidget {
  PrivacyCheck({Key? key}) : super(key: key);

  @override
  State<PrivacyCheck> createState() => _PrivacyCheckState();
}

class _PrivacyCheckState extends State<PrivacyCheck> {
  late Widget signInresponseWidget;
  String isPrivacyOk = "";
  String mobno = "";
  late double screenWidth;
  late double screenHeight;
  static const  Color textColor1 =  Color(0xFF202124);

  @override
  void initState() {
     signInresponseWidget = Column(children: [
      Text(
        "Enter your phone number",
        style: TextStyle(
            color: primaryColor, fontSize: 20.0, fontWeight: FontWeight.w400),
      ),
      SizedBox(height: 20.0),
      Container(
        color: Color(0xFFF4F5F9),
        padding: EdgeInsets.all(15.0),
        child: Flex(
          direction: Axis.horizontal,
          children: const [
            Icon(
              Icons.lock,
              color: textColor1,
            ),
            SizedBox(width: 10.0,),
            Flexible(
              child: Text(
                "We take privacy issues seriously. You can be sure that your personal data is securely protected.",
                style: TextStyle(color: textColor1, fontSize: 14.0),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      )
    ]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
     screenWidth = mediaquerySize.width;
     screenHeight = mediaquerySize.height;
    // print("moved to password next $type");
    // print(widget.type);
    return Scaffold(
      body: Container(
        color: forgotpwdOutercolor,
        child: Center(
          child: SingleChildScrollView(
            child: ResponsiveRow(
              children: [
                FlexWidget(
                  child: Column(children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/sin/mob1.png",
                            ),
                            SizedBox(height: 20.0),
                            signInresponseWidget,
                            SizedBox(height: 25.0),
                            SizedBox(
                              height: inputBoxHeith,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Mobile No",
                                    border: OutlineInputBorder(),
                                    suffixIcon:
                                        Icon(Icons.stay_current_portrait)),
                                onChanged: (v) {
                                  mobno = v.toString();
                                },
                              ),
                            ),
                            SizedBox(height: 20.0),
                            MaterialButton(
                              onPressed: () {
                                if (mobno == "7975781060") {
                                  setState(() {
                                    signInresponseWidget = Text("");
                                  });
                                  Map type = Map();
                                  type["type"] = "phone";
                                  type["next"] = "aboutYou";
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReadOtp(type: type)));
                                } else {
                                  showError();
                                  setState(() {});
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(btnRadious1)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: btnGradient,
                                    borderRadius: BorderRadius.circular(btnRadious1)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      // maxWidth: 300.0,
                                       minHeight: btnHeight1),
                                  alignment: Alignment.center,
                                  child: Text(
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
                            SizedBox(height: 20.0),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Do you need help?",
                                  style: TextStyle(
                                      color: Color(0xFF5F6368), fontSize: 14.0),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  xs: 11,
                  sm: 9,
                  md: 6,
                  lg: 5,
                  xl: 4,
                  xxl: 4,
                  xxxl: 4,
                  xsLand: 10,
                  smLand: 8,
                  mdLand: 5,
                  lgLand: 4,
                  xlLand: 4,
                  xxlLand: 4,
                  xxxlLand: 3,
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
          children: const [
            Icon(
              Icons.error,
              color: Color(0xFFE64C3C),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
                child: Text(
              "Enter Vaild Mobile Number",
              style:
                  TextStyle(color: Colors.red, overflow: TextOverflow.visible),
            )),
          ],
        ));
  }
}
