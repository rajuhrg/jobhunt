import 'package:bs_flutter/bs_flutter.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobhunt/about/about_yourself.dart';
import 'package:jobhunt/dropzone/dropzonewidget/dropped_img.dart';
import 'package:jobhunt/dropzone/dropzonewidget/dropzone_widget.dart';
import 'package:jobhunt/dropzone/model/dropped_file.dart';
import 'package:jobhunt/pages/profile/model/request_server.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/const_widget.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _profileController;
  late ScrollController
      _scrollController; // =  TabController(length: 3, vsync: this);
  late bool fixedScroll;

  late List<Widget> renderProfile;
  late double screenWidth;
  late double screenHeight;
  DroppedFile? file;
  late int a;
  List screenNum = [8];
  Widget sizedbox035 = const SizedBox(
    height: 5,
  );

  List<bool> expCheck = [false, false];

  final _profileForm1 = GlobalKey<FormState>();
  final _profileForm2 = GlobalKey<FormState>();
  final _profileForm3 = GlobalKey<FormState>();
  final _profileForm4 = GlobalKey<FormState>();
  final _profileForm5 = GlobalKey<FormState>();
  final _profileForm6 = GlobalKey<FormState>();
  final _profileForm7 = GlobalKey<FormState>();
  Map _tAUFormData = {};
  AutovalidateMode _istaUFormValidate = AutovalidateMode.disabled;

  @override
  void initState() {
    // if (!mounted) return;
    _profileController = TabController(length: 8, vsync: this);
    renderProfile = [];

    _scrollController = ScrollController();

    super.initState();
    getProfile();
  }

  @override
  void dispose() {
    _profileController.dispose();

    _scrollController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    a = Responsive.gridSize(screenWidth);
    sizedbox035 = SizedBox(
      height: screenHeight * 0.035,
      width: (a <= 2) ? 20 : double.infinity,
    );
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            color: forgotpwdOutercolor,
            // height: screenHeight,
            padding: EdgeInsets.all(screenWidth *  0.01),
            child: SizedBox(
              width: (a > 5) ? 1200 : screenWidth,
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: (a>2)?30:5, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profile Update",
                            style: TextStyle(
                                color: textColor,
                                fontSize: (a <= 2) ? 13.sp : 10.sp,
                                // (a>3)?35.0: (30-((6-a)*1.8)),
                                fontWeight: FontWeight.w400),
                          ),
                          BsCardContainer(
                            child: BsRow(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                BsCol(
                                  sizes: const ColScreen(
                                      xs: Col.col_11,
                                      sm: Col.col_11,
                                      md: Col.col_6),
                                  child: Wrap(
                                    // direction: (screenWidth < 380)
                                    //     ? Axis.vertical
                                    //     : Axis.horizontal,
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Wrap(
                                            direction: Axis.vertical,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              // ProfileIcon(),
                                              _ProfileIcon(
                                                a: a,
                                              ),
                                              Text(
                                                "Profile Status",
                                                style: TextStyle(
                                                    color: primaryPurple,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Wrap(
                                          direction: Axis.vertical,
                                          children: [
                                            const Text(
                                              "Raju A V",
                                              style: TextStyle(
                                                  color: pColor2, fontSize: 20),
                                            ),
                                            Text(
                                              "UI/UX Designer",
                                              style: TextStyle(
                                                color: homebgColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                BsCol(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.all(1.0),
                                    visibility: BsVisibility.hiddenSm,
                                    sizes: const ColScreen(
                                        xs: Col.col_1,
                                        sm: Col.col_2,
                                        md: Col.col_6),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Image.asset(
                                        "assets/images/profileimg1.png",
                                        fit: BoxFit.scaleDown,
                                        width: 20.0.w,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          BsCol(
                            visibility: BsVisibility.none,
                            child: TabBar(
                                controller: _profileController,
                                tabs: const [
                                  Text(
                                    "1",
                                  ),
                                  Text(
                                    "2",
                                  ),
                                  Text(
                                    "3",
                                  ),
                                  Text(
                                    "4",
                                  ),
                                  Text(
                                    "5",
                                  ),
                                  Text(
                                    "6",
                                  ),
                                  Text(
                                    "7",
                                  ),
                                  Text(
                                    "8",
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: (a<3)?screenHeight - 80: screenHeight-20,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: (a>2)?30:5, vertical: 5),
                              child: TabBarView(
                                physics: const ClampingScrollPhysics(),
                                controller: _profileController,
                                children: [
                                  personalDetail({"i": 1, "pi": 0}),
                                  resumeManagement({"i": 2, "pi": 0}),
                                  SingleChildScrollView(
                                      child:
                                          professionalDetails({"i": 3, "pi": 1})),
                                  skills({"i": 4, "pi": 2}),
                                  ducationalDetailsd({"i": 5, "pi": 3}),
                                  certificationDetails({"i": 6, "pi": 4}),
                                  achievementsorPatents({"i": 7, "pi": 5}),
                                  scialNetwork({"i": 8, "pi": 6}),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )
        // }),
        // }),
        );
  }

  Future<void> getProfile() async {
    // var response = HttpRequests({},"/profile/profile.php",5);
    var response =
        await HttpRequests().requests({}, "/profile/profile.php", 5, 3);
    print("profile $response");

    // Map data = {
    //   "id": 0,
    //   "cityId": 0,
    //   "stateId": 0,
    //   "countryId": 0,
    //   "managerId": 0,
    //   "companyId": 0,
    //   "firstName": "raju",
    //   "lastName": "AV",
    //   "email": "rajuavs777@gamil.com",
    //   "mobileNo": "7975781060",
    //   "dateOfBirth": "2022-02-09T11:12:02.797Z",
    //   "phoneNo1": "7975781060",
    //   "phoneNo2": "7975781060",
    //   "location": "bengaluru",
    //   "streetAddress": "38",
    //   "gender": "mail",
    //   "pinCode": 560600,
    //   "empId": 1,
    //   "profilePicPath": "profli-mage",
    //   "cityName": "bengalore",
    //   "stateName": "karanataka",
    //   "countryName": "India"
    // };

    renderProfile.add(Expanded(
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Column(
            children: [],
          ),
        );
      }),
    ));
  }

  personalDetail(Map<String, int> map) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        BootstrapContainer(
            // decoration: BoxDecoration(color: Colors.amber.shade100),
            fluid: true,

            children: [
              Column(children: [
                BsCard(children: [
                  BsCardContainer(
                    title: Text(
                      "Personal Details",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: BsCardContainer(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _profileForm1,
                          child: BootstrapContainer(
                            fluid: true,
                            children: [
                              BsRow(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  BsCol(
                                    padding: const EdgeInsets.all(5.0),
                                    sizes: const ColScreen(
                                        // xs: Col.col_5,
                                        sm: Col.col_5,
                                        md: Col.col_3),
                                    child: DroppedFileWidget(file: file),
                                  ),
                                  BsCol(
                                    sizes: const ColScreen(
                                        // xs: Col.col_7,
                                        sm: Col.col_7,
                                        md: Col.col_5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          // width: i2,
                                          height: (!kIsWeb)
                                              ? 50
                                              : (a > 3)
                                                  ? 90
                                                  : 110,
                                          child: Container(
                                            color: const Color(0xFFF9F9FB),
                                            child: (kIsWeb)
                                                ? DropZoneWidget(
                                                    onDroppedFile: (file) =>
                                                        setState(() {
                                                      this.file = file;
                                                    }),
                                                  )
                                                : TextButton.icon(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .image_search_outlined),
                                                    label: const Text(
                                                        "Choose Profile Picture")),
                                            // SizedBox(height: 20,child: MaterialButton(padding: EdgeInsets.symmetric(horizontal: 30),onPressed: (){}, child: Text("Choose Profile Picture", style: TextStyle(color: Colors.white),), color: pbtnColor2 ,)),
                                          ),
                                        ),
                                        Text(
                                          "Supported file format: png, jpg, jpeg - up to 3MB",
                                          style: TextStyle(
                                              color: secondaryColor2,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  BsCol(
                                    sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_12,
                                        md: Col.col_4),
                                    child: RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 10),
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: "By uploading your photograph, you certify that jobhunt.com has the right to display this photograph to the recruiters and that the uploaded file does not violate our .",
                                          ),
                                          //  style: TextStyle(fontSize: 10.0.sp),
                                          TextSpan(
                                              text: 'Terms of Service ',
                                              style: const TextStyle(
                                                  color: pbtnColor1,
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  print('Terms of Service"');
                                                }),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              BsRow(
                                gutter: const EdgeInsets.all(10),
                                children: [
                                  BsCol(
                                    sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_12,
                                        md: Col.col_4),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "First Name",
                                        border: outlineInputborder,
                                        isDense: true,
                                        // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                      ),
                                      onChanged: (String v) {
                                        _tAUFormData["firstName"]=v;
                                      },
                                      autovalidateMode:
                                      _istaUFormValidate,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return "Please Enter Name";
                                        } else if (v.length <
                                            2) {
                                          return "Please enter valid name";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  BsCol(
                                    sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_12,
                                        md: Col.col_4),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Last Name",
                                        border: outlineInputborder,
                                        isDense: true,
                                      ),
                                      onChanged: (String v) {
                                        _tAUFormData["lastName"]=v;
                                      },
                                      autovalidateMode:
                                      _istaUFormValidate,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return "Please Enter Last Name";
                                        } else if (v.length < 2) {
                                          return "Please enter valid name";
                                        }
                                        return null;
                                      },
                                    ),
                                  )
                                ],
                              ),
                              BsRow(
                                gutter: const EdgeInsets.all(10),
                                children: [
                                  BsCol(
                                    sizes: const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_4,
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "DOB(DD/MM/YYYY)",
                                        border: outlineInputborder,
                                        isDense: true,
                                      ),
                                      onChanged: (String v) {
                                        _tAUFormData["dateOfBirth"]=v;
                                      },
                                      autovalidateMode:
                                      _istaUFormValidate,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return "Please select date of birth";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  BsCol(
                                    sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_12,
                                        md: Col.col_4),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: "Gender",
                                          border: outlineInputborder,
                                          isDense: true,
                                          suffixIcon: const Icon(
                                              Icons.keyboard_arrow_down)),
                                      onChanged: (String v) {
                                        _tAUFormData["gender"]=v;
                                      },
                                      autovalidateMode:
                                      _istaUFormValidate,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return "Select gender";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              BsRow(
                                gutter: const EdgeInsets.all(10),
                                children: [
                                  BsCol(
                                    sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_12,
                                        md: Col.col_4),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Nationality",
                                        border: outlineInputborder,
                                        isDense: true,
                                      ),
                                      onChanged: (String v) {
                                        _tAUFormData["nationality"]=v;
                                      },
                                      autovalidateMode:
                                      _istaUFormValidate,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return "Please enter your nationality";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  BsCol(
                                    sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_12,
                                        md: Col.col_4),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: "Marital Status",
                                          border: outlineInputborder,
                                          isDense: true,
                                          suffixIcon: const Icon(
                                              Icons.keyboard_arrow_down)),
                                      onChanged: (String v) {
                                        _tAUFormData["nationality"]=v;
                                      },
                                      autovalidateMode:
                                      _istaUFormValidate,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return "Please enter your nationality";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              BsRow(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                gutter: const EdgeInsets.all(10),
                                children: [
                                  BsCol(
                                    sizes: const ColScreen(
                                        xs: Col.col_8,
                                        sm: Col.col_8,
                                        md: Col.col_6),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          labelText: "Email ID",
                                          border: outlineInputborder,
                                          isDense: true,
                                          suffixIcon: const Icon(Icons.mail)),

                                       onChanged: (String v) {
                                        _tAUFormData["email"]=v;
                                      },
                                      autovalidateMode:
                                      _istaUFormValidate,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return "Please enter your email";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  BsCol(
                                    sizes: const ColScreen(
                                        xs: Col.col_4,
                                        sm: Col.col_4,
                                        md: Col.col_2),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: const Text("Verify"),
                                      color: Colors.grey.shade400,
                                    ),
                                  )
                                ],
                              ),
                              BsRow(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  gutter: EdgeInsets.symmetric(
                                      horizontal: (a == 1) ? 2 : 10),
                                  children: [
                                    BsCol(
                                      sizes: const ColScreen(
                                          xs: Col.col_4,
                                          sm: Col.col_3,
                                          md: Col.col_2),
                                      child: TextFormField(
                                        maxLines: 1,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "Dialing Code",
                                          border: outlineInputborder,
                                          isDense: true,
                                        ),
                                        onChanged: (String v) {
                                          _tAUFormData["dialCode"]=v;
                                        },
                                        autovalidateMode:
                                        _istaUFormValidate,
                                        validator: (v) {
                                          if (v!.isEmpty) {
                                            return "Please enter dial code";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    BsCol(
                                      sizes: const ColScreen(
                                          xs: Col.col_5,
                                          sm: Col.col_5,
                                          md: Col.col_4),
                                      child: TextFormField(
                                        maxLines: 1,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: "Mobile Number",
                                          border: outlineInputborder,
                                          isDense: true,
                                        ),
                                        onChanged: (String v) {
                                          _tAUFormData["mobileNumber"]=v;
                                        },
                                        autovalidateMode:
                                        _istaUFormValidate,
                                        validator: (v) {
                                          if (v!.isEmpty) {
                                            return "Please enter your mobile";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    BsCol(
                                      offset: const ColScreen(
                                        xs: Col.col_5,
                                      ),
                                      sizes: const ColScreen(
                                          xs: Col.col_3,
                                          sm: Col.col_4,
                                          md: Col.col_2),
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: const Text("Verify"),
                                        color: Colors.grey.shade400,
                                      ),
                                    )
                                  ]),

                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),

                // BootstrapCol(
              ]),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Column(
              //       children: [
              //       // Row(
              //         //   children: List<Widget>.generate(8, (int index)  {
              //         //     return Image.asset("assets/icons/job-opportunities-edited.png", width: 20, );
              //         //   }),
              //         // ),
              //         // Image.asset("assets/icons/job-opportunities-edited.png")
              //       ],
              //     ),
              //     (a > 2)
              //         ?
              //         : const Text("t"),
              //   ],
              // ),
              SizedBox(
                width: double.infinity,
                height: inputBoxHeith,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                  onPressed: () {
                    if(_profileForm1.currentState!.validate()){

                      setState(() {

                      });

                      _profileController.animateTo(map["i"]!,
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeIn);
                    }

                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: btnGradient,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 130.0, minHeight: btnHeight1),
                      alignment: Alignment.center,
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Karla"),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ],
    );
  }

  resumeManagement(Map<String, int> map) {
    return ListView(
      children: [
            BootstrapContainer(
            // decoration: BoxDecoration(color: Colors.amber.shade100),
            fluid: true,
            children: [
              Column(children: [
                BsCard(children: [
                  BsCardContainer(
                    title: Text(
                      "Resume Management",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  BsCardContainer(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Upload resume  ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: pColor2,
                            ),
                            // Color(0xFF253269)),
                            children: <TextSpan>[
                              TextSpan(
                                text: '(you can upload multiple resume) ',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: textColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        BsRow(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          gutter: const EdgeInsets.all(10),
                          children: [
                            BsCol(
                              sizes: const ColScreen(
                                  xs: Col.col_12, sm: Col.col_12, md: Col.col_6),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: '01.  ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                              color: textColor,
                                            ),
                                            // Color(0xFF253269)),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' Raju A V - Project Manager',
                                                style: GoogleFonts.poppins(
                                                  textStyle:  TextStyle(
                                                    color: otpFieldBorderColor,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: (!kIsWeb)
                                              ? 40
                                              : (a > 3)
                                                  ? 90
                                                  : 110,
                                          child: Center(
                                            child: Container(
                                              color: const Color(0xFFF9F9FB),
                                              child: (kIsWeb)
                                                  ? DropZoneWidget(
                                                       onDroppedFile: (file) {} )
                                                  : TextButton.icon(
                                                      onPressed: () {},
                                                      icon: const Icon(Icons.image_search_outlined),
                                                      label: const Text(
                                                          "Click to browse your file")),
                                              // SizedBox(height: 20,child: MaterialButton(padding: EdgeInsets.symmetric(horizontal: 30),onPressed: (){}, child: Text("Choose Profile Picture", style: TextStyle(color: Colors.white),), color: pbtnColor2 ,)),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Supported file format: png, jpg, jpeg, pdf, txt, doc, docx, rtf, pdf - upto 3MB",
                                          style: TextStyle(
                                              color: secondaryColor2,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                        sizedbox035,
                                      ]),
                                  const Divider(),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: '02.  ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                              color: textColor,
                                            ),
                                            // Color(0xFF253269)),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' Raju A V - Project Manager',
                                                style: GoogleFonts.poppins(
                                                  textStyle:  TextStyle(
                                                    color: otpFieldBorderColor,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          // width: i2,
                                          height: (!kIsWeb)
                                              ? 40
                                              : (a > 3)
                                                  ? 90
                                                  : 110,
                                          child: Center(
                                            child: Container(
                                              color: const Color(0xFFF9F9FB),
                                              child: (kIsWeb)
                                                  ? DropZoneWidget(
                                                      onDroppedFile: (file)
                                                      //     setState(() {
                                                      //   this.file = file;
                                                      // }),
                                                   {} )
                                                  : TextButton.icon(
                                                      onPressed: () {},
                                                      icon: const Icon(Icons
                                                          .image_search_outlined),
                                                      label: const Text(
                                                          "Click to browse your file")),
                                              // SizedBox(height: 20,child: MaterialButton(padding: EdgeInsets.symmetric(horizontal: 30),onPressed: (){}, child: Text("Choose Profile Picture", style: TextStyle(color: Colors.white),), color: pbtnColor2 ,)),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Supported file format: png, jpg, jpeg, pdf, txt, doc, docx, rtf, pdf - upto 3MB",
                                          style: TextStyle(
                                              color: secondaryColor2,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                        sizedbox035
                                      ]),
                                  const Divider(),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: '03.  ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                              color: textColor,
                                            ),
                                            // Color(0xFF253269)),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' Raju A V - Project Manager',
                                                style: GoogleFonts.poppins(
                                                  textStyle:  TextStyle(
                                                    color: otpFieldBorderColor,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          // width: i2,
                                          height: (!kIsWeb)
                                              ? 40
                                              : (a > 3)
                                                  ? 90
                                                  : 110,
                                          child: Center(
                                            child: Container(
                                              color: const Color(0xFFF9F9FB),
                                              child: (kIsWeb)
                                                  ? DropZoneWidget(
                                                      onDroppedFile: (file)=>
                                                          setState(() {
                                                        // this.file = file;
                                                      }),
                                                    )
                                                  : TextButton.icon(
                                                      onPressed: () {},
                                                      icon: const Icon(Icons
                                                          .image_search_outlined),
                                                      label: const Text(
                                                          "Click to browse your file")),
                                              // SizedBox(height: 20,child: MaterialButton(padding: EdgeInsets.symmetric(horizontal: 30),onPressed: (){}, child: Text("Choose Profile Picture", style: TextStyle(color: Colors.white),), color: pbtnColor2 ,)),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Supported file format: png, jpg, jpeg, pdf, txt, doc, docx, rtf, pdf - upto 3MB",
                                          style: TextStyle(
                                              color: secondaryColor2,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                            BsCol(
                              sizes: const ColScreen(
                                  xs: Col.col_12, sm: Col.col_12, md: Col.col_6),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                              color: textColor,
                                            ),
                                            // Color(0xFF253269)),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    'Short summary about you record and upload',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    color: primaryColor2,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          // width: i2,
                                          height: (!kIsWeb)
                                              ? 40
                                              : (a > 3)
                                                  ? 90
                                                  : 110,
                                          child: Center(
                                            child: Container(
                                              color: const Color(0xFFF9F9FB),
                                              child: (kIsWeb)
                                                  ? DropZoneWidget(
                                                      onDroppedFile: (file) =>
                                                          setState(() {
                                                        this.file = file;
                                                      }),
                                                    )
                                                  : TextButton.icon(
                                                      onPressed: () {},
                                                      icon: const Icon(Icons
                                                          .image_search_outlined),
                                                      label: const Text(
                                                          "Click to browse your file")),
                                              // SizedBox(height: 20,child: MaterialButton(padding: EdgeInsets.symmetric(horizontal: 30),onPressed: (){}, child: Text("Choose Profile Picture", style: TextStyle(color: Colors.white),), color: pbtnColor2 ,)),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Supported file format: png, jpg, jpeg, pdf, txt, doc, docx, rtf, pdf - upto 3MB",
                                          style: TextStyle(
                                              color: secondaryColor2,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                        sizedbox035
                                      ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ]),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Column(
              //       children: [
              //       // Row(
              //         //   children: List<Widget>.generate(8, (int index)  {
              //         //     return Image.asset("assets/icons/job-opportunities-edited.png", width: 20, );
              //         //   }),
              //         // ),
              //         // Image.asset("assets/icons/job-opportunities-edited.png")
              //       ],
              //     ),
              //     (a > 2)
              //         ?
              //         : const Text("t"),
              //   ],
              // ),
              SizedBox(
                width: double.infinity,
                height: inputBoxHeith,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                      minWidth: 130,
                      height: btnHeight1,
                      onPressed: () {
                        print(_profileController.previousIndex);
                        _profileController.animateTo(map["pi"]!,
                            duration: const Duration(
                              milliseconds: 600,
                            ),
                            curve: Curves.easeIn);
                      },
                      color: secondaryColor2,
                      textColor: textColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            color: secondaryColor2,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Container(
                          constraints: BoxConstraints(
                              maxWidth: 130.0, minHeight: btnHeight1),
                          alignment: Alignment.center,
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: const [
                              Icon(
                                Icons.arrow_back_sharp,
                                size: 20,
                              ),
                              Text(
                                'Previous',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  MaterialButton(
                    onPressed: () {
                      _profileController.animateTo(map["i"]!,
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeIn);
                    },
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: btnGradient,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 130.0, minHeight: btnHeight1),
                        alignment: Alignment.center,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ],
    );
  }

  professionalDetails(Map<String, int> map) {
    List expCheck = [false, false];
    return BootstrapContainer(
        // decoration: BoxDecoration(color: Colors.amber.shade100),
        fluid: true,
        children: [
          Column(children: [
            BsCard(children: [
              BsCardContainer(
                title: RichText(
                  text: TextSpan(
                    text: 'Professional Details  ',
                    style: TextStyle(
                      color: textColor,
                      fontSize: (a < 2) ? 16.sp : 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    // Color(0xFF253269)),
                    children: <TextSpan>[
                      TextSpan(
                        text: '( You can get relevant job matches) ',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: primaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BsCardContainer(
                child: Column(
                  children: [
                    BsRow(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      gutter: const EdgeInsets.all(10),
                      children: [
                        BsCol(
                          sizes: const ColScreen(
                              xs: Col.col_12, sm: Col.col_12, md: Col.col_8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: inputBoxHeith,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Company Name",
                                    border: outlineInputborder,
                                    // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                  ),
                                  onChanged: (v) {},
                                ),
                              ),
                              sizedbox035,
                              SizedBox(
                                height: inputBoxHeith,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Designation ",
                                    border: outlineInputborder,
                                    // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                  ),
                                  onChanged: (v) {},
                                ),
                              ),
                              sizedbox035,
                              BsRow(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                gutter: const EdgeInsets.all(10),
                                children: [
                                  BsCol(
                                    alignment: Alignment.centerLeft,
                                    sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_12,
                                        md: Col.col_4),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Relevant Experience",
                                          style: TextStyle(
                                              color: textColor2, fontSize: 14),
                                        ),
                                        Wrap(
                                            direction: Axis.horizontal,
                                            alignment: WrapAlignment.spaceBetween,
                                            children: [
                                              Wrap(
                                                direction: Axis.horizontal,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    value: expCheck[0],
                                                    onChanged: (v) {
                                                      print("changed $v");

                                                      expCheck[0] = !v!;
                                                    },
                                                  ),
                                                  const Text(
                                                    "Current",
                                                    style: TextStyle(
                                                        color: primaryColor2,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )
                                                ],
                                              ),
                                              Wrap(
                                                direction: Axis.horizontal,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    value: expCheck[0],
                                                    onChanged: (v) {},
                                                  ),
                                                  const Text(
                                                    "Last Used",
                                                    style: TextStyle(
                                                        color: primaryColor2,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )
                                                ],
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ),
                                  BsCol(
                                    sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_6,
                                        md: Col.col_4),
                                    child: SizedBox(
                                      height: inputBoxHeith,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "From (MM/YYYY)",
                                          border: outlineInputborder,
                                          // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                        ),
                                        onChanged: (v) {},
                                      ),
                                    ),
                                  ),
                                  BsCol(
                                    sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_6,
                                        md: Col.col_4),
                                    child: SizedBox(
                                      height: inputBoxHeith,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "To (MM/YYYY)",
                                          border: outlineInputborder,
                                          // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                        ),
                                        onChanged: (v) {},
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ]),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Column(
          //       children: [
          //       // Row(
          //         //   children: List<Widget>.generate(8, (int index)  {
          //         //     return Image.asset("assets/icons/job-opportunities-edited.png", width: 20, );
          //         //   }),
          //         // ),
          //         // Image.asset("assets/icons/job-opportunities-edited.png")
          //       ],
          //     ),
          //     (a > 2)
          //         ?
          //         : const Text("t"),
          //   ],
          // ),
          SizedBox(
            width: double.infinity,
            height: inputBoxHeith,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                  minWidth: 130,
                  height: btnHeight1,
                  onPressed: () {
                    print(_profileController.previousIndex);
                    _profileController.animateTo(map["pi"]!,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeIn);
                  },
                  color: secondaryColor2,
                  textColor: textColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        color: secondaryColor2,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 130.0, minHeight: btnHeight1),
                      alignment: Alignment.center,
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: const [
                          Icon(
                            Icons.arrow_back_sharp,
                            size: 20,
                          ),
                          Text(
                            'Previous',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              MaterialButton(
                onPressed: () {
                  _profileController.animateTo(map["i"]!,
                      duration: const Duration(
                        milliseconds: 600,
                      ),
                      curve: Curves.easeIn);
                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: btnGradient,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 130.0, minHeight: btnHeight1),
                    alignment: Alignment.center,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]);
  }

  skills(Map<String, int> map) {
    BsSelectBoxController _selectYear = BsSelectBoxController(options: const [
      BsSelectBoxOption(value: 1, text: Text('1 ')),
      BsSelectBoxOption(value: 2, text: Text('2 ')),
      BsSelectBoxOption(value: 3, text: Text('3 ')),
      BsSelectBoxOption(value: 4, text: Text('4 ')),
      BsSelectBoxOption(value: 5, text: Text('5 ')),
      BsSelectBoxOption(value: 6, text: Text('6 ')),
    ]);
    return SingleChildScrollView(
      child: BootstrapContainer(
          // decoration: BoxDecoration(color: Colors.amber.shade100),
          fluid: true,
          children: [
            Column(children: [
              BsCard(children: [
                BsCardContainer(
                  title: RichText(
                    text: TextSpan(
                      text: 'Skills ',
                      style: TextStyle(
                        color: textColor,
                        fontSize: (a < 2) ? 16.sp : 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      // Color(0xFF253269)),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' ( You can get relevant job matches) ',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: primaryColor,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BsCardContainer(
                  child: Column(
                    children: [
                      BsCol(
                        padding: EdgeInsets.all((a < 3) ? 3 : 8),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: borderColor,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: BsRow(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          gutter: const EdgeInsets.all(10),
                          children: [
                            BsCol(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: borderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              padding: const  EdgeInsets.all(10),
                              sizes: const ColScreen(
                                  xs: Col.col_12,
                                  sm: Col.col_12,
                                  md: Col.col_4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Core skills  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: pColor2,
                                    ),
                                  ),
                                  sizedbox035,
                                  SizedBox(
                                    height: inputBoxHeith,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Core skill",
                                        border: outlineInputborder,
                                        // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                      ),
                                      onChanged: (v) {},
                                    ),
                                  ),
                                  sizedbox035,
                                  BsRow(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    gutter: const EdgeInsets.all(2.0),
                                    children: [
                                      BsCol(
                                          sizes: const ColScreen(
                                              xs: Col.col_4,
                                              sm: Col.col_4,
                                              md: Col.col_4),
                                          child: Text("Relevant Experience",
                                              style: TextStyle(
                                                  color: textColor2))),
                                      BsCol(
                                        sizes: const   ColScreen(
                                            xs: Col.col_4,
                                            sm: Col.col_4,
                                            md: Col.col_4),
                                        child: Column(
                                          children: [
                                            Text("Year",
                                                style: TextStyle(
                                                    color: textColor2)),
                                            BsSelectBox(
                                              padding: EdgeInsets.all(
                                                  (a < 2) ? 4 : 8),
                                              hintTextLabel: 'Year',
                                              controller: _selectYear,
                                            ),
                                          ],
                                        ),
                                      ),
                                      BsCol(
                                        sizes: const ColScreen(
                                            xs: Col.col_4,
                                            sm: Col.col_4,
                                            md: Col.col_4),
                                        child: Column(
                                          children: [
                                            Text("Month",
                                                style: TextStyle(
                                                    color: textColor2)),
                                            BsSelectBox(
                                              padding: EdgeInsets.all(
                                                  (a < 2) ? 4 : 8),
                                              hintTextLabel: 'Month',
                                              controller: _selectYear,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            BsCol(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: borderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.all(10),
                              sizes: const ColScreen(
                                  xs: Col.col_12,
                                  sm: Col.col_12,
                                  md: Col.col_4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Associated Skills  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: pColor2,
                                    ),
                                  ),
                                  sizedbox035,
                                  SizedBox(
                                    height: inputBoxHeith,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Associated Skills ",
                                        border: outlineInputborder,
                                        // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                      ),
                                      onChanged: (v) {},
                                    ),
                                  ),
                                  sizedbox035,
                                  BsRow(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    gutter: const EdgeInsets.all(2.0),
                                    children: [
                                      BsCol(
                                          sizes: const ColScreen(
                                              xs: Col.col_4,
                                              sm: Col.col_4,
                                              md: Col.col_4),
                                          child: Text("Relevant Experience",
                                              style: TextStyle(
                                                  color: textColor2))),
                                      BsCol(
                                        sizes: const ColScreen(
                                            xs: Col.col_4,
                                            sm: Col.col_4,
                                            md: Col.col_4),
                                        child: Column(
                                          children: [
                                            Text("Year",
                                                style: TextStyle(
                                                    color: textColor2)),
                                            BsSelectBox(
                                              padding: EdgeInsets.all(
                                                  (a < 2) ? 4 : 8),
                                              hintTextLabel: 'Year',
                                              controller: _selectYear,
                                            ),
                                          ],
                                        ),
                                      ),
                                      BsCol(
                                        sizes: const ColScreen(
                                            xs: Col.col_4,
                                            sm: Col.col_4,
                                            md: Col.col_4),
                                        child: Column(
                                          children: [
                                            Text("Month",
                                                style: TextStyle(
                                                    color: textColor2)),
                                            BsSelectBox(
                                              padding: EdgeInsets.all(
                                                  (a < 2) ? 4 : 8),
                                              hintTextLabel: 'Month',
                                              controller: _selectYear,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            BsCol(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: borderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              padding:const EdgeInsets.all(10),
                              sizes: const ColScreen(
                                  xs: Col.col_12,
                                  sm: Col.col_12,
                                  md: Col.col_4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Additional Skills  ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: pColor2,
                                    ),
                                  ),
                                  sizedbox035,
                                  SizedBox(
                                    height: inputBoxHeith,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Additional Skills ",
                                        border: outlineInputborder,
                                        // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                      ),
                                      onChanged: (v) {},
                                    ),
                                  ),
                                  sizedbox035,
                                  BsRow(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    gutter: const EdgeInsets.all(2.0),
                                    children: [
                                      BsCol(
                                          sizes: const  ColScreen(
                                              xs: Col.col_4,
                                              sm: Col.col_4,
                                              md: Col.col_4),
                                          child: Text("Relevant Experience",
                                              style: TextStyle(
                                                  color: textColor2))),
                                      BsCol(
                                        sizes: const ColScreen(
                                            xs: Col.col_4,
                                            sm: Col.col_4,
                                            md: Col.col_4),
                                        child: Column(
                                          children: [
                                            Text("Year",
                                                style: TextStyle(
                                                    color: textColor2)),
                                            BsSelectBox(
                                              padding: EdgeInsets.all(
                                                  (a < 2) ? 4 : 8),
                                              hintTextLabel: 'Year',
                                              controller: _selectYear,
                                            ),
                                          ],
                                        ),
                                      ),
                                      BsCol(
                                        sizes: const ColScreen(
                                            xs: Col.col_4,
                                            sm: Col.col_4,
                                            md: Col.col_4),
                                        child: Column(
                                          children: [
                                            Text("Month",
                                                style: TextStyle(
                                                    color: textColor2)),
                                            BsSelectBox(
                                              padding: EdgeInsets.all(
                                                  (a < 2) ? 4 : 8),
                                              hintTextLabel: 'Month',
                                              controller: _selectYear,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add Skill"),
                  style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ]),
            SizedBox(
              width: double.infinity,
              height: inputBoxHeith,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                    minWidth: 130,
                    height: btnHeight1,
                    onPressed: () {
                      print(_profileController.previousIndex);
                      _profileController.animateTo(map["pi"]!,
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeIn);
                    },
                    color: secondaryColor2,
                    textColor: textColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: secondaryColor2,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: 130.0, minHeight: btnHeight1),
                        alignment: Alignment.center,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: const [
                            Icon(
                              Icons.arrow_back_sharp,
                              size: 20,
                            ),
                            Text(
                              'Previous',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                MaterialButton(
                  onPressed: () {
                    _profileController.animateTo(map["i"]!,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeIn);
                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: btnGradient,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 130.0, minHeight: btnHeight1),
                      alignment: Alignment.center,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
    );
  }

  ducationalDetailsd(Map<String, int> map) {
    return SingleChildScrollView(
      child: BootstrapContainer(
          // decoration: BoxDecoration(color: Colors.amber.shade100),
          fluid: true,
          children: [
            BsCol(
              sizes: const ColScreen(xs: Col.col_12,sm: Col.col_12,md:Col.col_8),
              child: Column(children: [
                BsCard(children: [
                  BsCardContainer(
                    title: RichText(
                      text: TextSpan(
                        text: 'Educational Details  ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: (a < 2) ? 16.sp : 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  BsCardContainer(
                    child: Column(
                      children: [
                        BsRow(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          gutter: const EdgeInsets.all(10),
                          children: [
                            BsCol(
                              sizes: const ColScreen(xs: Col.col_12,sm:Col.col_12,md: Col.col_8),
                              child: Column(
                                children: [
                                  BsRow(
                                    gutter: const EdgeInsets.all(10),
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      BsCol(
                                        sizes: const ColScreen(
                                            xs: Col.col_12,
                                            sm: Col.col_12,
                                            md: Col.col_6),
                                        child: SizedBox(
                                          height: inputBoxHeith,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: "Highest Qualification",
                                              border: outlineInputborder,
                                              // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                            ),
                                            onChanged: (v) {},
                                          ),
                                        ),
                                      ),
                                      BsCol(
                                        sizes: const  ColScreen(
                                            xs: Col.col_12,
                                            sm: Col.col_12,
                                            md: Col.col_6),
                                        child: SizedBox(
                                          height: inputBoxHeith,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: "Year of Passing",
                                              border: outlineInputborder,
                                              // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                            ),
                                            onChanged: (v) {},
                                          ),
                                        ),
                                      ),
                                      BsCol(
                                        child: BsCol(
                                          sizes: const ColScreen(
                                              xs: Col.col_12,
                                              sm: Col.col_12,
                                              md: Col.col_6),
                                          child: SizedBox(
                                            height: inputBoxHeith,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: "Specialization",
                                                border: outlineInputborder,
                                                // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                              ),
                                              onChanged: (v) {},
                                            ),
                                          ),
                                        ),
                                      ),
                                      BsCol(
                                        child: BsCol(
                                          sizes: const ColScreen(
                                              xs: Col.col_12,
                                              sm: Col.col_12,
                                              md: Col.col_6),
                                          child: SizedBox(
                                            height: inputBoxHeith,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText:
                                                    "University / College Name",
                                                border: outlineInputborder,
                                                // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                              ),
                                              onChanged: (v) {},
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(),
                                  BsCol(
                                      sizes:const ColScreen(
                                          xs: Col.col_12,
                                          sm: Col.col_12,
                                          md: Col.col_6),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton.icon(
                                          label: const Text(
                                            "Add",
                                          ),
                                          icon: const Icon(Icons.add),
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              onPrimary: Colors.black,
                                              primary: secondaryColor2),
                                        ),
                                      ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ]),
            ),
            SizedBox(
              width: double.infinity,
              height: inputBoxHeith,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                    minWidth: 130,
                    height: btnHeight1,
                    onPressed: () {
                      print(_profileController.previousIndex);
                      _profileController.animateTo(map["pi"]!,
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeIn);
                    },
                    color: secondaryColor2,
                    textColor: textColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: secondaryColor2,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: 130.0, minHeight: btnHeight1),
                        alignment: Alignment.center,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: const [
                            Icon(
                              Icons.arrow_back_sharp,
                              size: 20,
                            ),
                            Text(
                              'Previous',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                MaterialButton(
                  onPressed: () {
                    _profileController.animateTo(map["i"]!,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeIn);
                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: btnGradient,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 130.0, minHeight: btnHeight1),
                      alignment: Alignment.center,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
    );
  }

  certificationDetails(Map<String, int> map) {
    return SingleChildScrollView(
      child: BootstrapContainer(
          // decoration: BoxDecoration(color: Colors.amber.shade100),
          fluid: true,
          children: [
            Column(children: [
              BsCard(children: [
                BsCardContainer(
                  title: RichText(
                    text: TextSpan(
                      text: 'Certification Details  ',
                      style: TextStyle(
                        color: textColor,
                        fontSize: (a < 2) ? 16.sp : 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                BsCardContainer(
                  child: Column(
                    children: [
                      BsRow(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        gutter: const EdgeInsets.all(10),
                        children: [
                          BsCol(
                            sizes: const ColScreen(
                                xs: Col.col_12,
                                sm: Col.col_12,
                                md: Col.col_8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BsCol(
                                  sizes: const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_6),
                                  child: Column(
                                    children: [
                                      BsRow(
                                          gutter: const EdgeInsets.all(10),
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            BsCol(
                                              sizes: const ColScreen(
                                                  xs: Col.col_12,
                                                  sm: Col.col_12,
                                                  md: Col.col_12),
                                              child: SizedBox(
                                                height: inputBoxHeith,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "Certification Title",
                                                    border: outlineInputborder,
                                                    // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                                  ),
                                                  onChanged: (v) {},
                                                ),
                                              ),
                                            ),
                                          ]),
                                      sizedbox035,
                                      BsRow(
                                          gutter: const EdgeInsets.all(10),
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            BsCol(
                                              sizes: const ColScreen(
                                                  xs: Col.col_12,
                                                  sm: Col.col_12,
                                                  md: Col.col_12),
                                              child: TextFormField(
                                                minLines: 3,
                                                maxLines: 10,
                                                decoration: InputDecoration(
                                                  labelText: "Description",

                                                  border: outlineInputborder,
                                                  // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                                ),
                                                onChanged: (v) {},
                                              ),
                                            ),
                                          ]),
                                      BsRow(
                                        gutter: const EdgeInsets.all(10),
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          BsCol(
                                            sizes: const ColScreen(
                                                xs: Col.col_12,
                                                sm: Col.col_12,
                                                md: Col.col_6),
                                            child: Wrap(
                                                direction: Axis.horizontal,
                                                children: [
                                                  Wrap(
                                                    direction: Axis.horizontal,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .center,
                                                    children: [
                                                      Checkbox(
                                                        value: expCheck[0],
                                                        onChanged: (v) {
                                                          if (v == null) return;
                                                          print("changed $v");
                                                          setState(() {
                                                            expCheck[0] = v;
                                                          });
                                                        },
                                                      ),
                                                      const Text(
                                                        "No Expiry",
                                                        style: TextStyle(
                                                            color:
                                                                primaryColor2,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )
                                                    ],
                                                  ),
                                                  Wrap(
                                                    direction: Axis.horizontal,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .center,
                                                    children: [
                                                      Checkbox(
                                                        value: expCheck[1],
                                                        onChanged: (v) {
                                                          if (v == null) return;
                                                          print("changed $v");
                                                          setState(() {
                                                            expCheck[1] = v;
                                                          });
                                                        },
                                                      ),
                                                      const Text(
                                                        "Date",
                                                        style: TextStyle(
                                                            color:
                                                                primaryColor2,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )
                                                    ],
                                                  ),
                                                ]),
                                          ),
                                          BsCol(
                                            sizes: const ColScreen(
                                                xs: Col.col_12,
                                                sm: Col.col_6,
                                                md: Col.col_3),
                                            child: SizedBox(
                                              height: inputBoxHeith,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: "From (MM/YYYY)",
                                                  border: outlineInputborder,
                                                  // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                                ),
                                                onChanged: (v) {},
                                              ),
                                            ),
                                          ),
                                          BsCol(
                                            sizes: const ColScreen(
                                                xs: Col.col_12,
                                                sm: Col.col_6,
                                                md: Col.col_3),
                                            child: SizedBox(
                                              height: inputBoxHeith,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: "To (MM/YYYY)",
                                                  border: outlineInputborder,
                                                  // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                                ),
                                                onChanged: (v) {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      sizedbox035,
                                      BsCol(
                                          sizes: const ColScreen(
                                              xs: Col.col_12,
                                              sm: Col.col_12,
                                              md: Col.col_6),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton.icon(
                                              label: const Text(
                                                "Add",
                                              ),
                                              icon:const Icon(Icons.add),
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  onPrimary: Colors.black,
                                                  primary: secondaryColor2),
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ]),
            SizedBox(
              width: double.infinity,
              height: inputBoxHeith,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                    minWidth: 130,
                    height: btnHeight1,
                    onPressed: () {
                      print(_profileController.previousIndex);
                      _profileController.animateTo(map["pi"]!,
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.easeIn);
                    },
                    color: secondaryColor2,
                    textColor: textColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: secondaryColor2,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: 130.0, minHeight: btnHeight1),
                        alignment: Alignment.center,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: const [
                            Icon(
                              Icons.arrow_back_sharp,
                              size: 20,
                            ),
                            Text(
                              'Previous',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                MaterialButton(
                  onPressed: () {
                    _profileController.animateTo(map["i"]!,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeIn);
                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: btnGradient,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 130.0, minHeight: btnHeight1),
                      alignment: Alignment.center,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
    );
  }

  achievementsorPatents(Map<String, int> map) {
    return BootstrapContainer(
        // decoration: BoxDecoration(color: Colors.amber.shade100),
        fluid: true,
        children: [
          Column(children: [
            BsCard(children: [
              BsCardContainer(
                title: RichText(
                  text: TextSpan(
                    text: 'Achievements or Patents ',
                    style: TextStyle(
                      color: textColor,
                      fontSize: (a < 2) ? 16.sp : 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              BsCardContainer(
                child: Column(
                  children: [
                    BsRow(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      gutter: const EdgeInsets.all(10),
                      children: [
                        BsCol(
                          sizes:const ColScreen(
                              xs: Col.col_12,
                              sm: Col.col_12,
                              md: Col.col_8),
                          child: Column(
                            children: [
                              BsRow(
                                  gutter: const EdgeInsets.all(10),
                                  crossAxisAlignment:
                                      WrapCrossAlignment.center,
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    BsCol(
                                      sizes:const ColScreen(
                                          xs: Col.col_12,
                                          sm: Col.col_12,
                                          md: Col.col_12),
                                      child: SizedBox(
                                        height: inputBoxHeith,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: "Title",
                                            border: outlineInputborder,
                                            // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                          ),
                                          onChanged: (v) {},
                                        ),
                                      ),
                                    ),
                                  ]),
                              sizedbox035,
                              BsRow(
                                  gutter: const  EdgeInsets.all(10),
                                  crossAxisAlignment:
                                      WrapCrossAlignment.center,
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    BsCol(
                                      sizes:const ColScreen(
                                          xs: Col.col_12,
                                          sm: Col.col_12,
                                          md: Col.col_12),
                                      child: TextFormField(
                                        minLines: 1,
                                        maxLines: 10,
                                        decoration: InputDecoration(
                                          labelText: "Description",
                                          border: outlineInputborder,
                                          // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                        ),
                                        onChanged: (v) {},
                                      ),
                                    ),
                                  ]),
                              sizedbox035,
                              BsCol(
                                  sizes: const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_12),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      label: const Text(
                                        "Add",
                                      ),
                                      icon: const Icon(Icons.add),
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          onPrimary: Colors.black,
                                          primary: secondaryColor2),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ]),
          SizedBox(
            width: double.infinity,
            height: inputBoxHeith,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                  minWidth: 130,
                  height: btnHeight1,
                  onPressed: () {
                    print(_profileController.previousIndex);
                    _profileController.animateTo(map["pi"]!,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeIn);
                  },
                  color: secondaryColor2,
                  textColor: textColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        color: secondaryColor2,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 130.0, minHeight: btnHeight1),
                      alignment: Alignment.center,
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: const [
                          Icon(
                            Icons.arrow_back_sharp,
                            size: 20,
                          ),
                          Text(
                            'Previous',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              MaterialButton(
                onPressed: () {
                  _profileController.animateTo(map["i"]!,
                      duration: const Duration(
                        milliseconds: 600,
                      ),
                      curve: Curves.easeIn);
                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: btnGradient,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 130.0, minHeight: btnHeight1),
                    alignment: Alignment.center,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]);
  }

  scialNetwork(Map<String, int> map) {
    return BootstrapContainer(
        // decoration: BoxDecoration(color: Colors.amber.shade100),
        fluid: true,
        children: [
          Column(children: [
            BsCard(children: [
              BsCardContainer(
                title: RichText(
                  text: TextSpan(
                    text: 'Social Network  ',
                    style: TextStyle(
                      color: textColor,
                      fontSize: (a < 2) ? 16.sp : 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              BsCardContainer(
                child: Column(
                  children: [
                    BsRow(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      gutter: const EdgeInsets.all(10),
                      children: [
                        BsCol(
                          sizes: const ColScreen(
                              xs: Col.col_12, sm: Col.col_12, md: Col.col_8),
                          child: Column(
                            children: [
                              BsRow(
                                  gutter: const EdgeInsets.only(right: 10),
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    BsCol(
                                      sizes: const ColScreen(
                                          xs: Col.col_2,
                                          sm: Col.col_2,
                                          md: Col.col_2),
                                      child: CircleAvatar(
                                        backgroundColor: facebookbgcolor,
                                        child: SvgPicture.asset(
                                          "assets/icons/facebook.svg",
                                          width: 12.0,
                                          height: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    BsCol(
                                      sizes: const ColScreen(
                                          xs: Col.col_10,
                                          sm: Col.col_10,
                                          md: Col.col_6),
                                      child: SizedBox(
                                        height: inputBoxHeith,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: "Facebook link",
                                            border: outlineInputborder,
                                            // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                          ),
                                          onChanged: (v) {},
                                        ),
                                      ),
                                    ),
                                  ]),
                              sizedbox035,
                              BsRow(
                                  gutter: const EdgeInsets.only(right: 10),
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    BsCol(
                                      sizes: const ColScreen(
                                          xs: Col.col_2,
                                          sm: Col.col_2,
                                          md: Col.col_2),
                                      child: CircleAvatar(
                                        backgroundColor: linkedIncolor,
                                        child: SvgPicture.asset(
                                          "assets/icons/in.svg",
                                          width: 12.0,
                                          height: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    BsCol(
                                      sizes: const ColScreen(
                                          xs: Col.col_10,
                                          sm: Col.col_10,
                                          md: Col.col_6),
                                      child: SizedBox(
                                        height: inputBoxHeith,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: "Linkedin link",
                                            border: outlineInputborder,
                                            // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                          ),
                                          onChanged: (v) {},
                                        ),
                                      ),
                                    ),
                                  ]),
                              sizedbox035,
                              BsRow(
                                  gutter: const EdgeInsets.only(right: 10),
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    BsCol(
                                      sizes: const ColScreen(
                                          xs: Col.col_2,
                                          sm: Col.col_2,
                                          md: Col.col_2),
                                      child: CircleAvatar(
                                        backgroundColor: twittercolor,
                                        child: SvgPicture.asset(
                                          "assets/icons/twitter.svg",
                                          width: 12.0,
                                          height: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    BsCol(
                                      sizes: const ColScreen(
                                          xs: Col.col_10,
                                          sm: Col.col_10,
                                          md: Col.col_6),
                                      child: SizedBox(
                                        height: inputBoxHeith,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: "Twitter link",
                                            border: outlineInputborder,
                                            // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                          ),
                                          onChanged: (v) {},
                                        ),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ]),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Column(
          //       children: [
          //       // Row(
          //         //   children: List<Widget>.generate(8, (int index)  {
          //         //     return Image.asset("assets/icons/job-opportunities-edited.png", width: 20, );
          //         //   }),
          //         // ),
          //         // Image.asset("assets/icons/job-opportunities-edited.png")
          //       ],
          //     ),
          //     (a > 2)
          //         ?
          //         : const Text("t"),
          //   ],
          // ),
          SizedBox(
            width: double.infinity,
            height: inputBoxHeith,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                  minWidth: 130,
                  height: btnHeight1,
                  onPressed: () {
                    print(_profileController.previousIndex);
                    _profileController.animateTo(map["pi"]!,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeIn);
                  },
                  color: secondaryColor2,
                  textColor: textColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        color: secondaryColor2,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 130.0, minHeight: btnHeight1),
                      alignment: Alignment.center,
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: const [
                          Icon(
                            Icons.arrow_back_sharp,
                            size: 20,
                          ),
                          Text(
                            'Previous',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              MaterialButton(
                onPressed: () {
                  _profileController.animateTo(map["i"]!,
                      duration: const Duration(
                        milliseconds: 600,
                      ),
                      curve: Curves.easeIn);
                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: btnGradient,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 130.0, minHeight: btnHeight1),
                    alignment: Alignment.center,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]);
  }
}

class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({Key? key, required this.a}) : super(key: key);
  final int a;

  @override
  Widget build(BuildContext context) {
    // var a = Responsive.gridSize(screenWidth);
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(200 / 360),
      child: CircularStepProgressIndicator(
        totalSteps: 90,
        currentStep: 15,
        stepSize: 6,
        selectedColor: primaryPurple,
        unselectedColor: const Color(0xFFD1D1D1),
        padding: 0,
        width: (a <= 2) ? 15.w : 10.0.w,
        height: (a <= 2) ? 15.w : 10.0.w,
        selectedStepSize: 7,
        roundedCap: (_, __) => true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(160 / 360),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black26,
              child: ClipRRect(
                child: Image.asset('assets/icons/icongradient.png'),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
