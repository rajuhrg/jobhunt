// import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bs_flutter/bs_flutter.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobhunt/appbar/appbar.dart';
import 'package:jobhunt/appbar/navdrawer.dart';
import 'package:jobhunt/company/demo/request_demo.dart';
import 'package:jobhunt/pages/profile_dashboard.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/const_widget.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/logic.dart';
import 'package:sizer/sizer.dart';

class CompanyHome extends StatefulWidget {
  CompanyHome({Key? key}) : super(key: key);
  String title = appname;

  @override
  State<CompanyHome> createState() => _HomeState();
}

class _HomeState extends State<CompanyHome>
    with SingleTickerProviderStateMixin {
  String _offlinemessage = '';
  Widget sizedbox035 = const SizedBox(
    height: 35,
  );

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _slidetrasition = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, 0.5),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    var a = Responsive.gridSize(screenWidth).toInt();
    sizedbox035 = SizedBox(
      height: screenHeight * 0.035,
      width: (a <= 2) ? 20 : double.infinity,
    );
    return Scaffold(
        appBar: AppBar(
          title: const AppbarW(f: "company"),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: pColor),
        ),
        drawer: (a < 4) ? const NavDrawer(type: {"from": typecomp}) : null,
        body:
            // LayoutBuilder(builder: (context, constraints) {
            //     maxW = constraints.maxWidth;
            //     i1 = (a <= 2) ? maxW / 1.2 : maxW / 2;
            //     var i2 = (a <= 2) ? i1 : maxW - i1;
            //     return
            SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    BootstrapContainer(
                      padding: EdgeInsets.symmetric(horizontal: 9.0.w),
                      fluid: false,
                      children: [
                        BsRow(
                          children: [
                            BsCol(
                              sizes: const ColScreen(
                                xs: Col.col_12,
                                sm: Col.col_12,
                                md: Col.col_12,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                  BsRow(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    // alignment: Alignment.center,
                                    children: [
                                      BsCol(
                                        sizes: const ColScreen(
                                          xs: Col.col_11,
                                          sm: Col.col_11,
                                          md: Col.col_6,
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: 'Hire Experts & \n',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: (a < 2)
                                                          ? 13.0.sp
                                                          : 10.0.sp,
                                                      color: primaryBlue),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: 'Get your job done! ',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: (a <= 2) ? 20.0.sp : 22.0,
                                              ),
                                              Text(
                                                "$a Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rutrum diam eget neque porta, dapibus ultricies justo pretium. Nunc consequat velit quis ligula accumsan, quis pellentesque nulla dignissim. Ut molestie metus non rhoncus porttitor. ",
                                                overflow: TextOverflow.visible,
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: otpFieldBorderColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.normal,
                                                    fontFamily: "RobotoMono"),
                                              ),
                                              const SizedBox(
                                                height: 20.0,
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestDemo()));
                                                },
                                                textColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(8.0)),
                                                padding: EdgeInsets.all(0.0),
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                      gradient: btnGradient,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0)),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                        maxWidth: 170.0,
                                                        minHeight: btnHeight1),
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      'Request for Demo',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: "Karla"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      BsCol(
                                        alignment: (a < 3)
                                            ? Alignment.center
                                            : Alignment.centerRight,
                                        padding: EdgeInsets.all(20),
                                        sizes: const ColScreen(
                                          xs: Col.col_11,
                                          sm: Col.col_11,
                                          md: Col.col_6,
                                        ),
                                        child: Container(
                                          // padding: const EdgeInsets.all(20.0),
                                          constraints: BoxConstraints(maxWidth: 350),
                                          child: Image.asset(
                                            "assets/images/company/home1.png",
                                            fit: BoxFit.fill,

                                            // width: 200
                                            // width: 100,
                                            width: 40.0.w,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  BsRow(
                                    alignment: Alignment.center,
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      BsCol(
                                        sizes: const ColScreen(
                                          xs: Col.col_12,
                                          sm: Col.col_12,
                                          md: Col.col_12,
                                          lg: Col.col_10,
                                          xl: Col.col_10,
                                        ),
                                        child: Card(
                                          elevation: 8,
                                          // style: BsCardStyle(),
                                          child: BsRow(
                                            gutter: EdgeInsets.all(5),
                                            padding: EdgeInsets.symmetric(vertical: 20),
                                            alignment: Alignment.center,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              BsCol(
                                                sizes: const ColScreen(
                                                    xs: Col.col_11,
                                                    sm: Col.col_11,
                                                    md: Col.col_4,
                                                    lg: Col.col_3),
                                                child: SizedBox(
                                                  height: inputBoxHeith,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "Job Title or Skills",
                                                      border: outlineInputborder4,
                                                      prefixIcon:
                                                          const Icon(Icons.work),
                                                      // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                                    ),
                                                    onChanged: (v) {},
                                                  ),
                                                ),
                                              ),
                                              BsCol(
                                                sizes: const ColScreen(
                                                  xs: Col.col_11,
                                                  sm: Col.col_11,
                                                  md: Col.col_3,
                                                ),
                                                child: SizedBox(
                                                  height: inputBoxHeith,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      labelText: "Location",
                                                      border: outlineInputborder4,
                                                      suffixIcon: const Icon(Icons
                                                          .keyboard_arrow_down),
                                                      prefixIcon: const Icon(
                                                          Icons.location_on),
                                                      // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                                    ),
                                                    onChanged: (v) {},
                                                  ),
                                                ),
                                              ),
                                              BsCol(
                                                sizes: const ColScreen(
                                                  xs: Col.col_11,
                                                  sm: Col.col_11,
                                                  md: Col.col_3,
                                                ),
                                                child: SizedBox(
                                                  height: inputBoxHeith,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      labelText: "Experience",
                                                      border: outlineInputborder4,
                                                      suffixIcon: const Icon(Icons
                                                          .keyboard_arrow_down),
                                                      prefixIcon: const Icon(Icons
                                                          .admin_panel_settings),
                                                      // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                                    ),
                                                    onChanged: (v) {},
                                                  ),
                                                ),
                                              ),
                                              BsCol(
                                                sizes: const ColScreen(
                                                  xs: Col.col_11,
                                                  sm: Col.col_11,
                                                  md: Col.col_2,
                                                ),
                                                child: SizedBox(
                                                  width: 150,
                                                  child: MaterialButton(
                                                    onPressed: () {},
                                                    textColor: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8.0)),
                                                    padding: EdgeInsets.all(0.0),
                                                    child: Ink(
                                                      decoration: BoxDecoration(
                                                          gradient: btnGradient,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  8.0)),
                                                      child: Container(
                                                        constraints: BoxConstraints(
                                                            minHeight: btnHeight1),
                                                        alignment: Alignment.center,
                                                        child: const Text('Search'),
                                                      ),
                                                    ),
                                                  ),
                                                  // ElevatedButton(
                                                  //   onPressed: () {  },
                                                  //   child: Container(
                                                  //     decoration: BoxDecoration(
                                                  //       gradient: btnGradient,
                                                  //
                                                  //     ),
                                                  //     constraints: BoxConstraints(
                                                  //         minHeight: btnHeight1),
                                                  //     alignment: Alignment.center,
                                                  //     child: Text("Search",
                                                  //       style: TextStyle(
                                                  //           fontSize: 16,
                                                  //           fontWeight: FontWeight.w700,
                                                  //           fontFamily: "Karla"),),
                                                  //   ),
                                                  // ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  SizedBox(
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Browse candidates\n"
                                        "by Specialism",
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: (a < 3) ? 12.0.sp:(a==4)?10.0.sp : 9.0.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.08,
                                    width: double.infinity,
                                  ),
                                  BsRow(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      BsCol(
                                        alignment: (a < 3)
                                            ? Alignment.center
                                            : Alignment.centerLeft,

                                        sizes: const ColScreen(
                                          xs: Col.col_11,
                                          sm: Col.col_11,
                                          md: Col.col_5,
                                        ),
                                        child: Container(
                                          constraints: const BoxConstraints(maxWidth: 350),
                                          child: Image.asset(
                                            "assets/images/company/home2.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      BsCol(
                                        sizes: const ColScreen(
                                          xs: Col.col_11,
                                          sm: Col.col_11,
                                          md: Col.col_5,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: 'Get 1000+ \nTalented people',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        (a < 2) ? 13.0.sp : 10.0.sp,
                                                    color: textColor),
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.05,
                                            ),
                                            MaterialButton(
                                              onPressed: () {},
                                              textColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8.0)),
                                              padding: EdgeInsets.all(0.0),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                    gradient: btnGradient,
                                                    borderRadius:
                                                        BorderRadius.circular(8.0)),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth: 175.0,
                                                      minHeight: btnHeight1),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    'Upload/register Resume',
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  MaterialButton(
                                    color: Colors.purple,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => // Profile()
                                                  // DashBoarTemplate()
                                                  const ProfileDashBoard()
                                              // SubCategoryScreen()
                                              ));
                                    },
                                    child: const Text(" go to Dash board test "),
                                  ),



                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    BsCol(
                      sizes: const ColScreen(
                        xs: Col.col_12,
                        sm: Col.col_12,
                        md: Col.col_12,
                        lg: Col.col_12,
                        xl: Col.col_12,
                        xxl: Col.col_12,
                      ),
                      child: BsRow(
                        color: fcfcfc,
                        padding: EdgeInsets.symmetric(horizontal: 9.0.w),
                        gutter: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          BsCol(
                            sizes: const ColScreen(
                              xs: Col.col_5,
                              sm: Col.col_5,
                              md: Col.col_3,
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: const [
                                Text("Explorer"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("CompanyHome"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("About Us"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Jobs"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Build Profile"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("SME"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Enterprise"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Contact Us"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("FAQs"),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                          BsCol(
                            sizes: const ColScreen(
                              xs: Col.col_5,
                              sm: Col.col_5,
                              md: Col.col_3,
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Legal"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Privacy Policy"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Terms of service"),
                                SizedBox(
                                  height: 8,
                                ),
                                // Spacer(flex: 1,),
                                SizedBox(
                                  height: 35,
                                ),
                                SizedBox(
                                  height: 8,
                                ),

                                Text("Mail us"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("support@jobhunt.com"),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                          BsCol(
                            sizes: const ColScreen(
                              xs: Col.col_5,
                              sm: Col.col_5,
                              md: Col.col_3,
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                const Text("Subscribe"),
                                const SizedBox(
                                  height: 8,
                                ),
                                const SizedBox(
                                    child: Text(
                                        "Subscribe to get the latest\n jobs from us.")),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: inputBoxHeith,
                                  width: 200.0,
                                  child: TextFormField(
                                    keyboardType:
                                    TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        labelText:
                                        "Write your email address",
                                        labelStyle: const TextStyle(
                                            color: Color(0xFFD1D1D1),
                                            fontWeight: FontWeight
                                                .w700,
                                            fontSize: 12.0),
                                        contentPadding:
                                        const EdgeInsets
                                            .symmetric(
                                            vertical: 2),
                                        border: outlineInputborder,
                                        suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                              "assets/icons/sendicon.png",
                                              height: 35,
                                              // scale: 2,
                                            ))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const Text("Toll Free (India)"),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text("+91 9791400132"),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                          BsCol(
                            sizes: const ColScreen(
                              xs: Col.col_5,
                              sm: Col.col_5,
                              md: Col.col_3,
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/gplay.png",
                                  width: 40.0.sp,
                                  //screenWidth * 0.01
                                  // isMobile
                                  //     ? 20.0.w
                                  //     : scrwidth < 680
                                  //         ? 15.0.w
                                  //         : 8.0.w,
                                ),
                                const SizedBox(height: 10.0),
                                Image.asset(
                                    "assets/images/appstore.png",
                                    width: 40.0.sp
                                  // screenWidth * 0.09
                                  // isMobile
                                  //     ? 20.0.w
                                  //     : scrwidth < 680
                                  //         ? 15.0.w
                                  //         : 8.0.w,
                                ),
                                const SizedBox(
                                  height: 50.0,
                                ),
                                const Text("Follow us"),
                                Wrap(
                                  direction: (a <= 2)
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flex(
                                      direction: Axis.horizontal,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            "assets/icons/facebook.svg",
                                            width: 13.0,
                                            height: 13.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            "assets/icons/in.svg",
                                            width: 13.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                    Flex(
                                      direction: Axis.horizontal,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            "assets/icons/twitter.svg",
                                            width: 13.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            "assets/icons/vector1.svg",
                                            width: 13.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    BsRow(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 9.0.w),
                      gutter:
                      const EdgeInsets.symmetric(vertical: 20),
                      color: f8f8f8,
                      children: const [
                        BsCol(
                          sizes: ColScreen(
                            xs: Col.col_12,
                            md: Col.col_12,
                          ),
                          child: Text(
                            "Copyright © 2020 Jobhunt. All Rights Reserved.",
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
              ConnectivityBuilder(builder: (context, isConnected, status) {
                bool visi = isConnected == false ? true : false;
                return Visibility(
                  visible: visi,
                  child: Container(
                    color: Colors.amber.shade50,
                    child: SlideTransition(
                      position: _slidetrasition,
                      child: visi
                          ? Container(
                              color: Colors.amber.shade50,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      isConnected == true
                                          ? "Online"
                                          : "Oops.. No Internet Connectivity!",
                                      style: TextStyle(
                                          color:
                                              status != ConnectivityStatus.none
                                                  ? Colors.green
                                                  : Colors.red,
                                          fontSize: 12),
                                    )
                                    //    ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(
                                    //     content: Text('A SnackBar has been shown.'),
                                    //   ),
                                    // )
                                  ]),
                            )
                          : null,
                    ),
                  ),
                );
              }),
            ],
          ),
        )
        // }),
        // bottomSheet: Center(
        //     child: ConnectivityBuilder(builder: (context, isConnected, status) {
        //   return Row(children: [
        //     Text("$status",
        //         style: TextStyle(
        //             color: status != ConnectivityStatus.none
        //                 ? Colors.green
        //                 : Colors.red))
        //   ]);
        // })),
        );
  }

  showConnectivity() {}
}
