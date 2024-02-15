import 'package:bs_flutter/bs_flutter.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:jobhunt/appbar/appbar.dart';
import 'package:jobhunt/appbar/navdrawer.dart';
import 'package:jobhunt/pages/profile_dashboard.dart';
// import 'package:jobhunt/pages/dashboard_template.dart';

// import 'package:jobhunt/home/utils/constantss.dart';
// import 'package:jobhunt/home/utils/colors.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/const_widget.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';
import 'package:sizer/sizer.dart';


// import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  String title = appname;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String _offlinemessage = '';

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
    var a = Responsive.gridSize(screenWidth);
    var maxW = 0.0;
    var i1;
    return Scaffold(
      appBar: AppBar(
        title: const AppbarW(f:"candidate"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: pColor),
      ),
      drawer: (a < 4) ? const NavDrawer(type: {"from":typecand}) : null,
      body: LayoutBuilder(builder: (context, constraints) {
        maxW = constraints.maxWidth;
        i1 = (a <= 2) ? maxW / 1.2 : maxW / 2;
        var i2 = (a <= 2) ? i1 : maxW - i1;
        return SingleChildScrollView(
          child: SizedBox(
            height: constraints.maxHeight,
            child: Stack(
              
              children: [
                 
                
                SingleChildScrollView(
                  child: Container(
                    width: maxW,
                    color: Colors.white70,
                    // padding: EdgeInsets.symmetric(horizontal: maxW * (a * 0.01)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // showConnectivity(),
                       SizedBox(
                          height: screenHeight * 0.02,
                        ),

                        BsRow(
                          crossAxisAlignment:   WrapCrossAlignment.center,
                          alignment: Alignment.center,
                          children: [
                            BsCol(
                              sizes: ColScreen(
                                xs: Col.col_11,
                                sm: Col.col_11,
                                md: Col.col_5,
                              ) ,
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Find your dream jobs through $a ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: (a<2)?13.0.sp :  10.0.sp,
                                          color: Color(0xFF253269)),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Jobhunt ',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: primaryColor,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                        TextSpan(text: 'easily'),
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
                                    style:const  TextStyle(
                                        color: const Color(0xFF9B9B9B),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "RobotoMono"),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0)),
                                    padding: EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          gradient: btnGradient,
                                          borderRadius:
                                          BorderRadius.circular(30.0)),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: 130.0, minHeight: btnHeight1),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Get Started',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Karla"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                            BsCol(
                              sizes: const ColScreen(
                                xs: Col.col_11,
                                sm: Col.col_11,
                                md: Col.col_5,
                              ) ,
                              child: Container(
                                padding:const  EdgeInsets.all(20.0),
                                child: Image.asset(
                                  "assets/images/homescreen1.png",
                                  fit: BoxFit.scaleDown,
                                  // width: 100,
                                  width: (a == 2) ? 20.0.w : 50.0.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //   ],
                        // ),

                        // Wrap(
                        //   direction: (a <= 2) ? Axis.vertical : Axis.horizontal,
                        //   alignment: WrapAlignment.center,
                        //   crossAxisAlignment: WrapCrossAlignment.center,
                        //   children: [
                        //     Text("part 1"),
                        //   ],
                        // ),
                        const Text(
                          "Find your dream jobs through Jobhunt easily",
                          style: TextStyle(fontFamily: "Karla", fontSize: 20),
                        ),

                        Center(
                          child: MaterialButton(
                            color: Colors.purple,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => // Profile()
                                        // DashBoarTemplate()
                                      ProfileDashBoard()
                                  // SubCategoryScreen()
                                      ));
                            },
                            child: Text(" go to Dash board test "),
                          ),
                        ),
                        BsCol(
                          sizes:const ColScreen(
                            xs: Col.col_11,
                            sm: Col.col_11,
                            md: Col.col_11,
                            xl: Col.col_11,
                            xxl: Col.col_11,
                          ),
                          child: BsRow(
                            color: fcfcfc,
                            gutter: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              BsCol(

                                sizes:const ColScreen(
                                  xs: Col.col_5,
                                  sm: Col.col_5,
                                  md: Col.col_2,
                                ) ,
                                child:Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  md: Col.col_2,
                                ) ,
                                child:Column(
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

                                sizes:const  ColScreen(
                                  xs: Col.col_5,
                                  sm: Col.col_5,
                                  md: Col.col_3,
                                ) ,
                                child:Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Subscribe"),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const  SizedBox(
                                        child: Text(
                                            "Subscribe to get the latest\n jobs from us.")),
                                    const   SizedBox(
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
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12.0),
                                            contentPadding:
                                            const EdgeInsets.symmetric(
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
                                    const  SizedBox(
                                      height: 40,
                                    ),
                                    const   Text("Toll Free (India)"),
                                    const   SizedBox(
                                      height: 8,
                                    ),
                                    const   Text("+91 9791400132"),
                                    const  SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                              BsCol(

                                sizes:const  ColScreen(
                                  xs: Col.col_5,
                                  sm: Col.col_5,
                                  md: Col.col_2,
                                ) ,
                                child:Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    Image.asset("assets/images/appstore.png",
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
                          gutter:const EdgeInsets.symmetric(vertical: 20),
                          color: f8f8f8,
                          children: const [
                            BsCol(
                              sizes: ColScreen(
                                xs: Col.col_10,
                                md: Col.col_10,
                              ),
                              child: Text(
                                "Copyright © 2020 Jobhunt. All Rights Reserved.",
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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
                          child: visi? Container(
                            color: Colors.amber.shade50,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    isConnected == true
                                        ? "Online"
                                        : "Oops.. No Internet Connectivity!",
                                    style: TextStyle(
                                        color: status != ConnectivityStatus.none
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
                          ):null,
                        ),
                      ),
                    );
                  }),
              ],
            ),
          ),
        );
      }),
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
