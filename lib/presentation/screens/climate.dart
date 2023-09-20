import 'package:car_controller/common/services/get_climate.dart';
import 'package:car_controller/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Climate extends StatelessWidget {
  Climate({super.key});
  final GetClimate controller = Get.put(GetClimate());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 70,
          left: 20,
          right: 20,
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.grey.shade100,
              Colors.white,
            ])),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(
                    child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                )),
                TextWidget(
                  "Climate",
                  30,
                  Colors.black,
                  FontWeight.bold,
                  letterSpace: 6,
                ),
                Spacer(),
                // InkWell(
                //   child: Container(
                //     height: 40,
                //     width: 40,
                //     decoration: const BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.grey,
                //     ),
                //     child: const Center(
                //       child: Icon(
                //         Icons.sunny,
                //         color: Colors.black,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    circleButton(Icons.autorenew, "Auto", controller.auto.value,
                        () {
                      controller.setAuto();
                    }),
                    circleButton(
                        Icons.ac_unit_rounded, "Cool", controller.cool.value,
                        () {
                      controller.setCool();
                    }),
                    circleButton(
                        Icons.electric_bolt, "Fan", controller.fan.value, () {
                      controller.setFan();
                    }),
                    circleButton(Icons.sunny, "Heat", controller.heat.value,
                        () {
                      controller.setHeat();
                    }),
                  ],
                )),
            // const Spacer(),
            const SizedBox(
              height: 50,
            ),
            Obx(() => SleekCircularSlider(
                  innerWidget: (percentage) {
                    return Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                              percentage.toInt().toString(),
                              50,
                              Colors.black,
                              FontWeight.bold,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  appearance: CircularSliderAppearance(
                      customColors: CustomSliderColors(
                        gradientEndAngle: 100,
                        gradientStartAngle: 100,
                        trackColors: [
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black
                        ],
                        shadowColor: Colors.grey,
                        progressBarColors: [
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200,
                          Colors.grey.shade200
                        ],
                        shadowMaxOpacity: 10,
                        dotColor: Colors.grey,
                        dynamicGradient: true,
                      ),
                      animationEnabled: true,
                      counterClockwise: true,
                      size: 280,
                      spinnerMode: false,
                      startAngle: 0,
                      angleRange: 360),
                  initialValue: controller.value.value,
                  max: 100,
                  min: 0.0,
                  onChange: (value) async {
                    controller.setValue(value);
                  },
                )),
            // const Spacer(),
            const SizedBox(
              height: 75,
            ),
            Obx(() => Container(
                  padding: const EdgeInsets.only(right: 20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: controller.ac.value
                            ? Colors.grey
                            : Colors.grey.shade900.withOpacity(.1),
                        blurRadius: controller.ac.value ? 40 : 0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: controller.ac.value
                        ? Colors.grey
                        : Colors.grey.shade900.withOpacity(.1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            controller.ac.value
                                ? "AC is online"
                                : "AC is offline",
                            20,
                            Colors.black.withOpacity(.5),
                            FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            " Currently ${controller.value.value.ceil()} C",
                            20,
                            Colors.black.withOpacity(.5),
                            FontWeight.bold,
                          )
                        ],
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          activeTrackColor: Colors.grey.shade900,
                          activeColor: Colors.grey,
                          value: controller.ac.value,
                          onChanged: (value) => controller.setAc(),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget circleButton(
      IconData icon, String text_, bool state, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: state ? 20 : 0)
              ],
              color: state ? Colors.white : Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        TextWidget(
          text_,
          16,
          Colors.black,
          FontWeight.bold,
        )
      ],
    );
  }
}
