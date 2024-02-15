import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:jobhunt/about/abount_job_pref.dart';
import 'package:jobhunt/dropzone/model/dropped_file.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/const_widget.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:responsive/responsive.dart';
// import 'package:responsive/responsive_row.dart';

class AboutYourSelf extends StatefulWidget {
  const AboutYourSelf({Key? key}) : super(key: key);

  @override
  State<AboutYourSelf> createState() => _AboutYourSelfState();
}

class _AboutYourSelfState extends State<AboutYourSelf> {
  final _tAUForm = GlobalKey<FormState>();
  Map _tAUFormData = {};
  AutovalidateMode _istaUFormValidate = AutovalidateMode.disabled;

  late DropzoneViewController dropController;
  bool isHighlighted = false;

  String selectedfile = "Click to browse or drag and drop your files";
  late Text selectedfileText ;

  @override
  void initState() {
     selectedfileText = Text(selectedfile ,  textAlign: TextAlign.center, style: const TextStyle(color: forgotcolor1));
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
                            "assets/images/sin/singupwoman.png",
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
                        vertical: 50,
                        // horizontal: screenWidth * 0.02
                        horizontal: (screenWidth < 520)
                            ? screenWidth * 0.04
                            : (a <= 2)
                                ? screenWidth * 0.1
                                : screenWidth * (a * 0.01),
                      ),
                      child: Center(
                        child: Card(
                          elevation: 10,
                          color: (a <= 2)
                              ?
                              // Colors.white70
                              const Color(0xE5FFFFFF)
                              : Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                // horizontal: screenWidth/2*0.3, //:  screenWidth * 0.03,
                                horizontal: (a > 3)
                                    ? screenWidth * 0.03
                                    : screenWidth * 0.02,
                                vertical: screenHeight * 0.04),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: Form(
                                          key: _tAUForm,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  height: screenHeight * 0.03),
                                              const Text(
                                                "Tell us about yourself",
                                                style: TextStyle(
                                                    color: Color(0xFF212121),
                                                    fontSize: 40,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.03),
                                              Flex(
                                                direction:
                                                    // (a < 3)
                                                    //     ? Axis.vertical:
                                                    Axis.horizontal,
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    // height: inputBoxHeith,
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.name,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: "First name",
                                                        border:  outlineInputborder,
                                                        isDense: true,
                                                      ),
                                                      onChanged: (String v) {
                                                        _tAUFormData[
                                                            "firstName"] = v;
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
                                                  const SizedBox(
                                                    width: 30.0,
                                                  ),
                                                  Expanded(
                                                    // height: inputBoxHeith,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: "Last name",
                                                        border: outlineInputborder,
                                                        isDense: true,
                                                      ),
                                                      onChanged: (String v) {
                                                        _tAUFormData[
                                                            "lastName"] = v;
                                                      },
                                                      autovalidateMode:
                                                          _istaUFormValidate,
                                                      validator: (v) {
                                                        if (v!.isEmpty) {
                                                          return "Please Enter Last Name";
                                                        } else if (v.length <
                                                            2) {
                                                          return "Please enter valid Last Name";
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.03),
                                              //   Wrap(
                                              //     direction:  Axis.horizontal,
                                              //     crossAxisAlignment: WrapCrossAlignment.center ,

                                              //     children: [
                                              //       TextFormField(
                                              //   decoration:
                                              //       InputDecoration(
                                              //     labelText:
                                              //         "Last name",
                                              //     border: outlineInputborder,
                                              //   ),
                                              //   onChanged: (v) {},
                                              // ),
                                              // TextFormField(
                                              //   decoration:
                                              //       InputDecoration(
                                              //     labelText:
                                              //         "Last name",
                                              //     border: outlineInputborder,
                                              //   ),
                                              //   onChanged: (v) {},
                                              // ),
                                              //     ],
                                              //   ),

                                              TextFormField(
                                                maxLines: 4,
                                                decoration: InputDecoration(
                                                  labelText: "About me",
                                                  border: outlineInputborder,
                                                  isDense: true,
                                                ),
                                                onChanged: (String v) {
                                                  _tAUFormData["aboutMe"] = v;
                                                },
                                                autovalidateMode:
                                                _istaUFormValidate,
                                                validator: (v) {
                                                  if (v!.isEmpty) {
                                                    return "Please Enter About Yourself";
                                                  }
                                                  return null;
                                                },
                                              ),

                                              //
                                              SizedBox(
                                                  height: screenHeight * 0.03),
                                              Flex(
                                                direction: Axis.horizontal,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            "Designation",
                                                        border:
                                                            outlineInputborder,
                                                        isDense: true,
                                                      ),
                                                      onChanged: (String v) {
                                                        _tAUFormData[
                                                            "designation"] = v;
                                                      },
                                                      autovalidateMode:
                                                      _istaUFormValidate,
                                                      validator: (v) {
                                                        if (v!.isEmpty || v.length < 5) {
                                                          return "Please enter your designation";
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(width: 30.0),
                                                  Expanded(
                                                    flex: 1,
                                                    child: TextFormField(
                                                      decoration: InputDecoration(
                                                          labelText:
                                                              "Total experience",
                                                          border:
                                                              outlineInputborder,
                                                          isDense: true,
                                                          suffixIcon:
                                                              const Icon(Icons
                                                                  .keyboard_arrow_down_rounded)),
                                                      onChanged: (String v) {
                                                        _tAUFormData[
                                                            "totalExperience"] = v;
                                                      },
                                                      autovalidateMode:
                                                      _istaUFormValidate,
                                                      validator: (v) {
                                                        if (v!.isEmpty) {
                                                          return "Please Enter Total years of experience";
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(
                                                  height: screenHeight * 0.03),
                                              Flex(
                                                direction: Axis.horizontal,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            "Current company",
                                                        border:
                                                            outlineInputborder,
                                                        isDense: true,
                                                      ),
                                                      onChanged: (String v) {
                                                        _tAUFormData[
                                                            "currentCompany"] = v;
                                                      },
                                                      autovalidateMode:
                                                      _istaUFormValidate,
                                                      validator: (v) {
                                                        if (v!.isEmpty) {
                                                          return "Please Enter Your current company";
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(width: 30.0),
                                                  Expanded(
                                                    child: TextFormField(
                                                      decoration: InputDecoration(
                                                          labelText:
                                                              "Current Location",
                                                          border:
                                                              outlineInputborder,
                                                          isDense: true,
                                                          suffixIcon:
                                                              const Icon(Icons
                                                                  .keyboard_arrow_down_rounded)),
                                                      onChanged: (String v) {
                                                        _tAUFormData[
                                                            "currentLocationId"] = v;
                                                      },
                                                      autovalidateMode:
                                                      _istaUFormValidate,
                                                      validator: (v) {
                                                        if (v!.isEmpty) {
                                                          return "Please Enter current location";
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(
                                                  height: screenHeight * 0.03),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: "Domain",
                                                  border: outlineInputborder,
                                                  isDense: true,
                                                  suffixIcon: const Icon(Icons
                                                      .keyboard_arrow_down_rounded),
                                                ),
                                                onChanged: (String v) {
                                                  _tAUFormData["domain"] = v;
                                                },
                                                autovalidateMode:
                                                _istaUFormValidate,
                                                validator: (v) {
                                                  if (v!.isEmpty) {
                                                    return "Please Enter your domain";
                                                  } else if (v.length <
                                                      2) {
                                                    return "Please enter valid domain";
                                                  }
                                                  return null;
                                                },
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.03),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: "Top 3 skills",
                                                  border: outlineInputborder,
                                                  isDense: true,
                                                ),
                                                onChanged: (String v) {
                                                  _tAUFormData["top3Skills"] =
                                                      v;
                                                },
                                                autovalidateMode:
                                                _istaUFormValidate,
                                                validator: (v) {
                                                  if (v!.isEmpty) {
                                                    return "Please Enter your skills";
                                                  } else if (v.length <
                                                      3) {
                                                    return "Please mention your skills";
                                                  }
                                                  return null;
                                                },
                                              ),

                                              SizedBox(
                                                  height: screenHeight * 0.03),
                                              const Text(
                                                "Short summary about you record and upload",
                                                style: TextStyle(
                                                    color: pbtnColor2),
                                              ),
                                              const SizedBox(height: 15),

                                              SizedBox(
                                                height: 150,
                                                child: Container(
                                                  color:
                                                      const Color(0xFFF9F9FB),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Container(
                                                      color: isHighlighted
                                                          ? Colors
                                                              .amber.shade100
                                                          : Colors.transparent,
                                                      child: DottedBorder(
                                                        dashPattern: const [6],
                                                        color: Colors.black38,
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            final events =
                                                                await dropController
                                                                    .pickFiles();
                                                            if (events.isEmpty)
                                                              return;
                                                            onDrop(
                                                                events.first);
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                DropzoneView(
                                                                  operation:
                                                                      DragOperation
                                                                          .copy,
                                                                  cursor:
                                                                      CursorType
                                                                          .grab,
                                                                  onCreated: (ctrl) =>
                                                                      dropController =
                                                                          ctrl,
                                                                  // gestureRecognizers: ,
                                                                  // onLoaded: () =>
                                                                  //     print('Zone loaded'),
                                                                  onError: (String?
                                                                          ev) =>
                                                                      print(
                                                                          'Error: $ev'),

                                                                  onDrop:
                                                                      onDrop,
                                                                  onHover: () {
                                                                    setState(
                                                                        () {
                                                                      isHighlighted =
                                                                          true;
                                                                    });
                                                                  },
                                                                  onLeave: () {
                                                                    setState(
                                                                        () {
                                                                      isHighlighted =
                                                                          false;
                                                                    });
                                                                  },
                                                                ),
                                                                Flex(
                                                                    direction: Axis.horizontal,
                                                                    mainAxisAlignment: MainAxisAlignment .center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      Flexible(
                                                                          child: selectedfileText,

                                                                      )
                                                                    ]),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 150,
                                              //   child: Padding(
                                              //     padding: const EdgeInsets.all(20.0),
                                              //     child: DottedBorder(
                                              //       dashPattern: [6],
                                              //       color: Colors.black38,
                                              //       child: Padding(
                                              //         padding: const EdgeInsets.all(20.0),
                                              //         child: Center(
                                              //           child: Stack(
                                              //             alignment: AlignmentDirectional.center,
                                              //             children: [
                                              //               DropzoneView(
                                              //                 operation: DragOperation.copy,
                                              //                 cursor: CursorType.grab,
                                              //                 // onCreated: (DropzoneViewController ctrl) => controller = ctrl,
                                              //                 onLoaded: () => print('Zone loaded'),
                                              //                 onError: (String? ev) => print('Error: $ev'),
                                              //                 onHover: () => print('Zone hovered'),
                                              //                 onDrop: (dynamic ev) => print('Drop: $ev'),
                                              //                 onLeave: () => print('Zone left'),
                                              //               ),
                                              //               Flex(direction: Axis.horizontal, children: [
                                              //                 Flexible(
                                              //                     // flex: 1,
                                              //                     child: Text(
                                              //                         'Click to browse or drag and drop your files'))
                                              //               ]),
                                              //               // Flex(direction: Axis.horizontal,children: [Flexible(child: Text('Click to browse or drag and drop your files'))]),
                                              //             ],
                                              //           ),
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                              const SizedBox(height: 1.0),
                                              const Text(
                                                "Supported file format: MP4, AVI, MOV - upto 5MB",
                                                style: TextStyle(
                                                    color: Color(0xFF9FA2B4),
                                                    fontSize: 12.0),
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.04),
                                              MaterialButton(
                                                onPressed: () {
                                                  getData();
                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            btnRadious1)),
                                                // padding:EdgeInsets.all(0.0),
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                      gradient: btnGradient,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              btnRadious1)),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                        minHeight: btnHeight1),
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      "Next",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.03),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
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
                        "assets/images/sin/singupwoman.png",
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

  Future<void> onDrop(dynamic event) async {
    final name = event.name;
    final mime = await dropController.getFileMIME(event);
    final bytes = await dropController.getFileSize(event);
    final url = await dropController.createFileUrl(event);
    print("name: $name");
    print("mime: $mime");
    print("byte: $bytes");
    print("url: $url");
    final droppedFile =
        DroppedFile(url: url, name: name, mime: mime, bytes: bytes);
    print(droppedFile);
    selectedfile = "$name  -  ${droppedFile.size}";
    _tAUFormData["summaryPath"] = name;
    // widget.onDroppedFile(droppedFile);
    // DroppedFile()
    // setState(() {
    //   isHighlighted = false;
    // });
    setState(() {
      selectedfileText = Text(selectedfile ,  textAlign: TextAlign.center, style: const TextStyle(color: forgotcolor1));
      isHighlighted = false;
    });
  }

  void getData() {

    _istaUFormValidate = AutovalidateMode.always;
    if (_tAUForm.currentState!.validate()) {

      if(!_tAUFormData.containsKey("summaryPath")){

        setState(() {
          selectedfileText = const  Text("Please upload resume" ,  textAlign: TextAlign.center, style:  TextStyle(color: Colors.red));
        });
        return;
      }

      print(_tAUFormData);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const AbountJobPref()));
    }else{
      setState(() {

      });
    }
  }
}
