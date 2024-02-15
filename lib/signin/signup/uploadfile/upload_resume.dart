import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:jobhunt/dropzone/model/dropped_file.dart';
import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:responsive/responsive.dart';

class UploadResume extends StatefulWidget {


  // final ValueChanged<DroppedFile> onDroppedFile; //(DroppedFile file);
  // void onDroppedFile(DroppedFile droppedFile) {}
  // const UploadResume({Key? key, required this.onDroppedFile})
  //     : super(key: key);

  const UploadResume({Key? key}) : super(key: key);

  @override
  State<UploadResume> createState() => _UploadResumeState();
}

class _UploadResumeState extends State<UploadResume> {
  late DropzoneViewController dropController;
  // final ValueChanged<DroppedFile> onDroppedFile;
  bool isHighlighted = false;
  String selectedfile = "Upload the file";
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    var a = Responsive.gridSize(screenWidth);
    return Scaffold(
      body: Container(
        color: const Color(0xFFE5E5E5),
        child: Center(
          // child: ResponsiveRow(
          //   children: [
              // FlexWidget(
                child: Container(
                  // color: Color(0xFFFAFAFC),
                  color:const Color.fromRGBO(250, 250, 252, 0.91),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenHeight * 0.05,
                      vertical: screenWidth * 0.05),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/sin/upimg.png",
                        // width: 100.0.sp,
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 150.0,
                        height: 20.0,
                        child: LiquidLinearProgressIndicator(
                          backgroundColor: const Color(0xFFE0E0E0),
                          valueColor: const AlwaysStoppedAnimation(pbtnColor2),
                          borderColor: const Color(0xFF9B9B9B),
                          borderWidth: 1.0,
                          borderRadius: 10.0,
                          center: const Icon(
                            Icons.upload_file,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   height: 35,
                      //   padding: EdgeInsets.symmetric(horizontal: 24.0),
                      //   child: LiquidLinearProgressIndicator(
                      //     backgroundColor: const Color(0xFFE0E0E0),
                      //     valueColor: AlwaysStoppedAnimation(pbtnColor2),
                      //     direction: Axis.horizontal,
                      //   ),
                      // ),
                      SizedBox(
                        height: 120.0,
                        child: Container(
                          color:const  Color(0xFFF9F9FB),

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              color: isHighlighted ? Colors.amber.shade100 : Colors.transparent,
                              child: DottedBorder(
                                dashPattern: const [6],
                                borderType: BorderType.Rect,
                                color: Colors.black38,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      final events = await dropController.pickFiles();
                                      if (events.isEmpty) return;
                                      onDrop(events.first);
                                    },
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.grab,
                                          onCreated: (ctrl) => dropController = ctrl,
                                          // onCreated: (DropzoneViewController ctrl) => controller = ctrl,
                                          // onLoaded: () => print('Zone loaded'),
                                          onError: (String? ev) => print('Error: $ev'),
                                          // onHover: () => print('Zone hovered'),
                                          onDrop: onDrop,
                                          onHover: () {
                                            setState(() {
                                              isHighlighted = true;
                                            });
                                          },
                                          onLeave: () {
                                            setState(() {
                                              isHighlighted = false;
                                            });
                                          },
                                          // onLeave: () => print('Zone left'),
                                        ),
                                        SizedBox(
                                          child: Wrap(
                                            alignment: WrapAlignment.center,
                                            direction: Axis.horizontal,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              const Icon(Icons.upload),
                                              Text(selectedfile),
                                            ],
                                          ),
                                        ),
                                        // Flex(direction: Axis.horizontal, children: [
                                        //   Flexible(
                                        //     flex: 1,
                                        //     child: Text(

                                        //         'Click to browse or drag and drop your files', textAlign: TextAlign.center,),
                                        //   )
                                        // ]
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const Text(
                        "Attach file in Pdf, doc & jpeg. these are format will be upported.",
                        style: TextStyle(
                          color: pbtnColor2,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const  Text(
                        " File size of your documents should not exceed 10MB",
                        style: TextStyle(
                          color: pbtnColor2,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      MaterialButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutYourSelf()));

                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(btnRadious1)),
                        padding:const  EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: btnGradient,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            constraints:const  BoxConstraints(
                                maxWidth: 300.0, minHeight: 40.0),
                            alignment: Alignment.center,
                            child:const  Text(
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
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Do you need help?",
                            style: TextStyle(
                                color: Color(0xFF9B9B9B), fontSize: 14.0),
                          ))
                    ],
                  ),
                ),
              //   xs: 11,
              //   sm: 10,
              //   md: 6,
              //   lg: 5,
              //   xl: 4,
              //   xxl: 4,
              //   xxxl: 3,
              //   xsLand: 10,
              //   smLand: 9,
              //   mdLand: 5,
              //   lgLand: 4,
              //   xlLand: 4,
              //   xxlLand: 3,
              //   xxxlLand: 3,
              // )
          //   ],
          // ),
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
    // widget.onDroppedFile(droppedFile);
    // DroppedFile()
    // setState(() {
    //   isHighlighted = false;
    // });
    setState(() {
      isHighlighted = false;
    });
  }
}

class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidLinearProgressIndicatorState();
}
class _AnimatedLiquidLinearProgressIndicatorState
    extends State<_AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:const  Duration(seconds: 10),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _animationController.value * 100;
    return Center(
      child: Container(
        width: double.infinity,
        height: 75.0,
        padding:const  EdgeInsets.symmetric(horizontal: 24.0),
        child: LiquidLinearProgressIndicator(
          value: _animationController.value,
          backgroundColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
          borderRadius: 12.0,
          center: Text(
            "${percentage.toStringAsFixed(0)}%",
            style:const  TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() =>
//       _AnimatedLiquidLinearProgressIndicatorState();
// }

// class _AnimatedLiquidLinearProgressIndicatorState
//     extends State<_AnimatedLiquidLinearProgressIndicator>
//     with SingleTickerProviderStateMixin {
//   AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 10),
//     );

//     _animationController.addListener(() => setState(() {}));
//     _animationController.repeat();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final percentage = _animationController.value * 100;
//     return Center(
//       child: Container(
//         width: double.infinity,
//         height: 75.0,
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: LiquidLinearProgressIndicator(
//           value: _animationController.value,
//           backgroundColor: Colors.white,
//           valueColor: AlwaysStoppedAnimation(Colors.blue),
//           borderRadius: 12.0,
//           center: Text(
//             "${percentage.toStringAsFixed(0)}%",
//             style: TextStyle(
//               color: Colors.lightBlueAccent,
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
