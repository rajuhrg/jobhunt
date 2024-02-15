
import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:jobhunt/about/about_yourself.dart';
import 'package:jobhunt/forgotpwd/changepwd/change_pwd.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

// import 'package:pinput/pin_put/pin_put.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive/responsive.dart';
// import 'package:responsive/responsive_row.dart';

// import '../changepwd.dart';

class ReadOtp extends StatefulWidget {
  ReadOtp({Key? key, required this.type}) : super(key: key);

  Map type;
  @override
  State<ReadOtp> createState() => _ReadOtpState();
}

class _ReadOtpState extends State<ReadOtp> {
  late String type;
  String nextPage = "";
  Widget signInresponseWidget = const Text("");
  String otpEntered = "";

  // TextEditingController textEditingController = TextEditingController();
  // // ..text = "123456";
  // // ignore: close_sinks
  // StreamController<ErrorAnimationType>? errorController;

  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(235, 236, 237, 1),
    borderRadius: BorderRadius.circular(5.0),
  );

  Color lightBoxBlue = const Color(0xFFF4F5F9);

  @override
  void initState() {
    type = widget.type["type"];
    nextPage = widget.type["next"];
    // errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print ( "read otp $type $nextPage");
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    return Scaffold(
        body: Container(
      color: forgotpwdOutercolor,
      child: Center(
        child: SingleChildScrollView(
          child: ResponsiveRow(
            alignment: WrapAlignment.center,
            children: [
              FlexWidget(
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.08,
                        horizontal: screenWidth * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text("read otp"),

                        Image.asset(
                          (type == "phone")? "assets/images/readotp.png": "assets/images/readmailotp.png",
                          fit: BoxFit.scaleDown,
                          // height: isMobile ? 150 : 200,
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          (type == "phone")
                              ? "Check your message"
                              : "Check your mail",
                          style: TextStyle(
                              color: forgotcolor1,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10),
                          child: Center(
                            child: Text(
                              (type == "phone")
                                  ? "We have sent a verification code to your message to reset your password."
                                  : "We have sent a  verification code to your  email to reset your password. ",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        signInresponseWidget,
                        SizedBox(
                          height: 20,
                        ),

                        // Padding(
                        //   padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        //   child: PinCodeTextField(
                        //     appContext: context,
                        //     length: 4,
                        //     keyboardType: TextInputType.number,
                        //     onChanged: (val) {},
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,

                        //     pinTheme: PinTheme(
                        //       shape: PinCodeFieldShape.box,
                        //       // borderRadius: BorderRadius.circular(5),
                        //       fieldHeight: 50,
                        //       fieldWidth: 40,

                        //     selectedFillColor: lightBoxBlue,
                        //     activeFillColor: lightBoxBlue,
                        //     inactiveFillColor: lightBoxBlue,
                        //     errorBorderColor: Colors.black45,

                        //     ),
                        //     animationDuration: const Duration(milliseconds: 300),
                        //     enableActiveFill: true,
                        //     errorAnimationController: errorController,
                        //     controller: textEditingController,

                        //     onCompleted: (val) {},
                        //     beforeTextPaste: (text) {
                        //       print("Allowing to paste $text");
                        //       //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //       //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        //       return true;
                        //     },
                        //   ),
                        // ),

                        // OtpTextField(
                        //   numberOfFields: 4,
                        //   borderColor: otpFieldBorderColor,
                        //   showFieldAsBox: true,
                        //   onCodeChanged: (String code){
                        //     print("otp code: $code");
                        //     otpEntered = code;
                        //   },
                        //   onSubmit: (String vCode){
                        //     print("otp codeSubmit : $vCode");
                        //     otpEntered = vCode;
                        //   },
                        //   textStyle: const TextStyle(fontSize: 17),

                        // ),

                        OtpPinField(
                          otpPinFieldInputType: OtpPinFieldInputType.none, // OtpPinFieldInputType.none || OtpPinFieldInputType.password || OtpPinFieldInputType.custom
                          // otpPinInputCustom:  "\$", // A String which you want to show when you use 'inputType: OtpPinFieldInputType.custom, '
                          onSubmit: (text) {
                            print(
                                'Entered pin is $text'); // return the entered pin
                                otpEntered = text;
                          },

                          // to decorate your Otp_Pin_Field
                          otpPinFieldStyle:  OtpPinFieldStyle(
                            defaultFieldBorderColor: otpFieldBorderColor, // border color for inactive/unfocused Otp_Pin_Field
                            activeFieldBorderColor: primaryColor, // border color for active/focused Otp_Pin_Field
                            defaultFieldBackgroundColor: lightBoxBlue, // Background Color for inactive/unfocused Otp_Pin_Field
                            activeFieldBackgroundColor: Colors.white, 
                            fieldBorderRadius: 5,// Background Color for active/focused Otp_Pin_Field
                            
                          ),
                        
                          // fieldCount: 4,  // no of pin field
                          
                          maxLength: 4,
                          highlightBorder:
                              true, // want to highlight focused/active Otp_Pin_Field
                          fieldWidth: 50, //to give width to your Otp_Pin_Field
                          fieldHeight:
                              50, //to give height to your Otp_Pin_Field
                          keyboardType: TextInputType.number, // type of keyboard you want
                          autoFocus: true, //want to open keyboard or not
                          // predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                          //use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                          otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
                            
                        ),
                        // OTPTextField(
                        //   length: 4,
                        //   width: double.infinity,
                        //   // fieldWidth: (screenWidth < 400)?50 : 80,

                        //   style: TextStyle(
                        //       fontSize: 17
                        //   ),
                        //   textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        //   fieldStyle: FieldStyle.box,
                        //   onCompleted: (String pin) {
                        //     print("Completed:  $pin");
                        //     otpEntered = pin.toString();
                        //   },
                        // ),
                        //     GestureDetector(
                        //    child:  PinPut(
                        //     // validator: (s) {
                        //     //   if (s?.contains('1')) {
                        //     //     return null;
                        //     //   }
                        //     //   return 'NOT VALID';
                        //     // },
                        //     useNativeKeyboard: false,
                        //     autovalidateMode: AutovalidateMode.always,
                        //     withCursor: true,
                        //     fieldsCount: 5,
                        //     fieldsAlignment: MainAxisAlignment.spaceAround,
                        //     textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
                        //     eachFieldMargin: EdgeInsets.all(0),
                        //     eachFieldWidth: 45.0,
                        //     eachFieldHeight: 55.0,
                        //     onSubmit: (String pin) {}, // => _showSnackBar(pin),
                        //     // focusNode: _pinPutFocusNode,
                        //     controller: _pinPutController,
                        //     submittedFieldDecoration: pinPutDecoration,
                        //     selectedFieldDecoration: pinPutDecoration.copyWith(
                        //       color: Colors.white,
                        //       border: Border.all(
                        //         width: 2,
                        //         color: const Color.fromRGBO(160, 215, 220, 1),
                        //       ),
                        //     ),
                        //     followingFieldDecoration: pinPutDecoration,
                        //     pinAnimationType: PinAnimationType.scale,
                        //   ),
                        // ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (otpEntered == "1234") {
                              signInresponseWidget = const Text("");
                              if (nextPage == "aboutYou") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutYourSelf()));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ChangePassword()));
                              }
                            } else {
                              showError();
                            }
                            setState(() {});
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(btnRadious1)),
                          padding:const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: btnGradient,
                                borderRadius: BorderRadius.circular(btnRadious1)),
                            child: Container(
                              constraints: BoxConstraints(
                                  // maxWidth: 300.0,
                                  minHeight: btnHeight1),
                              alignment: Alignment.center,
                              child: const Text(
                                "Verify",
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

                        MaterialButton(
                          onPressed: () {
                            // showError();
                            // setState(() {});
                          },
                          hoverElevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(btnRadious1),
                            side: const BorderSide(
                              width: 1.0,
                              color: pbtnColor1,
                            ),
                          ),
                          padding: EdgeInsets.all(0.0),
                          color: Color(0xFFF1F1F1),
                          child: Ink(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(btnRadious1)),
                            child: Container(
                              constraints: BoxConstraints(
                                  //  maxWidth: 300.0,
                                  minHeight: btnHeight1),
                              alignment: Alignment.center,
                              child: Text(
                                "Resend OTP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryPurple,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // await simpleLoading("Please wait...", loader, 0, context);
                        // closeSmartDialog(loader,2000);

                        SizedBox(height: screenHeight * 0.02),
                         const Text(
                              "Did not receive the email?",
                              style: TextStyle(
                                  color: Color(0xFF5F6368), fontSize: 13.0),
                            ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           const Text(
                              "Check you spam filter. ",
                              style: TextStyle(
                                  color: Color(0xFF5F6368), fontSize: 13.0),
                            ),
                            TextButton(
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotSuc1()));
                                },
                                child: Text(
                                  "Help",
                                  style: TextStyle(
                                      color: primaryPurple, fontSize: 14, decoration: TextDecoration.underline , ),
                                      
                                )),
                          ],
                        ),
                        // SizedBox(height: screenHeight * 0.015),
                        // Text("Please try email id or sign up"),
                      ],
                    ),
                  ),
                ),
                xs: 11,
                sm: 10,
                md: 6,
                lg: 5,
                xl: 4,
                xxl: 4,
                xxxl: 4,
                xsLand: 11,
                smLand: 10,
                mdLand: 6,
                lgLand: 4,
                xlLand: 4,
                xxlLand: 3,
                xxxlLand: 3,
              ),
            ],
          ),
        ),
      ),
    ));
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
              color: Colors.red,
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
                child: Text(
              "Invaild OTP entered. Please try again.",
              style:
                  TextStyle(color: Colors.red, overflow: TextOverflow.visible),
            )),
          ],
        ));
  }
}
