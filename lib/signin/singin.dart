import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobhunt/appbar/appbar.dart';
import 'package:jobhunt/appbar/navdrawer.dart';
import 'package:jobhunt/navigators.dart';
import 'package:jobhunt/pages/dashboard_template.dart';
import 'package:jobhunt/pages/profile/model/request_server.dart';

// import 'package:jobhunt/profile/profile.dart';
import 'package:jobhunt/pages/profile_dashboard.dart';

// import 'package:jobhunt/signin/signup/signup.dart';
// import 'package';
// import 'package:jobhunt/home/utils/colors.dart';
// import 'package:jobhunt/home/utils/constantss.dart';
import 'package:jobhunt/social.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/const_widget.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:jobhunt/utils/getdeviceinfo.dart';
import 'package:responsive/responsive.dart';

import 'bloc/signin_bloc.dart';

class SingIn extends StatelessWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SigninFull();
  }
}

class SigninFull extends StatefulWidget {
  const SigninFull({Key? key}) : super(key: key);

  @override
  State<SigninFull> createState() => _SigninFullState();
}

class _SigninFullState extends State<SigninFull> {
  final TextEditingController _userNameKey = TextEditingController();
  final TextEditingController _userPasswordKey = TextEditingController();

  var deviceid1 = "";
  bool keepSignIn = false;
  bool isSignInClicked=false;

  @override
  void initState() {
    // getDevideId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    var a = Responsive.gridSize(screenWidth);
    return Scaffold(
        appBar: AppBar(
          title: const AppbarW(f:"candidate"),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: pColor),
        ),
        drawer: (a < 4) ? const NavDrawer(type: {"from":typecand}) : null,
        body:
            // Container(
            //     width: mediaquerySize.width,
            //     height: mediaquerySize.height,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage(
            //           "assets/images/sin/testimg.png",
            //         ),
            //         fit: BoxFit.fitHeight,
            //       ),
            //     ),
            //     child:
            //   LayoutBuilder(builder: (context, constraints) {
            // screenHeight = constraints.maxHeight;
            Container(
          padding: EdgeInsets.all(0.0),
          width: screenWidth,
          height: screenHeight,
          // children: [
          child: ResponsiveRow(
              columnsCount: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Visibility(
                  visible: (a > 2) ? true : false,
                  child: FlexWidget(
                    child: Container(
                      height: screenHeight,
                      decoration: const BoxDecoration(
                        // color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/sin/testimg.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    xs: 12,
                    sm: 12,
                    md: 6,
                    lg: 5,
                    xl: 6,
                    xxl: 6,
                    xxxl: 6,
                    xsLand: 12,
                    smLand: 6,
                    mdLand: 6,
                    lgLand: 6,
                    xlLand: 6,
                    xxlLand: 6,
                  ),
                ),
                FlexWidget(
                  child: Container(
                    height: screenHeight,
                    width: (a < 4) ? double.infinity : 600,
                    decoration: BoxDecoration(
                      image: (a <= 2)
                          ? const DecorationImage(
                              image: AssetImage(
                                "assets/images/sin/testimg.png",
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 50,
                            // horizontal: screenWidth * 0.02
                            horizontal: (screenWidth < 520)
                                ? screenWidth * 0.04
                                : (a <= 2)
                                    ? screenWidth * 0.1
                                    : screenWidth * (a * 0.01),
                          ),
                          child: Card(
                            elevation: 10,
                            color: (a <= 2)
                                ? Colors.white
                                // Color(0xE5FFFFFF)
                                : Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  // horizontal: screenWidth/2*0.3, //:  screenWidth * 0.03,
                                  horizontal: (screenWidth < 380)
                                      ? screenWidth * 0.02
                                      : screenWidth * 0.03,
                                  vertical: screenHeight * 0.06),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      appname,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: primaryColor,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.015),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Sign In your account to continue $a",
                                        style: TextStyle(
                                            color: textColor, fontSize: 15.0),
                                      )),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  // BlocBuilder<SigninBloc, SigninState>(
                                  //     builder: (context, state) {
                                  //   if (state is SigninErrorState) {
                                  //     return Text(
                                  //       // ignore: unnecessary_string_interpolations
                                  //       "${state.errorMessage}",
                                  //       style: const TextStyle(
                                  //           color: Colors.red),
                                  //     );
                                  //   } else {
                                  //     return Container();
                                  //   }
                                  // }),
                                  BlocListener<SigninBloc, SigninState>(
                                    listener: (context, state) {
                                      if (state is SigninErrorState) {
                                        Text(
                                          "${state.errorMessage}",
                                          style: const TextStyle(
                                              color: Colors.red),
                                        );
                                      }
                                    },
                                    child: Container(),
                                  ),
                                  Form(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: inputBoxHeith,
                                          child: TextFormField(
                                            controller: _userNameKey,
                                            onChanged: (val) {
                                              BlocProvider.of<SigninBloc>(
                                                      context)
                                                  .add(
                                                  SignInTextChangeEvent(
                                                      _userNameKey.text,
                                                      _userPasswordKey.text));
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: "User Name",
                                              border: outlineInputborder,
                                              suffixIcon: const Icon(
                                                  Icons.account_circle),
                                              labelStyle: const TextStyle(
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                        ),
                                        // const SizedBox(
                                        //   height: 10.0,
                                        // ),
                                        SizedBox(height: screenHeight * 0.02),
                                        SizedBox(
                                          height: inputBoxHeith,
                                          child: TextFormField(
                                            controller: _userPasswordKey,
                                            onChanged: (val) {
                                              BlocProvider.of<SigninBloc>(
                                                      context)
                                                  .add(SignInTextChangeEvent(
                                                      _userNameKey.text,
                                                      _userPasswordKey.text));
                                            },
                                            obscureText: true,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: "Password",
                                              border: outlineInputborder,
                                              suffixIcon:
                                                  const Icon(Icons.visibility),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.03),
                                  Wrap(
                                    direction: Axis.horizontal,
                                    //  (screenWidth < 420 ||
                                    //         (a == 3 && screenWidth < 980))
                                    //     ? Axis.vertical
                                    // : Axis.horizontal,
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment:  CrossAxisAlignment.stretch,
                                    // crossAxisAlignment: WrapCrossAlignment.end,
                                    // direction: Axis.horizontal,
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      Flex(
                                        direction: Axis.horizontal,
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            value: keepSignIn,
                                            onChanged: (value) {
                                              print("$value");
                                              setState(() {
                                                keepSignIn = !keepSignIn;
                                              });
                                            },
                                          ),
                                          const Flexible(
                                            child: Text(
                                              "Keep Me logged In",
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Spacer(),
                                      TextButton(
                                        onPressed: () async {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPwd()));
                                          Navigators.pushNav(
                                              context, "forgotpwd1", {"from":typecand});
                                        },
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                            color: primaryColor,
                                          ),
                                          // textAlign: TextAlign.end,
                                          // overflow: TextOverflow.visible,
                                        ),
                                      )
                                      // : SizedBox(
                                      //   width: 150,
                                      //     child: //getForgotButton("expaned"),
                                      //         TextButton(
                                      //       onPressed: () async {
                                      //         // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPwd()));
                                      //       },
                                      //       child: Text(
                                      //         "Forgot Password?",
                                      //         style: TextStyle(
                                      //             color: primaryColor,),
                                      //             textAlign: TextAlign.end,
                                      //       ),
                                      //     ),
                                      //   ),
                                    ],
                                  ),

                                  // SizedBox(
                                  //   width: double.infinity,
                                  //   child: ResponsiveRow(
                                  //     // columnsCount: 2 ,
                                  //     children: [
                                  //     FlexWidget(

                                  //       child:
                                  //       SizedBox(
                                  //         width: double.infinity/2,
                                  //         child: Row(
                                  //           // direction: Axis.horizontal,
                                  //           mainAxisSize: MainAxisSize.min,
                                  //           mainAxisAlignment: MainAxisAlignment.start,
                                  //           children: [
                                  //             Checkbox(
                                  //               value: keepSignIn,
                                  //               onChanged: (value) {
                                  //                 print("$value");
                                  //                 setState(() {
                                  //                   keepSignIn = !keepSignIn;
                                  //                 });
                                  //               },
                                  //             ),
                                  //             const Flexible(
                                  //                 child: Text("Keep Me logged In", style: TextStyle(backgroundColor: Colors.blue),),),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     FlexWidget(

                                  //       child:  SizedBox(
                                  //       width: double.infinity/2,
                                  //         child: TextButton(
                                  //             onPressed: () async {
                                  //               // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPwd()));
                                  //             },
                                  //             child: Text(
                                  //               "Forgot Password?",
                                  //               style: TextStyle(
                                  //                 color: primaryColor,
                                  //               ),
                                  //               textAlign: TextAlign.end,
                                  //             )),
                                  //       ),
                                  //     )
                                  //   ]),
                                  // ),
                                  SizedBox(height: screenHeight * 0.03),
                                  Ink(
                                    decoration: BoxDecoration(
                                      gradient: btnGradient,
                                      borderRadius:
                                          BorderRadius.circular(btnRadious1),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        isSignInClicked = true;
                                        signInFun();
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(btnRadious1),
                                      ),
                                      child: Container(
                                        constraints: BoxConstraints(
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

                                  SizedBox(height: screenHeight * 0.03),
                                  Row(children: <Widget>[
                                    Expanded(
                                      child: Divider(
                                        thickness: 1.0,
                                        color: iconColor,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Text(
                                        "or Sign In using",
                                        style:
                                            TextStyle(color: Color(0xFF9FA2B4)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 1.0,
                                        color: iconColor,
                                      ),
                                    ),
                                  ]),
                                  SizedBox(height: screenHeight * 0.03),
                                  Social(),

                                  SizedBox(height: screenHeight * 0.03),

                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: SizedBox(
                                      child: Flex(
                                        direction: Axis.horizontal,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            "Not a member? ",
                                            style: TextStyle(
                                                color: Color(0xFF374151)),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>const MyHomePage(title: appname)), (route) => false);
                                              Navigators.pushNav(
                                                  context, "signup", {"from":typecand});
                                            },
                                            child: const Text(
                                              "Sign up",
                                              style: TextStyle(
                                                  color: pColor,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )

                                  // Text("text1 "),
                                  // Text("text1 "),
                                  // Text("text1 "),
                                  // Text("text1 "),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  xs: 12,
                  sm: 12,
                  md: 6,
                  lg: 6,
                  xl: 6,
                  xxl: 5,
                  xxxl: 5,
                  xsLand: 12,
                  smLand: 6,
                  mdLand: 4,
                  lgLand: 6,
                  xlLand: 5,
                  xxlLand: 5,
                  xxxlLand: 5,
                ),
              ]),
          // ResponsiveRow(
          //   columnsCount: 12,
          // crossAxisAlignment: WrapCrossAlignment.center,
          //   children: [
          //     FlexWidget(

          //       xs: 12,
          //       sm: 12,
          //       md: 6,
          //       lg: 6,
          //       xl: 6,
          //       xxl: 6,
          //       xxxl: 6,
          //       xsLand: 12,
          //       smLand: 6,
          //       mdLand: 6,
          //       lgLand: 6,
          //       xlLand: 6,
          //       xxlLand: 6,
          //     ),
          //     FlexWidget(

          //       xs: 12,
          //       sm: 12,
          //       md: 6,
          //       lg: 6,
          //       xl: 6,
          //       xxl: 6,
          //       xxxl: 6,
          //       xsLand: 12,
          //       smLand: 6,
          //       mdLand: 6,
          //       lgLand: 6,
          //       xlLand: 6,
          //       xxlLand: 6,
          //     ),
          //   ]),
          // ],
        ));
    // })
    // ),
  }

  signInFun() async {
    String uname = _userNameKey.text;
    String pwd = _userPasswordKey.text;
    Map deviceData = await GetDeviceInfo().getdeviceRawData();
    var deviceId = getDevideId();
    Map logindata = {"uname": uname,"pwd":pwd};
    Map devicedata = {"devicedata":deviceData,"logindata":logindata};
    var response =  await HttpRequests().requests(devicedata, "/signin/signin.php", 5, 3);
    print("here:  $response");
    try{
      Map resp = jsonDecode(response.toString());
      if(resp["suc"] == 1){
        // Navigator.pushAndRemoveUntil(
        //     context,  MaterialPageRoute(builder: (context) =>  DashBoarTemplate()),
        //         (route) => false);
      }
    }catch(e){
      print(e);
    }
  }

  dynamic getDevideId() async{
    deviceid1 = await GetDeviceInfo().getDeviceId().toString();
  }
}
