import 'package:expenz_app07/constant/colors.dart';
import 'package:expenz_app07/constant/constant.dart';
import 'package:flutter/material.dart';

class SharedOnbordingScreen extends StatelessWidget {
  final String title;
  final String imagepath;
  final String dis;
  const SharedOnbordingScreen({
    super.key,
    required this.title,
    required this.imagepath,
    required this.dis,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagepath, width: 300, fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          Text(
            dis,
            style: TextStyle(
              fontSize: 16,
              color: kGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
