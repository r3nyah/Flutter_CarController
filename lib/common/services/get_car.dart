import 'package:get/get.dart';

class GetCar extends GetxController {
  RxBool engine = true.obs;
  RxBool door = true.obs;
  RxBool decklid = true.obs;
  RxBool climate = true.obs;

  setEngine() {
    engine.value = !engine.value;
  }

  setDoor() {
    door.value = !door.value;
  }

  setDecklid() {
    decklid.value = !decklid.value;
  }

  setClimate() {
    climate.value = !climate.value;
  }
}
