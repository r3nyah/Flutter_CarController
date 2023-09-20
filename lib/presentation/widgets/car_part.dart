import 'package:car_controller/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CarPart extends StatelessWidget {
  final bool state;
  final String name;
  final VoidCallback onTap;
  const CarPart(
      {super.key,
      required this.name,
      required this.onTap,
      required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 150,
      width: 180,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: state ? Colors.black.withOpacity(.5) : Colors.transparent,
              blurRadius: state ? 50 : 0)
        ],
        color: state ? Colors.grey : Colors.black.withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(name, 25, Colors.black, FontWeight.bold),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                  state ? "Opened" : "Closed",
                  20,
                  state ? Colors.black.withOpacity(.5) : Colors.white,
                  FontWeight.bold),
            ],
          ),
          const Spacer(),
          Transform.rotate(
            angle: -1.6,
            child: Transform.scale(
              scaleX: 1.5,
              scaleY: 1.5,
              child: Switch(
                activeColor: Colors.black.withOpacity(.5),
                activeTrackColor: Colors.grey,
                inactiveTrackColor: Colors.black.withOpacity(.5),
                value: state,
                onChanged: (value) => onTap(),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
