import 'package:awesome_select/awesome_select.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobhunt/company/pages/postJob/select_options.dart';

import 'package:jobhunt/dropzone/model/dropped_file.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/const_widget.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/logic.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PostJobComp extends StatefulWidget {
  const PostJobComp({Key? key}) : super(key: key);

  @override
  _PostJobCompState createState() => _PostJobCompState();
}

class _PostJobCompState extends State<PostJobComp>
    with SingleTickerProviderStateMixin {
  late TabController _profileController;
  DroppedFile? file;
  late int a;
  List screenNum = [6];
  Widget sizedbox035 = const SizedBox(
    height: 5,
  );
  late double screenHeight;

  var radiogroupTextstyle = TextStyle(color: textColor, fontSize: 12);
  TextStyle profielSubHeader =
      TextStyle(color: primaryBlue, fontSize: 18, fontWeight: FontWeight.w500);

  // Workplacetype workplacetype = Workplacetype.Onsite;
  // Shift shift = Shift.Day;

  var workplacetypeid = "worktype";
  var employmentType = "Fulltime";
  var shiftid = "Day";
  var modeOfInterview = "Inperson";

  var _selectedYear1 = "1";
  var _selectedYear2 = "1";

  BsSelectBoxController _selectYear = BsSelectBoxController(options: const [
    BsSelectBoxOption(value: 1, text: Text('1 ')),
    BsSelectBoxOption(value: 2, text: Text('2 ')),
    BsSelectBoxOption(value: 3, text: Text('3 ')),
    BsSelectBoxOption(value: 4, text: Text('4 ')),
    BsSelectBoxOption(value: 5, text: Text('5 ')),
    BsSelectBoxOption(value: 6, text: Text('6 ')),
  ]);


 List<S2Choice<String>> yearOptions = [
  S2Choice<String>(value: '1', title: '1'),
  S2Choice<String>(value: '2', title: '2'),
  S2Choice<String>(value: '3', title: '3'),
  S2Choice<String>(value: '4', title: '4'),
  S2Choice<String>(value: '5', title: '5'),
  S2Choice<String>(value: '6', title: '6'),
  S2Choice<String>(value: '7', title: '7'),
  S2Choice<String>(value: '8', title: '8'),
  S2Choice<String>(value: '9', title: '9'),
  S2Choice<String>(value: '10', title: '10'),
  S2Choice<String>(value: '11', title: '11'),
  S2Choice<String>(value: '12', title: '12'),
  S2Choice<String>(value: '13', title: '13'),
  S2Choice<String>(value: '14', title: '14'),
  S2Choice<String>(value: '15', title: '15'),
  S2Choice<String>(value: '16', title: '16'),
  S2Choice<String>(value: '17', title: '17'),
    
];

  @override
  void initState() {
    _profileController = TabController(length: 7, vsync: this);
    super.initState();
  }

  void dispose() {
    _profileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    screenHeight = mediaquerySize.height;
    a = Responsive.gridSize(screenWidth);
    sizedbox035 = SizedBox(
      height: screenHeight * 0.035,
      width: (a <= 2) ? 20 : double.infinity,
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: homebgColor,
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: BsContainer(
              color: homebgColor,
              child: BsCol(
                child: Column(
                  children: [
                    BsCol(
                      visibility: BsVisibility.none,
                      child:
                          TabBar(controller: _profileController, tabs: const [
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
                      ]),
                    ),
                    BsCol(
                      padding: EdgeInsets.all((a < 3) ? 5 : 20),
                      child: SizedBox(
                        height: (kIsWeb) ? screenHeight - 80 : screenHeight,
                        child: Padding(
                          padding: EdgeInsets.all((a > 2) ? 30 : 5),
                          child: TabBarView(
                            physics: const ClampingScrollPhysics(),
                            controller: _profileController,
                            children: [
                              postJobProfile({"i": 1, "pi": 0}),
                              postjobskill({"i": 2, "pi": 0}),
                              postjobeducation({"i": 3, "pi": 1}),
                              postJobDescription({"i": 4, "pi": 2}),
                              postCompanySPoC({"i": 5, "pi": 3}),
                              postAssessment({"i": 6, "pi": 4}),
                              postPreView({"i": 7, "pi": 5}),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  postJobProfile(Map<String, int> map) {
    return ListView(
      // physics: const ClampingScrollPhysics(),
      children: [
        BootstrapContainer(
            // decoration: BoxDecoration(color: Colors.amber.shade100),
            fluid: true,
            decoration: BoxDecoration(color: homebgColor),
            children: [
              Column(children: [
                BsCard(children: [
                  BsCol(
                      padding: EdgeInsets.all((a < 2) ? 10 : 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Job Profile",
                            style: TextStyle(
                              color: textColor,
                              fontSize: (a < 2) ? 16.sp : 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Job ID :  ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: secondaryColor2const,
                                  ),
                                  // Color(0xFF253269)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' 5894 6921',
                                      style: TextStyle(
                                        color: iconColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Reference ID :  ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: pColor2,
                                  ),
                                  // Color(0xFF253269)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' 5894 6921',
                                      style: TextStyle(
                                        color: iconColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  BsCardContainer(
                    child: BsCardContainer(
                      child: BsCol(
                        child: BsRow(
                          gutter: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: (a > 2) ? a * 5 : a * 2),
                          children: [
                            BsCol(
                                sizes: ColScreen(
                                  xs: Col.col_12,
                                  sm: Col.col_12,
                                  md: Col.col_6,
                                ),
                                child: SizedBox(
                                  height: inputBoxHeith,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Job Title",
                                      border: outlineInputborder,
                                      // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                    ),
                                    onChanged: (v) {},
                                  ),
                                )),
                            BsCol(
                                sizes: ColScreen(
                                  xs: Col.col_12,
                                  sm: Col.col_12,
                                  md: Col.col_6,
                                ),
                                child: SizedBox(
                                  height: inputBoxHeith,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Business stream",
                                      border: outlineInputborder,
                                      // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                    ),
                                    onChanged: (v) {},
                                  ),
                                )),
                            BsCol(
                              sizes: ColScreen(
                                xs: Col.col_12,
                                sm: Col.col_12,
                                md: Col.col_6,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Work place type :  ',
                                    style: profielSubHeader,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    // crossAxisAlignment: WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.spaceBetween,
                                    alignment: WrapAlignment.start,
                                    children: [
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Radio(
                                            value: "On-site",
                                            groupValue: workplacetypeid,
                                            onChanged: (value) {
                                              setState(() {
                                                workplacetypeid =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          Text('On-site'),
                                        ],
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Radio(
                                            value: "Remote",
                                            groupValue: workplacetypeid,
                                            onChanged: (value) {
                                              setState(() {
                                                workplacetypeid =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          Text('Remote'),
                                        ],
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Radio(
                                            value: "Hybrid",
                                            groupValue: workplacetypeid,
                                            onChanged: (value) {
                                              setState(() {
                                                workplacetypeid =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          const Text('Hybrid'),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            BsCol(
                              sizes: ColScreen(
                                xs: Col.col_12,
                                sm: Col.col_12,
                                md: Col.col_6,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Employment Type   ',
                                      style: profielSubHeader),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    // crossAxisAlignment: WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.spaceBetween,
                                    alignment: WrapAlignment.start,
                                    children: [
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Radio(
                                            value: "Fulltime",
                                            groupValue: employmentType,
                                            onChanged: (value) {
                                              setState(() {
                                                employmentType =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          Text('Full time'),
                                        ],
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Radio(
                                            value: "Parttime",
                                            groupValue: employmentType,
                                            onChanged: (value) {
                                              setState(() {
                                                employmentType =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          Text('Part time'),
                                        ],
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Radio(
                                            value: "Contract",
                                            groupValue: employmentType,
                                            onChanged: (value) {
                                              setState(() {
                                                employmentType =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          const Text('Contract'),
                                        ],
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Radio(
                                            value: "Internship",
                                            groupValue: employmentType,
                                            onChanged: (value) {
                                              setState(() {
                                                employmentType =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                          const Text('Internship'),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            BsCol(
                              sizes: ColScreen(
                                xs: Col.col_12,
                                sm: Col.col_12,
                                md: Col.col_6,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Shift   ', style: profielSubHeader),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    // crossAxisAlignment: WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.spaceBetween,
                                    alignment: WrapAlignment.start,
                                    children: [
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Radio(
                                            value: "Day",
                                            groupValue: shiftid,
                                            onChanged: (value) {
                                              setState(() {
                                                shiftid = value.toString();
                                              });
                                            },
                                          ),
                                          Text('Day',
                                              style: radiogroupTextstyle),
                                        ],
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Radio(
                                            value: "Night",
                                            groupValue: shiftid,
                                            onChanged: (value) {
                                              setState(() {
                                                shiftid = value.toString();
                                              });
                                            },
                                          ),
                                          Text('Night'),
                                        ],
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Radio(
                                            value: "Rotational",
                                            groupValue: shiftid,
                                            onChanged: (value) {
                                              setState(() {
                                                shiftid = value.toString();
                                              });
                                            },
                                          ),
                                          const Text('Rotational'),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            BsCol(
                                sizes: const ColScreen(
                                  xs: Col.col_12,
                                  sm: Col.col_12,
                                  md: Col.col_6,
                                ),
                                child: Row(children: [
                                  Text(
                                    "No of Hiring",
                                    style: profielSubHeader,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: inputBoxHeith,
                                    constraints:
                                        const BoxConstraints(maxWidth: 130),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: outlineInputborder,
                                          suffixIcon: const Icon(
                                              Icons.keyboard_arrow_down)),
                                      onChanged: (v) {},
                                    ),
                                  ),
                                ])),
                            BsCol(
                              child: BsRow(
                                gutter: EdgeInsets.only(
                                    right: (a > 2) ? a * 5 : a * 2),
                                children: [
                                  BsCol(
                                    sizes: const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_6,
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Job Location",
                                            style: profielSubHeader,
                                          ),
                                          SizedBox(
                                            height: inputBoxHeith,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: "Job Location",
                                                  border: outlineInputborder,
                                                  suffixIcon: const Icon(Icons
                                                      .keyboard_arrow_down)),
                                              onChanged: (v) {},
                                            ),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            BsCol(
                              child: BsRow(
                                gutter: EdgeInsets.only(
                                    right: (a > 2) ? a * 5 : a * 2),
                                children: [
                                  BsCol(
                                    sizes: ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_6,
                                    ),
                                    child: BsRow(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          BsCol(
                                            sizes: ColScreen(
                                              xs: Col.col_3,
                                              sm: Col.col_3,
                                              md: Col.col_3,
                                            ),
                                            child: Text(
                                              "Experience",
                                              style: profielSubHeader,
                                            ),
                                          ),
                                          BsCol(
                                            sizes: ColScreen(
                                              xs: Col.col_4,
                                              sm: Col.col_4,
                                              md: Col.col_4,
                                            ),
                                            child: SizedBox(
                                              height: inputBoxHeith,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    border: outlineInputborder,
                                                    suffixIcon: const Icon(Icons
                                                        .keyboard_arrow_down)),
                                                onChanged: (v) {},
                                              ),
                                            ),
                                          ),
                                          const BsCol(
                                            sizes: ColScreen(
                                              xs: Col.col_1,
                                              sm: Col.col_1,
                                              md: Col.col_1,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(" to "),
                                          ),
                                          BsCol(
                                            sizes: ColScreen(
                                              xs: Col.col_4,
                                              sm: Col.col_4,
                                              md: Col.col_4,
                                            ),
                                            child: SizedBox(
                                              height: inputBoxHeith,
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    border: outlineInputborder,
                                                    suffixIcon: const Icon(Icons
                                                        .keyboard_arrow_down)),
                                                onChanged: (v) {},
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            BsCol(
                              child: BsRow(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: Alignment.bottomLeft,
                                children: [
                                  BsCol(
                                    margin: EdgeInsets.only(
                                        right: (a > 2) ? a * 5 : a * 2),
                                    sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_12,
                                        md: Col.col_6),
                                    child: SizedBox(
                                      height: inputBoxHeith,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Closure date",
                                          border: outlineInputborder,
                                          suffixIcon: const Icon(
                                            Icons.calendar_today_outlined,
                                          ),
                                          // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                        ),
                                        onChanged: (v) {},
                                      ),
                                    ),
                                  ),
                                  BsCol(
                                    margin: EdgeInsets.only(
                                        left: (a > 2) ? a * 5 : a * 2),
                                    sizes: const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_6,
                                    ),
                                    child: BsRow(
                                      children: [
                                        BsCol(
                                          child: Wrap(
                                              direction: Axis.horizontal,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              children: [
                                                Text(
                                                  "Salary (CTC Per Annum)",
                                                  style: profielSubHeader,
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: SvgPicture.asset(
                                                      "assets/icons/googleweb.svg",
                                                      width: 12.0,
                                                      height: 18,
                                                      color: textColor2),
                                                ),
                                                Text("Public",
                                                    style: TextStyle(
                                                        color: textColor2,
                                                        fontSize: 12)),
                                              ]),
                                        ),
                                        BsCol(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          sizes: const ColScreen(
                                              xs: Col.col_6,
                                              sm: Col.col_6,
                                              md: Col.col_6),
                                          child: SizedBox(
                                            height: inputBoxHeith,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: "Min CTC",
                                                border: outlineInputborder,
                                                // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                              ),
                                              onChanged: (v) {},
                                            ),
                                          ),
                                        ),
                                        BsCol(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          sizes: const ColScreen(
                                              xs: Col.col_6,
                                              sm: Col.col_6,
                                              md: Col.col_6),
                                          child: SizedBox(
                                            height: inputBoxHeith,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: "Min CTC",
                                                border: outlineInputborder,

                                                // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                              ),
                                              onChanged: (v) {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                    _profileController.animateTo(map["i"]!,
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeIn);
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
              SizedBox(
                width: double.infinity,
                height: inputBoxHeith,
              ),
            ]),
      ],
    );
  }

  postjobskill(Map<String, int> map) {
    return ListView(
      children: [
        BootstrapContainer(
            // decoration: BoxDecoration(color: Colors.amber.shade100),
            fluid: true,
            children: [
              Column(children: [
                BsCard(children: [
                  BsCol(
                      padding: EdgeInsets.all((a < 2) ? 10 : 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Skills",
                            style: TextStyle(
                              color: textColor,
                              fontSize: (a < 2) ? 16.sp : 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Job ID :  ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: pColor2,
                                  ),
                                  // Color(0xFF253269)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' 5894 6921',
                                      style: TextStyle(
                                        color: iconColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
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
                                padding: const EdgeInsets.all(10),
                                sizes: const ColScreen(
                                    xs: Col.col_12,
                                    sm: Col.col_12,
                                    md: Col.col_5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Must have skills  ',
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
                                                style: BsSelectBoxStyle(
                                                  hintTextColor: primaryPurple,
                                                  border: Border.all(color: otpFieldBorderColor),
                                                  focusedBorder: Border.all(color: primaryPurple, width: 2,)),
                                                  onChange: (v){

                                                  },

                                                padding: EdgeInsets.all(
                                                    (a < 2) ? 4 : 8),
                                                hintTextLabel: 'Year',
                                                controller: _selectYear,
                                              ),
                                              // SmartSelect<String>.single(
                                                
                                              //   title: 'Year',
                                              //   selectedValue: _selectedYear1,
                                              //   // value: _selectedYear1,

                                              //   choiceItems: yearOptions,
                                                
                                              //   onChange: (state) => setState(
                                              //       () => _selectedYear1 =
                                              //           state.value!),
                                              // ),
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
                                                style: BsSelectBoxStyle(
                                                    border: Border.all(
                                                        color:
                                                            otpFieldBorderColor),
                                                    focusedBorder: Border.all(
                                                        color: primaryPurple,
                                                        width: 2)),
                                                padding: EdgeInsets.all(
                                                    (a < 2) ? 4 : 8),
                                                hintTextLabel: 'Month',
                                                controller: _selectYear,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
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
                                    md: Col.col_5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Good to have skills   ',
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
                                          labelText: "Core skill ",
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10)),
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
        SizedBox(
          width: double.infinity,
          height: inputBoxHeith,
        ),
      ],
    );
  }

  postjobeducation(Map<String, int> map) {
    return ListView(
      children: [
        BootstrapContainer(
            // decoration: BoxDecoration(color: Colors.amber.shade100),
            fluid: true,
            children: [
              Column(children: [
                BsCard(children: [
                  BsCol(
                      padding: EdgeInsets.all((a < 2) ? 10 : 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Education",
                            style: TextStyle(
                              color: textColor,
                              fontSize: (a < 2) ? 16.sp : 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Job ID :  ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: pColor2,
                                  ),
                                  // Color(0xFF253269)),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' 5894 6921',
                                      style: TextStyle(
                                        color: iconColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  BsCardContainer(
                    child: BsRow(
                      children: [
                        BsCol(
                            sizes: const ColScreen(
                              xs: Col.col_12,
                              sm: Col.col_12,
                              md: Col.col_7,
                              lg: Col.col_5,
                            ),
                            padding: EdgeInsets.all((a < 3) ? 3 : 8),
                            child: BsRow(
                              gutter: EdgeInsets.symmetric(vertical: 10),
                              children: [
                                BsCol(
                                  child: SizedBox(
                                    height: inputBoxHeith,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Education",
                                        border: outlineInputborder,
                                        // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                      ),
                                      onChanged: (v) {},
                                    ),
                                  ),
                                ),
                                BsCol(
                                  child: SizedBox(
                                    height: inputBoxHeith,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Certificatation",
                                        border: outlineInputborder,
                                        // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                      ),
                                      onChanged: (v) {},
                                    ),
                                  ),
                                ),
                              ],
                            )),
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
        SizedBox(
          width: double.infinity,
          height: inputBoxHeith,
        ),
      ],
    );
  }

  postJobDescription(Map<String, int> map) {
    return ListView(
      children: [
        BootstrapContainer(
            // decoration: BoxDecoration(color: Colors.amber.shade100),
            fluid: true,
            children: [
              Column(children: [
                BsCol(
                  sizes: const ColScreen(
                    xs: Col.col_12,
                    sm: Col.col_12,
                    md: Col.col_6,
                  ),
                  child: BsRow(
                    gutter: EdgeInsets.symmetric(
                        horizontal: (a < 3) ? 3.0.w : 2.0.w, vertical: 0.5.w),
                    children: [
                      BsCol(
                          padding: EdgeInsets.all((a < 3) ? 3 : 8),
                          child: BsCard(
                            children: [
                              BsCol(
                                  padding: EdgeInsets.all((a < 2) ? 10 : 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Job Description ",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: (a < 2) ? 16.sp : 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'Job ID :  ',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0,
                                                color: pColor2,
                                              ),
                                              // Color(0xFF253269)),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' 5894 6921',
                                                  style: TextStyle(
                                                    color: iconColor,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                              BsRow(
                                gutter: EdgeInsets.all(3.0.w),
                                children: [
                                  BsCol(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Job Description ",
                                        border: outlineInputborder,
                                        // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                      ),
                                      minLines: 3,
                                      maxLines: 6,
                                      onChanged: (v) {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      BsCol(
                          padding: EdgeInsets.all((a < 3) ? 3 : 8),
                          child: BsCard(
                            children: [
                              BsCol(
                                  padding: EdgeInsets.all((a < 2) ? 10 : 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Roles and Responsibilities ",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: (a < 2) ? 16.sp : 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )),
                              BsRow(
                                // gutter: EdgeInsets.all((a<3)?3.0.w:0.5.w),
                                gutter: EdgeInsets.all(3.0.w),
                                children: [
                                  BsCol(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText:
                                            "Roles and Responsibilities ",
                                        hintText: "Roles and Responsibilities",
                                        border: outlineInputborder,
                                        // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                      ),
                                      minLines: 3,
                                      maxLines: 6,
                                      onChanged: (v) {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
              SizedBox(
                width: double.infinity,
                height: inputBoxHeith,
              ),
              BsCol(
                padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                child: Row(
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
                ),
              )
            ]),
        SizedBox(
          width: double.infinity,
          height: inputBoxHeith,
        ),
      ],
    );
  }

  postCompanySPoC(Map<String, int> map) {
    return ListView(
      children: [
        BootstrapContainer(
            // decoration: BoxDecoration(color: Colors.amber.shade100),
            fluid: true,
            children: [
              Column(children: [
                BsCol(
                  sizes: const ColScreen(
                    xs: Col.col_12,
                    sm: Col.col_12,
                    md: Col.col_6,
                  ),
                  child: BsRow(
                    gutter: EdgeInsets.all(2.0.w),
                    children: [
                      BsCol(
                          padding: EdgeInsets.all((a < 3) ? 3 : 8),
                          child: BsCard(
                            children: [
                              BsCol(
                                  padding: EdgeInsets.all((a < 2) ? 10 : 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Company SPoC ",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: (a < 2) ? 16.sp : 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'Job ID :  ',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0,
                                                color: pColor2,
                                              ),
                                              // Color(0xFF253269)),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' 5894 6921',
                                                  style: TextStyle(
                                                    color: iconColor,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                              BsRow(
                                gutter: EdgeInsets.all((a < 3) ? 3.0.w : 1.5.w),
                                children: [
                                  BsCol(
                                    sizes: const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_6,
                                    ),
                                    order: const ColOrder(
                                        xs: 1, sm: 1, md: 1, lg: 1, xl: 1),
                                    child: SizedBox(
                                      height: inputBoxHeith,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Contact Person Name ",
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
                                      sm: Col.col_12,
                                      md: Col.col_6,
                                    ),
                                    order: const ColOrder(
                                        xs: 3,
                                        sm: 3,
                                        md: 2,
                                        lg: 2,
                                        xl: 2,
                                        xxl: 2),
                                    child: BsRow(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      transformAlignment: Alignment.centerRight,
                                      children: [
                                        BsCol(
                                          sizes: const ColScreen(
                                            xs: Col.col_8,
                                            sm: Col.col_8,
                                            md: Col.col_8,
                                          ),
                                          // margin: EdgeInsets.only(right: 10),
                                          child: SizedBox(
                                            height: inputBoxHeith,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: "Phone Number ",
                                                border: outlineInputborder,
                                                // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                              ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              onChanged: (v) {},
                                            ),
                                          ),
                                        ),
                                        BsCol(
                                          alignment: Alignment.centerRight,
                                          sizes: const ColScreen(
                                            xs: Col.col_4,
                                            sm: Col.col_3,
                                            md: Col.col_3,
                                          ),
                                          // offset: ColScreen(
                                          //   xs: Col.col_1,
                                          //   sm: Col.col_1,
                                          // ),

                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                              height: inputBoxHeith - 4,
                                              child: MaterialButton(
                                                padding: EdgeInsets.all(0.0),
                                                onPressed: () {},
                                                child: const Text("Verify"),
                                                color: secondaryColor2,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  BsCol(
                                    sizes: const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_6,
                                    ),
                                    order: const ColOrder(
                                        xs: 4,
                                        sm: 4,
                                        md: 4,
                                        lg: 4,
                                        xl: 4,
                                        xxl: 4),
                                    child: BsRow(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      transformAlignment: Alignment.centerRight,
                                      children: [
                                        BsCol(
                                          sizes: const ColScreen(
                                            xs: Col.col_8,
                                            sm: Col.col_8,
                                            md: Col.col_8,
                                          ),
                                          // margin: EdgeInsets.only(right: 10),
                                          child: SizedBox(
                                            height: inputBoxHeith,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: "Email ",
                                                border: outlineInputborder,
                                                // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                              ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              onChanged: (v) {},
                                            ),
                                          ),
                                        ),
                                        BsCol(
                                          alignment: Alignment.centerRight,
                                          sizes: const ColScreen(
                                            xs: Col.col_4,
                                            sm: Col.col_3,
                                            md: Col.col_3,
                                          ),
                                          // offset: ColScreen(
                                          //   xs: Col.col_1,
                                          //   sm: Col.col_1,
                                          // ),

                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                              height: inputBoxHeith - 4,
                                              child: MaterialButton(
                                                padding: EdgeInsets.all(0.0),
                                                onPressed: () {},
                                                child: const Text("Verify"),
                                                color: secondaryColor2,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  BsCol(
                                    sizes: const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_6,
                                    ),
                                    order: const ColOrder(
                                      xs: 2,
                                      sm: 2,
                                      md: 3,
                                      lg: 3,
                                      xl: 3,
                                      xxl: 3,
                                    ),
                                    // margin: EdgeInsets.only(right: 10),
                                    child: SizedBox(
                                      height: inputBoxHeith,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Website ",
                                          border: outlineInputborder,
                                          // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (v) {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              BsRow(
                                gutter: EdgeInsets.all((a < 3) ? 3.0.w : 1.5.w),
                                children: [
                                  BsCol(
                                    sizes: const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_10,
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: "Address ",
                                        border: outlineInputborder,
                                      ),
                                      minLines: 3,
                                      maxLines: 4,
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (v) {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
              SizedBox(
                width: double.infinity,
                height: inputBoxHeith,
              ),
              BsCol(
                padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                child: Row(
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
                ),
              )
            ]),
        SizedBox(
          width: double.infinity,
          height: inputBoxHeith,
        ),
      ],
    );
  }

  postAssessment(Map<String, int> map) {
    return ListView(
      children: [
        BootstrapContainer(
            // decoration: BoxDecoration(color: Colors.amber.shade100),
            fluid: true,
            children: [
              Column(children: [
                BsCol(
                  sizes: const ColScreen(
                    xs: Col.col_12,
                    sm: Col.col_12,
                    md: Col.col_6,
                  ),
                  child: BsRow(
                    gutter: EdgeInsets.symmetric(
                        horizontal: 3.0.w, vertical: 0.5.w),
                    children: [
                      BsCol(
                          padding: EdgeInsets.all((a < 3) ? 3 : 8),
                          child: BsCard(
                            children: [
                              BsCol(
                                  padding: EdgeInsets.all((a < 2) ? 10 : 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Assessment ",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: (a < 2) ? 16.sp : 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'Job ID :  ',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0,
                                                color: pColor2,
                                              ),
                                              // Color(0xFF253269)),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' 5894 6921',
                                                  style: TextStyle(
                                                    color: iconColor,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                              BsRow(
                                gutter: EdgeInsets.symmetric(
                                    vertical: 1.0.w, horizontal: 3.0.w),
                                children: [
                                  BsCol(
                                    sizes: const ColScreen(
                                      xs: Col.col_12,
                                      sm: Col.col_12,
                                      md: Col.col_10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: inputBoxHeith,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: "Question - 1 ",
                                              border: outlineInputborder,
                                              // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                            ),
                                            onChanged: (v) {},
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 200),
                                            child: ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: Icon(Icons.add),
                                              label: Text("Add"),
                                              style: ElevatedButton.styleFrom(
                                                primary: secondaryColor2,
                                                onPrimary: Colors.black,
                                                maximumSize:
                                                    const Size(200, 38),
                                                minimumSize:
                                                    const Size(150, 35),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      BsCol(
                          padding: EdgeInsets.all((a < 3) ? 3 : 8),
                          child: BsCard(
                            children: [
                              BsCol(
                                  padding: EdgeInsets.all((a < 2) ? 10 : 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Interview ",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: (a < 2) ? 16.sp : 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )),
                              BsCol(
                                sizes: const ColScreen(
                                  xs: Col.col_12,
                                  sm: Col.col_12,
                                  md: Col.col_6,
                                ),
                                child: BsRow(
                                  gutter:
                                      EdgeInsets.all((a < 3) ? 3.0.w : 0.5.w),
                                  children: [
                                    BsCol(
                                      sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_12,
                                        md: Col.col_6,
                                      ),
                                      child: BsRow(
                                        gutter: EdgeInsets.all(1.0.w),
                                        children: [
                                          BsCol(
                                            // sizes: const ColScreen(
                                            //   xs: Col.col_12,
                                            //   sm: Col.col_11,
                                            //   md: Col.col_6,
                                            // ),
                                            child: SizedBox(
                                              height: inputBoxHeith,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    labelText:
                                                        "Interview rounds ",
                                                    border: outlineInputborder,
                                                    suffixIcon: const Icon(Icons
                                                        .keyboard_arrow_down)),
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (v) {},
                                              ),
                                            ),
                                          ),
                                          BsCol(
                                            // sizes: const ColScreen(
                                            //   xs: Col.col_12,
                                            //   sm: Col.col_12,
                                            //   md: Col.col_6,
                                            // ),
                                            child: SizedBox(
                                              height: inputBoxHeith,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText:
                                                      "Interview rounds - 01 ",
                                                  border: outlineInputborder,
                                                  // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (v) {},
                                              ),
                                            ),
                                          ),
                                          BsCol(
                                            // sizes: const ColScreen(
                                            //   xs: Col.col_12,
                                            //   sm: Col.col_12,
                                            //   md: Col.col_6,
                                            // ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: inputBoxHeith,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "Interview rounds - 02 ",
                                                      border:
                                                          outlineInputborder,
                                                      // contentPadding: EdgeInsets.only(top: 10 , bottom: 0, right: 15,left: 10),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (v) {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    BsCol(
                                      sizes: const ColScreen(
                                        xs: Col.col_12,
                                        sm: Col.col_12,
                                        md: Col.col_6,
                                      ),
                                      child: BsRow(
                                        gutter: EdgeInsets.all(1.0.w),
                                        children: [
                                          BsCol(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Mode of Interview ",
                                                    style: profielSubHeader),
                                                Wrap(
                                                  // crossAxisAlignment: WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment: WrapAlignment
                                                      .spaceBetween,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  children: [
                                                    Wrap(
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .center,
                                                      children: [
                                                        Radio(
                                                          value: "Inperson",
                                                          groupValue:
                                                              modeOfInterview,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              modeOfInterview =
                                                                  value
                                                                      .toString();
                                                            });
                                                          },
                                                        ),
                                                        Text('In person',
                                                            style:
                                                                radiogroupTextstyle),
                                                      ],
                                                    ),
                                                    Wrap(
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .center,
                                                      children: [
                                                        Radio(
                                                          value: "Virtual",
                                                          groupValue:
                                                              modeOfInterview,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              modeOfInterview =
                                                                  value
                                                                      .toString();
                                                            });
                                                          },
                                                        ),
                                                        Text('Virtual'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          BsCol(
                                            sizes: const ColScreen(
                                              xs: Col.col_12,
                                              sm: Col.col_12,
                                              md: Col.col_8,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: inputBoxHeith,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          "Interview panel",
                                                      border:
                                                          outlineInputborder,
                                                      suffixIcon: const Icon(Icons
                                                          .keyboard_arrow_down),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (v) {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
              SizedBox(
                width: double.infinity,
                height: inputBoxHeith,
              ),
              BsRow(
                gutter:
                    EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 0.5.w),
                children: [
                  BsCol(
                    sizes: const ColScreen(
                      xs: Col.col_12,
                      sm: Col.col_12,
                      md: Col.col_10,
                      lg: Col.col_8,
                    ),
                    offset: const ColScreen(
                      md: Col.col_2,
                      lg: Col.col_4,
                    ),
                    // offset: ColScreen(
                    //   md: Col.col_6
                    // ),
                    child: BsRow(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      alignment: Alignment.centerRight,
                      children: [
                        BsCol(
                          alignment: Alignment.centerRight,
                          sizes: const ColScreen(
                            xs: Col.col_4,
                            sm: Col.col_4,
                            md: Col.col_3,
                            lg: Col.col_3,
                          ),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 130.0, minHeight: btnHeight1),
                              alignment: Alignment.center,
                              child: const Text("Save Draft"),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 2,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        BsCol(
                          alignment: Alignment.centerRight,
                          sizes: const ColScreen(
                            xs: Col.col_4,
                            sm: Col.col_4,
                            md: Col.col_3,
                            lg: Col.col_3,
                          ),
                          child: MaterialButton(
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
                                  child: const Text(
                                    'Preview Job',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        BsCol(
                          alignment: Alignment.centerRight,
                          sizes: const ColScreen(
                            xs: Col.col_4,
                            sm: Col.col_4,
                            md: Col.col_3,
                            lg: Col.col_3,
                          ),
                          child: MaterialButton(
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
                                  'Post Job',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
        SizedBox(
          width: double.infinity,
          height: inputBoxHeith,
        ),
      ],
    );
  }

  postPreView(Map<String, int> map) {
    return ListView(
      children: [
        BootstrapContainer(
            // decoration: BoxDecoration(color: Colors.amber.shade100),
            fluid: true,
            children: [
              Column(children: [
                SizedBox(
                  width: double.infinity,
                  height: inputBoxHeith,
                ),
                Text("Here will show the dynamic content of post job data",
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 20,
                    )),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight - 150,
                ),
                BsCol(
                  sizes: const ColScreen(
                    xs: Col.col_12,
                    sm: Col.col_12,
                    md: Col.col_4,
                  ),
                  offset: const ColScreen(md: Col.col_4),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // alignment:(a<3)?WrapAlignment.spaceBetween:  WrapAlignment.spaceEvenly,
                      // crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text("Save Draft"),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 2,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            print("done post job");
                            // _profileController.animateTo(map["pi"]!,
                            //     duration: const Duration(
                            //       milliseconds: 600,
                            //     ),
                            //     curve: Curves.easeIn);
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
                                'Post Job',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                )
              ]),
              SizedBox(
                width: double.infinity,
                height: inputBoxHeith,
              ),
            ]),
      ],
    );
  }
}
