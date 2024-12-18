import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:get/get.dart';

class AccountSetupController extends GetxController {
  // Step completion status
  bool ownerDetailsCompleted = true;
  bool storeDetailsCompleted = true;
  bool businessDetailsCompleted = false;

  // Update completion state
  void updateBusinessDetails() {
    businessDetailsCompleted = !businessDetailsCompleted;
    update(); // Notify UI to rebuild
  }
}

