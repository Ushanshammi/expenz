import 'package:expenz_app07/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color buttonColor;
  const CustomButton({
    super.key,
    required this.name,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: buttonColor,
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}
