import 'package:get/get.dart';

class GetClimate extends GetxController {
  RxBool auto = true.obs;
  RxBool cool = false.obs;
  RxBool fan = false.obs;
  RxBool heat = false.obs;
  RxBool ac = false.obs;
  RxDouble value = 24.0.obs;

  setValue(double val) {
    value.value = val;
    if (value <= 20) {
      ac.value = true;
    } else {
      ac.value = false;
    }
  }

  setAuto() {
    auto.value = true;
    cool.value = false;
    fan.value = false;
    heat.value = false;
    ac.value = false;
    setValue(24.0);
  }

  setCool() {
    auto.value = false;
    cool.value = true;
    fan.value = false;
    heat.value = false;
    ac.value = false;
    setValue(18);
  }

  setFan() {
    auto.value = false;
    cool.value = false;
    fan.value = true;
    heat.value = false;
    ac.value = false;
    setValue(22);
  }

  setHeat() {
    auto.value = false;
    cool.value = false;
    fan.value = false;
    heat.value = true;
    ac.value = false;
    setValue(26.0);
  }

  setAc() {
    ac.toggle();
  }
}
