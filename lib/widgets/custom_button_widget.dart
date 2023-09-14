import 'package:film_app/utils/font.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.width = 180,
    this.height = 50,
  }) : super(key: key);

  final String label;
  final Widget? icon;
  final void Function()? onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: icon,
                ),
              Text(
                label,
                style: heading5SemiBold(color: Colors.white),
              ),
            ],
          ),
        ),
      );

  }
}
