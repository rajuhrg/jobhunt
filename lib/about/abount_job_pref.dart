// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/const_widget.dart';
import 'package:jobhunt/utils/constantss.dart';
// import 'package:jobhunt/utils/const_widget.dart';
// import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';

class AbountJobPref extends StatefulWidget {
  const AbountJobPref({Key? key}) : super(key: key);

  @override
  State<AbountJobPref> createState() => _AbountJobPrefState();
}

class _AbountJobPrefState extends State<AbountJobPref> {
  final _tAUForm1 = GlobalKey<FormState>();
  Map _tAUFormData1 = {};
  AutovalidateMode _istaUFormValidate1 = AutovalidateMode.disabled;

  late double screenWidth;
  var a;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
     screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
     a = Responsive.gridSize(screenWidth);
    return Scaffold(
      body: Container(
        color: forgotpwdOutercolor,
        child: ResponsiveRow(
          children: [
            FlexWidget(
              child: Container(
                height: screenHeight,
                width: (a < 4) ? double.infinity : 600,
                decoration: BoxDecoration(
                  image: (a <= 2)
                      ? const DecorationImage(
                          image: AssetImage(
                            "assets/images/sin/jobprefman.png",
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      // width: (a < 4) ? double.infinity : 510,
                      // color: Colors.white38,
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.04,
                          horizontal: screenWidth * 0.02),
                      child: Center(
                        child: Card(
                          elevation: 10,
                          color: (a <= 2) ? Colors.white70 : Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                // horizontal: screenWidth/2*0.3, //:  screenWidth * 0.03,
                                // horizontal: screenWidth * (a * 0.01),
                                horizontal: (screenWidth < 520)
                                    ? screenWidth * 0.04
                                    : (a <= 2)
                                        ? screenWidth * 0.18
                                        : screenWidth * (a * 0.01),
                                vertical: screenHeight * 0.08),
                            child: Card(
                              elevation: 10,
                              color:
                                  (a <= 2) ? Colors.white70 : Color(0xF1FFFFFF),
                              child: Padding(
                                padding: EdgeInsets.all(screenHeight * 0.02),
                                child: SizedBox(
                                  child: Form(
                                    key: _tAUForm1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: screenHeight * 0.03),
                                        const Text(
                                          "Job Preference",
                                          style: TextStyle(
                                              color: forgotcolor1,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(height: screenHeight * 0.03),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText:
                                                "Desired Job Title/Designation ",
                                            border: outlineInputborder,
                                            isDense: true,
                                          ),
                                          onChanged: (String v) {
                                            _tAUFormData1["jobTitle"] = v;
                                          },
                                          autovalidateMode:
                                          _istaUFormValidate1,
                                          validator: (v) {
                                            if (v!.isEmpty || v.length < 5) {
                                              return "Please Enter Job Title";
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: screenHeight * 0.03),

                                        //
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: "Salary",
                                            border: outlineInputborder,
                                            isDense: true,
                                          ),
                                          onChanged: (String v) {
                                            _tAUFormData1["salary"] = v;
                                          },
                                          autovalidateMode:
                                          _istaUFormValidate1,
                                          validator: (v) {
                                            if (v!.isEmpty || v.length < 3) {
                                              return "Please enter salary";
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: screenHeight * 0.03),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: "Notice Period",
                                              border: outlineInputborder,
                                              isDense: true,
                                              suffixIcon: const Icon(Icons
                                                  .keyboard_arrow_down_rounded)),
                                          onChanged: (String v) {
                                            _tAUFormData1["noticePeriod"] = v;
                                          },
                                          autovalidateMode:
                                          _istaUFormValidate1,
                                          validator: (v) {
                                            if (v!.isEmpty || v.length < 3) {
                                              return "Please enter notice period";
                                            }
                                            return null;
                                          },
                                        ),

                                        SizedBox(height: screenHeight * 0.03),

                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: "Preferred Location",
                                              border: outlineInputborder,
                                              isDense: true,
                                              suffixIcon:const  Icon(Icons
                                                  .keyboard_arrow_down_rounded)),
                                          onChanged: (v) {
                                            _tAUFormData1["preferredLocation"] = v;
                                          },
                                          autovalidateMode:
                                          _istaUFormValidate1,
                                          validator: (v) {
                                            if (v!.isEmpty || v.length < 3) {
                                              return "Please enter Preferred Location";
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: screenHeight * 0.03),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: "Preferred Domain",
                                              border: outlineInputborder,
                                              isDense: true,
                                              suffixIcon: const Icon(Icons
                                                  .keyboard_arrow_down_rounded)),
                                          onChanged: (String v) {
                                            _tAUFormData1["preferredDomain"] = v;
                                          },
                                          autovalidateMode:
                                          _istaUFormValidate1,
                                          validator: (v) {
                                            if (v!.isEmpty || v.length < 3) {
                                              return "Please enter preferred domain";
                                            }
                                            return null;
                                          },

                                        ),

                                        SizedBox(height: screenHeight * 0.03),
                                        MaterialButton(
                                          hoverElevation: 10,
                                          onPressed: () {
                                            // Map d = Map();
                                            saveJobPref();

                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          padding: EdgeInsets.all(0.0),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                                gradient: btnGradient,
                                                borderRadius:
                                                    BorderRadius.circular(10.0)),
                                            child: Container(
                                              constraints:
                                                  const BoxConstraints(minHeight: 40.0),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                "Submit",
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              xs: 12,
              sm: 12,
              md: 7,
              lg: 6,
              xl: 6,
              xxl: 6,
              xxxl: 6,
              xsLand: 12,
              smLand: 12,
              mdLand: 7,
              lgLand: 6,
              xlLand: 6,
              xxlLand: 5,
              xxxlLand: 5,
            ),
            Visibility(
              visible: (a > 2) ? true : false,
              child: FlexWidget(
                child: Container(
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/sin/jobprefman.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                xs: 12,
                sm: 12,
                md: 5,
                lg: 6,
                xl: 6,
                xxl: 6,
                xxxl: 6,
                xsLand: 12,
                smLand: 12,
                mdLand: 5,
                lgLand: 6,
                xlLand: 7,
                xxlLand: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveJobPref() {

    _istaUFormValidate1 = AutovalidateMode.always;
    if (_tAUForm1.currentState!.validate()) {

      print(_tAUFormData1);

    }else {
      setState(() {

      });
    }

  }
}
