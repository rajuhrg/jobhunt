import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhunt/navigators.dart';
import 'package:jobhunt/signin/bloc/signin_bloc.dart';
import 'package:jobhunt/signin/singin.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/const_widget.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late int a;
  late double screenWidth;
  late double screenHeight;
  Map pwd = {};
  Widget signInresponseWidget = const Text("");
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    screenWidth = mediaquerySize.width;
    screenHeight = mediaquerySize.height;
     a = Responsive.gridSize(screenWidth);
    return Scaffold(
      body: Container(
        color: forgotpwdOutercolor,
        child: Center(
          child: SingleChildScrollView(
            child: ResponsiveRow(
              children: [
                FlexWidget(
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        vertical: screenHeight * 0.08,
                        horizontal: screenWidth * 0.05),
                      
                      child: Column(
                        children: [

 Image.asset(
                            "assets/images/createnewpwd.png",
                            fit: BoxFit.scaleDown,
                            // height: (a==1) ? 150 : 200,
                          ),
                          // SizedBox(height: isMobile ? 2.0.h : 20.0),
                          Text(
                            "Create new password",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          // SizedBox(height: (a==1) ? 2.0.h : 20.0),
                          Text(
                            "We have sent a  verification code to your  email to reset your password. ",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: textColor, fontSize: 14.0),
                          ),
                          // SizedBox(height: isMobile ? 2.0.h : 20.0),

                          signInresponseWidget,
                          SizedBox(height: screenHeight * 0.02),
                          SizedBox(
                            height: inputBoxHeith,
                            child: TextFormField(
                              
                              // controller: userid,
                              // keyboardType: (type == "phone")
                              //     ? TextInputType.number
                              //     : TextInputType.emailAddress,
                              decoration:   InputDecoration(
                                  labelText: "New Password",
                                  border: outlineInputborder,
                                  suffixIcon: const Icon(Icons.visibility)),
                              onChanged: (v) {
                                pwd["pwd1"] = v.toString();
                              },
                            ),
                          ),
                          SizedBox(height: (a==1) ? screenHeight * 0.02 : 20.0),
                          SizedBox(
                            height: inputBoxHeith,
                            child: TextFormField(
                              obscureText: true,
                              decoration:  InputDecoration(
                                  labelText: "Confirm New Password",
                                  border: outlineInputborder, 
                                  suffixIcon: const Icon(Icons.visibility_off_sharp)),
                              onChanged: (v) {
                                pwd["pwd2"] = v.toString();
                              },
                            ),
                          ),
                          const   SizedBox(height: 20),
                         const  Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Both passwords must match",
                                style: TextStyle(color: Color(0xFF5F6368), fontSize: 14.0),
                              )),
                          SizedBox(height: (a==1) ? screenHeight * 0.02 : 20.0),
                          MaterialButton(
                            hoverElevation: 10,
                              onPressed: () {
                                if (pwd.isNotEmpty) {
                                  if (pwd["pwd1"].toString() == pwd["pwd2"].toString()) {
                                    signInresponseWidget = const Text("");
                                    changeSuccess();
                                  } else {
                                    showError("Both passwords didn’t match. Try again.");
                                  }
                                } else {
                                  showError("Please Enter Password");
                                }
                                setState(() {

                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(btnRadious1)),
                              padding:const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: btnGradient,
                                    borderRadius: BorderRadius.circular(btnRadious1)),
                                child: Container(
                                  constraints:
                                      BoxConstraints(
                                        // maxWidth: 300.0,
                                       minHeight: btnHeight1),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Reset Password",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )),

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
                )
                
                
                ],
                ),
          ),
        ),
      ),
    );
  }


  void showError(String s) {
    signInresponseWidget = Container(
        color: Colors.grey.shade300,
        padding: const EdgeInsets.all(12.0),
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
              s,
              style:
                 const  TextStyle(color: Colors.red, overflow: TextOverflow.visible),
            )),
          ],
        ));
  }

  
  void changeSuccess() {
    AwesomeDialog(
      useRootNavigator: true,
        context: context,
        width: (a == 1)? screenWidth * 0.80 : 600.0,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        // title: 'Succes',

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text("Your password has been updated"),
              const SizedBox(height: 20.0,),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10.0)),
                padding: const EdgeInsets.all(0.0),
                onPressed: () {
                  // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const SingIn()), (route) => false);
                  // Navigators.pushNav(context, "signin", {});
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BlocProvider(create: (context)=>SigninBloc(), child: const SingIn(),)), (route) => false);
                },
                child: Ink(
                  decoration: BoxDecoration(
                      gradient:btnGradient,
                      borderRadius:
                      BorderRadius.circular(btnRadious1)),
                  child: Container(
                    constraints: BoxConstraints(
                        // maxWidth: 250.0, 
                        minHeight: btnHeight1),
                    alignment: Alignment.center,
                    child: const Text(
                      "Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    ).show();

  }
}
