
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class DashBoardMenuControllerComp extends GetxController {
  final RxInt _dashSelectedItem = 5.obs;

  int get _dashSelectedIndex => _dashSelectedItem.value;

  // List<Map> get menuItems =>
  //     [
  //       {"s": "Services", "i": Icons.design_services},
  //       {"s": "Resource", "i": Icons.view_compact_outlined},
  //       {"s": "Login", "i": Icons.login_outlined}
  //     ];

  void dashsetMenuIndex(int index) {
    _dashSelectedItem.value = index;
    print("can go any where from here $index");
  }
}