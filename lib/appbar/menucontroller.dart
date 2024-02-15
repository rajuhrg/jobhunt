import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MenuController extends GetxController {
  final RxInt _selectedItem = 5.obs;

  int get selectedIndex => _selectedItem.value;

  // List<Map> get menuItems =>
  //     [
  //       {"s": "Services", "i": Icons.design_services},
  //       {"s": "Resource", "i": Icons.view_compact_outlined},
  //       {"s": "Login", "i": Icons.login_outlined}
  //     ];

  void setMenuIndex(int index) {
    _selectedItem.value = index;
    print("can go any where from here $index");
  }
}
