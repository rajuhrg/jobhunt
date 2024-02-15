
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobhunt/appbar/appbar.dart';
import 'package:jobhunt/appbar/navdrawer.dart';
import 'package:jobhunt/company/dashboard/dashBoardCompany.dart';
import 'package:jobhunt/navigators.dart';

// import 'package:jobhunt/profile/profile.dart';
// import 'package:jobhunt/pages/profile_dashboard.dart';

// import 'package:jobhunt/signin/signup/signup.dart';
// import 'package';
// import 'package:jobhunt/home/utils/colors.dart';
// import 'package:jobhunt/home/utils/constantss.dart';

import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/const_widget.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:jobhunt/utils/getdeviceinfo.dart';
import 'package:responsive/responsive.dart';

class SignInComp extends StatelessWidget {
  const SignInComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _SigninFull();
  }
}

class _SigninFull extends StatefulWidget {
  const _SigninFull({Key? key}) : super(key: key);

  @override
  State<_SigninFull> createState() => _SigninFullState();
}

class _SigninFullState extends State<_SigninFull> {
  final TextEditingController _userNameKey = TextEditingController();
  final TextEditingController _userPasswordKey = TextEditingController();

  var deviceid1 = "";
  bool keepSignIn = false;

  @override
  void initState() {
    // getDeviceId();
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
          title: const AppbarW(f: "company"),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: pColor),
        ),
        drawer: (a < 4) ? const NavDrawer(type: {"from": typecomp}) : null,
        body: Container(
          color: dashBoarbgColor,
          height: screenHeight,
          width: screenWidth,
          padding: EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: BsRow(
              color: Colors.black26,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                BsCol(
                  visibility: BsVisibility.hiddenSm,
                  sizes: const ColScreen(
                    xs: Col.col_12,
                    sm: Col.col_12,
                    md: Col.col_6,
                  ),
                  child: Container(
                    height: screenHeight - 56,
                    width: screenWidth,
                    // decoration: const BoxDecoration(
                    //   // color: Colors.black,
                    //   image: DecorationImage(
                    //     image: AssetImage(
                    //       "assets/images/sin/jobprefman.png",
                    //     ),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    child: Image.asset("assets/images/sin/jobprefman.png", fit: BoxFit.cover,),
                  ),
                ),
                BsCol(
                  sizes: const ColScreen(
                    sm: Col.col_12,
                    xs: Col.col_12,
                    md: Col.col_5,
                  ),
                  child: Container(
                    // height: screenHeight,
                    // width: (a < 4) ? double.infinity : 600,
                    // decoration: BoxDecoration(
                    //   image: (a <= 2)
                    //       ? const DecorationImage(
                    //           image: AssetImage(
                    //             "assets/images/sin/testimg.png",
                    //           ),
                    //           fit: BoxFit.cover,
                    //         )
                    //       : null,
                    // ),
                    child: Center(
                      child: BsContainer(

                        padding: EdgeInsets.symmetric(

                          horizontal: (screenWidth < 520)
                              ? screenWidth * 0.04
                              : screenWidth * (a * 0.01),
                        ),
                        // fluid: BsFluid.sm,
                        child: Card(
                          // elevation: 10,
                          // color: (a <= 2)
                          //     ? Colors.white
                          //     // Color(0xE5FFFFFF)
                          //     : Colors.white,
                          child: BsContainer(

                            padding: EdgeInsets.all((a<3)?20 : screenWidth * 0.02),
                                  fluid: BsFluid.md,
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
                                            "Sign In your account to continue ($typecomp) $a",
                                            style: TextStyle(
                                                color: textColor, fontSize: 15.0),
                                          )),
                                      const SizedBox(
                                        height: 30.0,
                                      ),

                                      Form(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: inputBoxHeith,
                                              child: TextFormField(
                                                controller: _userNameKey,
                                                onChanged: (val) {},
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                  labelText: "User Name",
                                                  border: outlineInputborder,
                                                  suffixIcon: const Icon(
                                                      Icons.account_circle),
                                                  labelStyle:
                                                      const TextStyle(fontSize: 16.0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: screenHeight * 0.02),
                                            SizedBox(
                                              height: inputBoxHeith,
                                              child: TextFormField(
                                                controller: _userPasswordKey,
                                                onChanged: (val) {},
                                                obscureText: true,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                  labelText: "Password",
                                                  border: outlineInputborder,
                                                  suffixIcon: const Icon(Icons.visibility),
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
                                              Navigators.pushNav(context,
                                                  "forgotpwd1", {"from": typecomp});
                                            },
                                            child:const Text(
                                              "Forgot Password?",
                                              style: TextStyle(
                                                color: primaryColor2,
                                              ),
                                              // textAlign: TextAlign.end,
                                              // overflow: TextOverflow.visible,
                                            ),
                                          )
                                        ],
                                      ),

                                      SizedBox(height: screenHeight * 0.03),
                                      Ink(
                                        decoration: BoxDecoration(
                                          gradient: btnGradient,
                                          borderRadius:
                                              BorderRadius.circular(btnRadious1),
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            signInFun();
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(btnRadious1),
                                          ),
                                          child: Container(
                                            constraints:
                                                BoxConstraints(minHeight: btnHeight1),
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
                                            "Not a member?",
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
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          child: const Text(
                                            "Create Account",
                                          ),
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              onPrimary: textColor,
                                              primary: secondaryColor2),
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.03),

                                      // Text("text1 "),
                                      // Text("text1 "),
                                      // Text("text1 "),
                                      // Text("text1 "),
                                    ],
                                  ),
                                ),
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
    // })
    // ),
  }

  signInFun() async {
    String uname = _userNameKey.text;
    String pwd = _userPasswordKey.text;
    Map deviceData = await GetDeviceInfo().getdeviceRawData();
     // getDeviceId();
    Map logindata = {"uname": uname, "pwd": pwd};
    Map devicedata = {"devicedata": deviceData, "logindata": logindata};
    // var response =
    //     await HttpRequests().requests(devicedata, "/signin/signin.php", 5, 3);
    // print("here:  $response");
    try {
    //   Map resp = jsonDecode(response.toString());
    //   if (resp["suc"] == 1) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashBoardCompany()),
            (route) => false);
      // }
    } catch (e) {
      print(e);
    }
  }

   getDeviceId() {
    deviceid1 = GetDeviceInfo().getDeviceId();
  }
}
