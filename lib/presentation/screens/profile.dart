import 'package:car_controller/common/services/get_car.dart';
import 'package:car_controller/presentation/widgets/car_part.dart';
import 'package:car_controller/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final GetCar controller = Get.put(GetCar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  left: 50,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 300,
                      width: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/IONIQ6.png'))),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 30,
                  right: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        'Hyundai',
                        30,
                        Colors.black,
                        FontWeight.bold,
                        letterSpace: 8.0,
                      ),
                      Spacer(),
                      // InkWell(
                      //   child: Container(
                      //     height: 40,
                      //     width: 40,
                      //     decoration: const BoxDecoration(
                      //       shape: BoxShape.circle,
                      //       color: Colors.black12,
                      //     ),
                      //     child: const Center(
                      //       child: Icon(
                      //         Icons.sunny,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 25,
                  child: TextWidget(
                    'Ioniq 6',
                    20.0,
                    Colors.grey.withOpacity(.5),
                    FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          
        ],
      ),
    ));
  }
}
