import 'package:car_controller/common/services/get_navigation.dart';
import 'package:car_controller/presentation/screens/car.dart';
import 'package:car_controller/presentation/screens/climate.dart';
import 'package:car_controller/presentation/screens/profile.dart';
import 'package:floating_frosted_bottom_bar/app/frosted_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var light = false;
  var index = 0;
  GetNavigationBar controller = Get.put(GetNavigationBar());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: FrostedBottomBar(
          borderRadius: BorderRadius.circular(50),
          bottom: 10,
          opacity: 1,
          curve: Curves.easeInOut,
          bottomBarColor: Colors.grey.withOpacity(.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: TabBar(
              onTap: (value) {
                controller.setIndex(value);
              },
              indicatorColor: Colors.black,
              indicatorPadding: const EdgeInsets.symmetric(vertical: -8),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Obx(() => tabItem(controller.index.value == 0, Icons.home)),
                Obx(
                  () => tabItem(
                      controller.index.value == 1, Icons.control_camera),
                ),
                Obx(() => tabItem(controller.index.value == 2, Icons.person))
              ],
            ),
          ),
          body: (context, controller) {
            return TabBarView(
              children: [
                CarScreen(),
                Climate(),
                Profile(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget tabItem(bool state, IconData icon) {
    return state
        ? Icon(
            key: UniqueKey(),
            icon,
            color: Colors.black,
          )
        : Icon(
            key: UniqueKey(),
            icon,
            color: Colors.grey,
          );
  }
}
