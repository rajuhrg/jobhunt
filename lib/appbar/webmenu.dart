
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobhunt/appbar/menucontroller.dart';

import 'package:jobhunt/utils/colors.dart';
import 'package:jobhunt/utils/constantss.dart';

MenuController controller = Get.put(MenuController());
class WebMenu extends StatelessWidget {
  const WebMenu({Key? key}) : super(key: key);

  //  WebMenu({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    
    return Obx(() =>
        Flex(
      direction: Axis.horizontal,
      children: List.generate(
        appbarItems.length,
            (index) => WebMenuItem(
          text: appbarItems[index],
          isActive: index == controller.selectedIndex,
          press: () => controller.setMenuIndex(index),
        ),
      ),
    ));
  }
}

class WebMenuItem extends StatefulWidget {
  const WebMenuItem(
      {Key? key,
        required this.isActive,
        required this.text,
        required this.press})
      : super(key: key);
  final bool isActive;
  final String text;
  final VoidCallback press;
  @override
  State<WebMenuItem> createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  late bool isDesktop;
  Color colortxt = const Color.fromRGBO(32, 33, 36, 1);
  // Color colortxt =Color(0xFF202124);

  bool isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return pbtnColor1;
    } else if (!widget.isActive & isHover) {
      return pColor.withOpacity(0.5);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
     
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: rDefaultDuration,
          // margin: EdgeInsets.only(left: 10.0,right: 5.0,top: 10, bottom: 5),
          // padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
          // padding: EdgeInsets.only(bottom: 3.0,left: 3.0,right: 3.0),
          // margin: EdgeInsets.symmetric(horizontal: scrwidth * 0.004),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: _borderColor(), width: 3),

              // color: widget.isActive ? rWhite : Colors.blue.shade600, width: 3,),
            ),
          ),
          child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colortxt,
                    fontWeight:
                    widget.isActive ? FontWeight.w900 : FontWeight.w700,
                    fontSize: 13,
                    fontFamily: "Roboto Mono",
                    fontStyle: FontStyle.normal
                  ),
                ),
              // ),
            
        ),
      ),
    );
  }
}